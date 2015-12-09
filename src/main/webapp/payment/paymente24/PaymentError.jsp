<%
/******************************************************************************
*
* File:         PaymentError.jsp
* Description:  Trgovceva spletna stran, ki prejme z metodo GET podatek o
*               vrsti napake, ki se je zgodila pri placilu, ki ga je kupec
*               opravil na placilni strani (HPP) v Bankartovem placilnem sistemu
*               ACI Commerce Gateway (CGw).
* Author:       Igor Rozman
* Created:      20.10.2008
* Modified:     29.10.2008
* Language:     Java (v 1.6)
* Package:      paymentpipejsp
*
* (c) Copyright 2008, Bankart d.o.o., all rights reserved.
*
******************************************************************************/
%>

<HTML>
<%@ page language="java" session="true"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.truck.util.ConstProp"%>
<HEAD>
	<meta http-equiv="content-type" content="text/html; charset=windows-1250"> 
	<title>Error Message</title>
</HEAD>


<BODY bgcolor="#99CCCC">

<center><h1>Error Message</h1>

<p>
When processing your order error occured. For details, please contact your dealer.</p>

<p>An error message:<b>

</b></p>
<p><a href="index.jsp">
<%
out.print(request.getParameter("ErrorTx"));
%>
Back to the start page.</a></p>
<p>Copyright Bankart d.o.o.</p>
</center>
</BODY>
</HTML>

