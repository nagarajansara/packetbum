<%
/******************************************************************************
*
* File:         index.jsp
* Description:  Zacetna stran v kateri se nastavijo nekatere lastnosti placilne
*               transakcije ter lastnosti placilne strani (HPP). Nato se naredi
*               preusmeritev na stran s kodo, ki sprovede placilni tok transakcije.
* Author:       Igor Rozman
* Created:      21.01.2009
* Modified:		16.09.2011
*				Dodana podpora za Void Authorization
* Language:     Java (v 1.6)
* Package:      paymentpipejsp (testna koda ze testiranje spletnih transakcij)
*
* (c) Copyright 2009, Bankart d.o.o., all rights reserved.
*
******************************************************************************/



%>
<%@ page language="java" session="true"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<HTML>
<SCRIPT LANGUAGE="JavaScript">

function checkField(vrstaT, paymentID)
{
    if (vrstaT.value == '5' && paymentID.value == '')
    {
        alert('In the CAPTURE the transaction must be entered PaymentID of prior authorization.');
        return false;
    }
	//MK Void Authorization
	if (vrstaT.value == '9' && paymentID.value == '')
    {
        alert('When VOID AUTHORIZATION transaction must be entered PaymentID of prior authorization.');
        return false;
    }
    return true;
}
function pbOnloadData()
{
	document.getElementById("pbPipePayment").submit();
}
</SCRIPT>
<HEAD>
	<meta http-equiv="content-type" content="text/html; charset=windows-1250"> 
	<TITLE>Settings transactions - JSP:</TITLE>

	<style>
		#pbPipePayment
		{
			display: none;
		}
	</style>

	<%@ page import="com.truck.util.ConstProp"%>
	
</HEAD>

<BODY onload="pbOnloadData()" bgcolor="#99CCCC">

<%!

	
	double ONE_DOLLAR_EQUAL_ERUO = 1.131;
	double ONE_ERUO = 1;

	double getAmount(String originalAmount)
	{
		double amount = 0;
		double convertAmount = 0;
		if(originalAmount != null)
		{
			double tempAmount = Double.parseDouble(originalAmount);
			convertAmount = tempAmount * (ONE_DOLLAR_EQUAL_ERUO - ONE_ERUO);
			amount = tempAmount + convertAmount;
		}	
		return amount;
	}
%>

<CENTER>
<P>
	<!--<h1>Settings transactions - JSP:</h1>-->
	<h1>Please wait ....</h1>
</P>

<FORM id="pbPipePayment" NAME="formTest" ACTION="Payment.jsp" METHOD="POST" ONSUBMIT="return checkField(formTest.vrstaTran, formTest.payID)">
<TABLE>
  <TR>
    <TD colspan="2" align="center">
      <HR>
    </TD>
  </TR>
  <TR>
    <TD width="40%">Type of transaction (action):</TD>
    <TD><select type="text" name="vrstaTran">
      <option value='4' selected="vrstaTran">4</option>
      <option value="1">"1 - Purchase"</option>
      <option value="2">"2 - Credit"</option>
      <option value="3">"3 - Void Purchase"</option>
      <option value="4">"4 - Authorization"</option>
      <option value="5">"5 - Capture"</option>
      <option value="6">"6 - Void Credit"</option>
      <option value="7">"7 - Void Capture"</option>
      <option value="9">"9 - Void Authorization"</option>
    </select></TD>
  </TR>
  <TR>
    <TD width="40%">value of Purchase (amount):</TD>
    <TD><input size="20" type="text" name="vrednost" value=<%= getAmount(request.getParameter("amount")) %> /></TD>
  </TR>
  <TR>
    <TD width="40%">currency (currency):</TD>
    <TD><input size="3" type="text" name="valuta"
      value='978' /></TD>
  </TR>
  <TR>
    <TD width="40%">language (language):</TD>
    <TD><select type="text" name="vrstaJezika">
      <option value="SI">SI</option>
      <option value="BS">"BS - Bosanscina"</option>
      <option value="DE">"DE - Nemscina"</option>
      <option value="ESP">"ESP - Spanscina"</option>
      <option value="HR">"HR - Hrvascina"</option>
      <option value="HU">"HU - Madzarscina"</option>
      <option value="IT">"IT - Italijanscina"</option>
      <option value="RUS">"RUS - Ruscina"</option>
      <option value="SI">"SI - Slovenscina"</option>
      <option value="SR">"SR - Srbscina"</option>
      <option value="US" selected="US - Anglescina">"US - Anglescina"</option>
    </select></TD>
  </TR>
   <TR>
    <TD width="40%">URL accepts (response URL):</TD>
    <TD><input size="70" type="text" name="responseURL"
      value=<% out.println(ConstProp.getE24PPSuccessResponseURL()); %> /> </TD>
  <TR>
    <TD colspan=2>In this title shall be enforced acceptance of messages on the status of the transaction (Payments sent to the server).</TD>
  </TR>
  <TR>
    <TD width="40%">URL error (error URL):</TD>
    <TD><input size="70" type="text" name="errorURL"
      value=<% out.println(ConstProp.getE24PPErrorResponseURL()); %> /> </TD>
  </TR>
  <TR>
    <TD colspan=2>If the error occurred in this title shall be adopted by an error message(Payments sent to the server).</TD>
  </TR>  
  <TR>
    <TD width="40%">PaymentID:</TD>
    <TD><input size="20" type="text" name="payID" value='' /> </TD>
  </TR>
  <TR>
    <TD colspan=2>In successive transaction (Capture) is required to enter the PaymentID previous transactions (Authorization).</TD>
  </TR>
  <TR>
    <TD colspan="2" align="center">
      <HR>
    </TD>
  </TR>
  <TR>
    <TD width="40%">File with the input data (resource file):</TD>
    <TD><input size="50" type="text" name="resourcePath"
      value=<% out.println(ConstProp.getE24PPCGNPath()); %> /> </TD>
  </TR>
  <TR>
    <TD width="40%">Name of the terminal (terminal alias):</TD>
    <TD><input size="50" type="text" name="terminalAlias"
      value=<% out.println(ConstProp.getE24PPTerminalAlias()); %> /> </TD>
  </TR>
  <TR>
    <TD colspan="2" align="center">
      <HR>
    </TD>
  </TR>
  <TR>
    <TD width="40%"></TD>
    <TD><input type="Submit" value="Commit the transaction" /></TD>
  </TR>
</TABLE>
</FORM>
<!--<p>Copyright Bankart d.o.o.</p>-->
</CENTER>
</BODY>
</HTML>
