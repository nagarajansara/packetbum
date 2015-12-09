<%
/******************************************************************************
*
* File:         Payment.jsp
* Description:  In the event that the type of transaction or Purchase Authorization
*               the initialization of online payment and then
*              	Conversion of the buyer on the payment page (HPP) in Bankartov
*               Payment System ACI Commerce Gateway (CGW).
*               In the case of parallel transactions Capture message is sent
*               on the implementation of Capture via the POST method in Bankartov payment system CGW.
* Author:       Igor Rozman
* Created:      17.10.2008
* Modified:     21.01.2009
*               Added support for a pair of consecutive transactions (Authorization -> Capture)
*               26.01.2009
*               Added the recording of transactions in the database Capture type contracts.
*				16.9.2011
*				Additional support for the Void Authorization
* Language:     Java (v 1.6)
* Package:      paymentpipejsp (test code already testing online transactions)
*
* (c) Copyright 2008, Bankart d.o.o., all rights reserved.
*
******************************************************************************/
%>
<HTML>
<HEAD>

<%@ page import="java.util.Date"%>
<%@ page import="java.util.UUID"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.e24PaymentPipe"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.Order"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.DateUtils"%>
<%@ page import="com.truck.util.ConstProp"%>
</HEAD>

<%
	// Pridobim kupcev IP naslov.
	String ipAddr = request.getHeader("HTTP_X_FORWARDED_FOR");
	if (ipAddr == null) 
	{
		ipAddr = request.getRemoteAddr();
	} 
%>

<BODY bgcolor="#99CCCC">
<%
    // Preko objekta v vticniku "e24PaymentPipe.jsp", vnese
    // dealer details of the intended purchase for the purpose of initialization HPP page.
	e24PaymentPipe pipe = new e24PaymentPipe();

    // Facility to work with the records in the database of orders.
    Order nar = new Order(ConstProp.getE24PPDatabaseHost(), 
    							ConstProp.getE24PPDatabasePort(), 
    							ConstProp.getE24PPDatabaseName(), ConstProp.getE24PPDatabaseTableName(), 
    							ConstProp.getE24PPDatabaseUsername(), ConstProp.getE24PPDatabasePassword());


	
	

 // Path to a resource file by the trader gets on its website CGW system. In it,
    // The encrypted data is needed to connect to the CGW system. Since the resource file unpacks
    // In the temporary file must be permission for the folder in which it is located resource file
    // Set addition to reading on writing.
	pipe.setResourcePath(request.getParameter("resourcePath"));

	// Alias to traders terminal. This information is obtained on the merchants website in CGW.
	pipe.setAlias(request.getParameter("terminalAlias"));

	// POST captures transaction data and setting HPP site.
	     // Type of transaction.
    pipe.setAction(request.getParameter("vrstaTran"));

 // Sum of purchase.
    pipe.setAmt(request.getParameter("vrednost"));

 // In the case of transactions Purchase or Payment Authorization build and implement Init Message
    // Stream of payments.
    if (pipe.getAction().equals("1") || pipe.getAction().equals("4"))
	{
    	// Cash currency 978 - Euro.
        pipe.setCurrency(request.getParameter("valuta"));
     // The language to be displayed on the HPP site.
        pipe.setLanguage(request.getParameter("vrstaJezika"));
        // URL address to which they send information about the status of the payment after the customer enters information about
        // Debit card at the HPP site.
        pipe.setResponseURL(request.getParameter("responseURL"));
         // URL address to which the customer is redirected in case of system failure.
        pipe.setErrorURL(request.getParameter("errorURL"));
     // Additional fields, which are currently not intended to be used.
        pipe.setUdf1("JSP plugin");
        pipe.setUdf2("YourUserDefinedField2");
        pipe.setUdf3("YourUserDefinedField3");
        pipe.setUdf4("YourUserDefinedField4");
        pipe.setUdf5("YourUserDefinedField5");
     // The TrackID need a unique ID, in this case, is used as the current time.
        pipe.setTrackId(String.valueOf(UUID.randomUUID())); 

     // --------- Send a request to purchase or initialization. HPP. ------------------------
        if (pipe.performPaymentInitialization() != pipe.SUCCESS)  
        	// Initialize failed
        {
        	// Follow the diversion traders URL of the notification of the defect.
		    response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=" + pipe.getErrorMsg()));
		    return;
        }
        else  // Successful initialization
        {
        	// The order records in the database.
            nar.setPaymentID(pipe.getPaymentId());
            nar.setCurrency(pipe.getCurrency());
            nar.setAmount(Double.parseDouble(pipe.getAmt()));
            nar.setOrderDetails("Tralala...");
            nar.setTrackID(pipe.getTrackId()); //a unique ID, which is dependent on the time when the function is called
            nar.setTranDate(DateUtils.now());
            nar.setName("Igor Rozman");
            nar.setAddr1("Matjazeva 5");
            nar.setAddr2("-");
            nar.setAddr3("-");
            nar.setCity("Ljubljana");
            nar.setState("Slovenija");
            nar.setPostalCode(1000);
            nar.setCustomerIP(ipAddr);

         // The order records in the database.
            if (nar.commit() != 0)
            {
            	// Follow the diversion traders URL of the notification of the defect.
			    response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=Purchase are not development. Problems in the record base orders."));
                return;
            }

         	//Redirect the Buyer to the HPP, whose URL was obtained from the initialization message.
            response.sendRedirect(response.encodeRedirectURL(pipe.getPaymentPage() + "?PaymentID=" + pipe.getPaymentId()));
            return;
        }
    }

 // In the case of successive transactions Capture following transaction Authorization,
    // Build a Payment Message and sends it to the server paying CGW.
    if (pipe.getAction().equals("5"))
    {
		String msgStr;
		// Traders a unique transaction ID through which a trader can be in your system Find information
        // Of purchase.
        pipe.setPaymentId(request.getParameter("payID"));

     // Read the data from the database of a contract.
        if (nar.fetch(pipe.getPaymentId()) != 0)
        {
            response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=Failed to read the data on the previous transaction in the database."));
            return;
        }
     // From the base of orders we need the following two pieces of information TransactionID and TrackID.
        pipe.setTransId(nar.getTranID());
        pipe.setTrackId(nar.getTrackID());

     // Send request to the CAPTURE transaction.
		if (pipe.performTransaction() != pipe.SUCCESS)
        {
            nar.setResult("NOT CAPTURED");
            msgStr = "capturing transactions, paymentID = " + pipe.getPaymentId() + ", not performed. (NOT CAPTURED)<b>" + pipe.getErrorMsg() + "</b>";
        }
        else
        {
           nar.setResult("CAPTURED");
           msgStr = "capturing transactions, paymentID = " + pipe.getPaymentId() + ", It has successfully implemented. (CAPTURED)";
        }


		// Capture transaction records in the database of orders as a new transaction. Most of the data is taken from the corresponding
		         // Authorization transaction. The new date of the transaction, traders TrackID transactions and the sum of the Capture, which is
		         // May be smaller than it was in the Authorization.
        nar.setTranDate(DateUtils.now());
        nar.setTrackID(String.valueOf(UUID.randomUUID()));
        nar.setAmount(Double.parseDouble(pipe.getAmt()));
        nar.setCustomerIP(ipAddr);
        if (nar.commit() != 0)
        {

        	// Follow the diversion traders URL of the notification of the defect.
            response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=The transaction is not  wrote in base."));
            return;
        }
        out.print(msgStr);
    }	
	
 // MK Void Authorization
    // In the case of successive transactions Void Authorization, following the transaction, Authorization,
    // Build a Payment Message and sends it to the server paying CGW.  
    if (pipe.getAction().equals("9"))
    {
		String msgStr;
		// Traders a unique transaction ID through which a trader can be in your system Find information
        // Of purchase.
        pipe.setPaymentId(request.getParameter("payID"));

     // Read the data from the database of a contract.
        if (nar.fetch(pipe.getPaymentId()) != 0)
        {
            response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=Failed to read the data on the previous transaction in the database."));
            return;
        }
     // From the base of orders we need the following two pieces of information TransactionID and TrackID.
        pipe.setTransId(nar.getTranID());
        pipe.setTrackId(nar.getTrackID());


     // Send the request for VOIDED transaction.
        if (pipe.performTransaction() != pipe.SUCCESS)
        {
            nar.setResult("NOT VOIDED");
            msgStr = "capturing transactions, paymentID = " + pipe.getPaymentId() + ", not performed. (NOT VOIDED)<b>" + pipe.getErrorMsg() + "</b>";
        }
        else
        {
            nar.setResult("VOIDED");
            msgStr = "capturing transactions, paymentID = " + pipe.getPaymentId() + ", It has successfully implemented. (VOIDED)";
        }


     // Void Authorization transaction records in the database of orders as a new transaction. Most of the data is taken from the corresponding
              // Authorization transaction. The new date of the transaction, traders TrackID transactions and the sum of the VOIDED is
              // May be smaller than it was in the Authorization.
        nar.setTranDate(DateUtils.now());
        nar.setTrackID(String.valueOf(UUID.randomUUID()));
        nar.setAmount(Double.parseDouble(pipe.getAmt()));
        nar.setCustomerIP(ipAddr);
        if (nar.commit() != 0)
        {
        	// Follow the diversion traders URL of the notification of the defect.
            response.sendRedirect(response.encodeRedirectURL(pipe.getErrorURL() + "?ErrorTx=The transaction is not  wrote in base ."));
            return;
        }
        out.print(msgStr);
    }
%>
<p>Copyright Bankart d.o.o.</p>
</BODY>
</HTML>
