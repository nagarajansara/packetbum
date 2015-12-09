<%
/******************************************************************************
*
* File:         PaymentReceipt.jsp
* Description:  Trgovceva spletna stran, ki prejme z metodo GET podatek o
*               IDju transakcije, ki jo je kupec opravil na placilni strani (HPP)
*               v Bankartovem placilnem sistemu ACI Commerce Gateway (CGw).
* Author:       Igor Rozman
* Created:      20.10.2008
* Modified:     25.02.2009
* Language:     Java (v 1.6)
* Package:      paymentpipejsp
*
* (c) Copyright 2008, Bankart d.o.o., all rights reserved.
*
******************************************************************************/
%>

<HTML>
<HEAD>
<%@ page language="java" session="true"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.aciworldwide.commerce.gateway.plugins.Order"%>
<%@ page import="com.truck.util.ConstProp"%>
<TITLE>Raèun o plaèilu</TITLE>
</HEAD>

<BODY bgcolor="#99CCCC">
<center><h1>Account about plaèilu</h1>

<%
   // Ajami paymentid, to ga system CGw to z method GET.
    String payID = request.getParameter("paymentid");
    
	// Dispatch base.
	 Order nar = new Order(ConstProp.getE24PPDatabaseHost(), 
    							ConstProp.getE24PPDatabasePort(), 
    							ConstProp.getE24PPDatabaseName(), ConstProp.getE24PPDatabaseTableName(), 
    							ConstProp.getE24PPDatabaseUsername(), ConstProp.getE24PPDatabasePassword());
    							
    

    // Ce information o paymentid not give, the occured do system errors.
    if (payID == null)
    {
        //response.sendRedirect(response.encodeRedirectURL("http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Napaka+pri+prenosu+PaymentIDja+transakcije."));
		response.sendRedirect(response.encodeRedirectURL(ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Error in transfer PaymentID transactions."));
        return;
    }
    else
    {
        // Build in record Purchase in  base.
        if (nar.fetch(payID) != 0)
        {
            //response.sendRedirect(response.encodeRedirectURL("http://celovska150.no-ip.info/paymentpipejsp/PaymentError.jsp?ErrorTx=Tezave+pri+branju+podatkov+o+narocilu+iz+baze+narocil."));
			response.sendRedirect(response.encodeRedirectURL(ConstProp.getE24PPErrorResponseURL() +"?ErrorTx=Problems with reading  data the carte of base orders."));
            return;
        }
      
        if (nar.getResult().equals("CAPTURED") || nar.getResult().equals("APPROVED"))
        { ; %>
            <FONT size="5" color="GREEN">
              The transaction the granted. Thanks to purchase.<BR>
            </FONT>
<%   
        } else { ; 
%>
            <FONT size="5" color="RED">
              The transaction not managed. Please try again.<BR>
            </FONT>
<%   
        }
    }  
%>
    <TABLE>
      <TR>
        <TD colspan="2" align="center">
        <FONT size="4"><B>Details of the transaction
        <br>(collected from the Merchant Notification Message)</B></FONT>
        </TD>
      </TR>
      <TR>
        <TD colspan="2" align="center">
        <HR>
        </TD>
      </TR>
      <TR>
        <TD width="40%">Track ID</TD>
        <TD><% out.print(nar.getTrackID()); %></TD>
      </TR>
      <TR>
        <TD>Transaction Date</TD>
        <TD><% out.print(nar.getTranDate()); %></TD>
      </TR>
      <TR>
        <TD>Order Details</TD>
        <TD><% out.print(nar.getOrderDetails()); %></TD>
      </TR>
      <TR>
        <TD>Currency</TD>
        <TD><% out.print(nar.getCurrency()); %></TD>
      </TR>
      <TR>
        <TD>Amount</TD>
        <TD><% out.print(nar.getAmount()); %></TD>
      </TR>
      <TR>
        <TD>Post Date</TD>
        <TD><% out.print(nar.getPostDate()); %></TD>
      </TR>
      <TR>
        <TD>Result Code</TD>
        <TD><% out.print(nar.getResult()); %></TD>
      </TR>
      <TR>
        <TD>Payment ID</TD>
        <TD><% out.print(nar.getPaymentID()); %></TD>
      </TR>
      <TR>
        <TD>Transaction ID</TD>
        <TD><% out.print(nar.getTranID()); %></TD>
      </TR>
      <TR>
      </TR>
      <TR>
        <TD colspan="2" align="center">
        <FONT size="4"><B>Details of the customer
        <br>(collected from trgovèeve website)</B></FONT>
        </TD>
      </TR>
      <TR>
        <TD colspan="2" align="center">
        <HR>
        </TD>
      </TR>
      <TR>
        <TD>Customer IP</TD>
        <TD><% out.print(nar.getCustomerIP()); %></TD>
      </TR>
      <TR>
        <TD>Customer Name</TD>
        <TD><% out.print(nar.getName()); %></TD>
      </TR>
      <TR>
        <TD>Address 1</TD>
        <TD><% out.print(nar.getAddr1()); %></TD>
      </TR>
      <TR>
        <TD>Address 2</TD>
        <TD><% out.print(nar.getAddr2()); %></TD>
      </TR>
      <TR>
        <TD>Address 3</TD>
        <TD><% out.print(nar.getAddr3()); %></TD>
      </TR>
      <TR>
        <TD>City</TD>
        <TD><% out.print(nar.getCity()); %></TD>
      </TR>
      <TR>
        <TD>State</TD>
        <TD><% out.print(nar.getState()); %></TD>
      </TR>
      <TR>
        <TD>Postal Code</TD>
        <TD><% out.print(nar.getPostalCode()); %></TD>
      </TR>
	  <TR>
        <TD colspan="2" align="center">
        <HR>
      </TD>
      </TR>
    </TABLE>
<p><a href="index.jsp">Back to the start page.</a></p>
<p>Copyright Bankart d.o.o.</p>
<%	
    out.flush();
    out.close();
%>
</CENTER>
</BODY>
</HTML>