<%@page import="com.sits.general.ReadProps"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="myCks.jsp"%>
<html>
<head>
<meta name="viewport" content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no' />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<title><%=ReadProps.getkeyValue("welcome.title","sitsResource")%></title>
<link rel="shortcut icon" href="images/img-cuk/cuk-logo.png"> 
<%
	response.setHeader("Cache-Control","no-store"); //HTTP 1.1
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");   
	response.setHeader("Pragma","no-cache"); //HTTP 1.0
	response.setDateHeader ("Expires", -1); //prevents caching at the proxy
	String dashAction="";
	if(user_dashboard.equals("Y")) {
		dashAction="dashboard.jsp";
	} else {
		dashAction="";
	}
%>

</head>
<frameset rows="113,30,*" framespacing="0" border = "0" frameborder="no" id="itree_tab_msg_h">
	<frame name="soatop" src="header.jsp" scrolling="no" />
	<frame name="soatop1" src="sub_header.jsp" scrolling="no" />
	<!-- <frame name="soatop2" src="agentMailSend.jsp" scrolling="no" />-->
	<frameset cols="300,*,0" framespacing="0" border = "0" frameborder="no" id="itree_tab_msg" >
		<frame name="soaleft" cols="*" id="isoaleft" src="leftmenu.jsp" scrolling="no" style='background: #201212 !important;' noresize>
		<frame name="soaright" src="midpage.jsp?pcheck=0" scrolling="no" style="background: #201212; border-style: " noresize>
	</frameset>
</frameset>
</html>