<%
/******************************************************************************
*
* File:         PaymentResponse.jsp
* Description:  Trgovceva spletna stran prejme z metodo POST podatke o
*               stanju placila, ki ga je kupec opravila na placilni strani (HPP)
*               v Bankartovem placilnem sistemu ACI Commerce Gateway (CGw).
*               Nato se poda link na stran na katero se preusmeri kupca in so na
*               njej prikazani podatki o stanju placila.
* Author:       Igor Rozman
* Created:      20.10.2008
* Modified:     29.10.2008
*				16.11.2011 - dodana podpora za eci vrednosti
* Language:     Java (v 1.6)
* Package:      paymentpipejsp (testna koda ze testiranje spletnih transakcij)
*
* (c) Copyright 2008, Bankart d.o.o., all rights reserved.
*
******************************************************************************/
%>
<%@ page import="java.io.*"%>
<%@ page language="java" session="true"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.e24PaymentPipe"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.Order"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.truck.util.ConstProp"%>

<%
    // House to work with the database
	Order nar = new Order(ConstProp.getE24PPDatabaseHost(), 
    							ConstProp.getE24PPDatabasePort(), 
    							ConstProp.getE24PPDatabaseName(), ConstProp.getE24PPDatabaseTableName(), 
    							ConstProp.getE24PPDatabaseUsername(), ConstProp.getE24PPDatabasePassword());
    							
   
	
	// Capture data on the state of payments made by the system CGW sent with the POST method.
	String errMsg = request.getParameter("Error");
    String url;

    // Whether there has been an error in billing.
    if (errMsg != null)
    {
		String payID        = request.getParameter("paymentid");
		String errText    	= request.getParameter("ErrorText");

        // Read the contract from the base.
	   if (nar.fetch(payID) != 0)
        {
            //url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Orders are + not + development. Problems + + for + reading + from + base + orders.";
			url = "REDIRECT="+ ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Orders are + not + development. Problems + + for + reading + from + base + orders.";
        }
        else
        {
            // Prepare data for the refreshment of the contract base in case of an error.
            nar.setPaymentID(payID);
            nar.setErrMsg(errMsg);
            nar.setErrText(errText);
            // Osvezimo narocilo v bazi narocil.
            if (nar.updateErr() != 0)
            {
                // Follow the diversion traders URL of the notification of the defect.
                //url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Purchase + are + not + development. Problems + + in + refreshing + from + base + orders.";
				url = "REDIRECT="+ ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Purchase are not development. Problems in refreshing from base orders.";
				
            }
            else
            {
                // Record URL link to the trader's website in which the system CGW redirect the customer. Attention: Before the URL is
                //mandatory state set"REDIRECT=" !!!
				//url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=" + errText;
				url = "REDIRECT="+ ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=" + errText;
            }
		}		
    }
    else
    {
	    // Capture data on the state of payments made by the system CGW sent with the POST method.
		String payID        = request.getParameter("paymentid");
		String result       = request.getParameter("result");
		String responsecode = request.getParameter("responsecode");
		String postdate     = request.getParameter("postdate");
		String udf1         = request.getParameter("udf1");
		String udf2         = request.getParameter("udf2");
		String udf3         = request.getParameter("udf3");
		String udf4         = request.getParameter("udf4");
		String udf5         = request.getParameter("udf5");
		String tranid       = request.getParameter("tranid");
		String auth         = request.getParameter("auth");
		String trackid      = request.getParameter("trackid");
		String reference    = request.getParameter("ref");
		String eci    		= request.getParameter("eci");

		// Read the contract from the base.
        if (nar.fetch(payID) != 0)
        {
            //url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Purchase + are + not + development. Problems + + for + reading + from + base + orders.";
			url = "REDIRECT="+ ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Purchase are not development. Problems for reading from base orders.";
        }
        else
        {
           // Prepare data for the refreshment of the contract base.
             // In the case of Authorization will result Approved or Not Approved.
             // If the results of the Purchase or Not Captured Captured.
            nar.setResult(result);
            nar.setAuth(auth);
            nar.setRef(reference);
            nar.setTranID(tranid);
            nar.setPostDate(postdate);
            nar.setTrackID(trackid);
            nar.setudf1(udf1);
            nar.setudf2(udf2);
            nar.setudf3(udf3);
            nar.setudf4(udf4);
            nar.setudf5(udf5);
            nar.setResponseCode(responsecode);
            nar.setPaymentID(payID);
			nar.seteci(eci);
			
         
            // Refresh Purchase orders in the database.
            if (nar.update() != 0)
            {
               
                    // Follow the diversion traders URL of the notification of the defect.
                //url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Purchase + are + not + development. Problems + + in + refreshing + from + base + orders.";
				url = "REDIRECT="+ ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Purchase + are + not + development. Problems + + in + refreshing + from + base + orders.";
            }
            else
            {
                
                 // Record URL link to the trader's website in which the system CGW redirect the customer. Attention: Before the URL is
                 // Should be compulsory to indicate the string "REDIRECT =" !!!
                //url = "REDIRECT=http://celovska150.no-ip.info/paymentpipejsp/PaymentReceipt.jsp?paymentid=" + payID;
				 url = "REDIRECT="+ ConstProp.getE24PPReceiptURL() +"?paymentid=" + payID;
            }
        }
    }
    out.print(url);
    out.flush();
    out.close();
%>
