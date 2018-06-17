<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>    
    <%String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<title>Show Uploads</title>
</head>
<body style="background-color:orange;background-image:url('/Etalent/images/uploads.jpg');margin: 0px">
<%
String picpath=null;
 %>
<div style="width:70%; border-radius: 30px">
<%
String userid=request.getParameter("usid");
String ftype=request.getParameter("type");
String picname=request.getParameter("fname");
picpath=basePath+userid+"/"+ftype+"/"+picname;
%>
<%if(ftype.equals("video"))
{
	response.setContentType("video");
%>
<div style="margin-top: 60px;margin-left: 350px;float:left"><h1 class="font"><%=picname%></h1></div>
<video src="<%=picpath%>" controls="controls" loop="loop" autoplay="autoplay" style="width:100%;height:100%;margin-left:50px;float: left" align="center">
</video>
<%} %>
<%if(ftype.equals("audio"))
{
 %>
 <div style="margin-top: 60px;margin-left: 350px;float:left"><h1 class="font"><%=picname%></h1></div>
 <audio src="<%=picpath%>" controls="controls" loop="loop" autoplay="autoplay" style="margin-left:50px"></audio>
<%} %>
<%if(ftype.equals("image"))
{
 %>
 <div style="margin-top: 60px;margin-left: 350px;float:left"><h1 class="font"><%=picname%></h1></div>
 <img src="<%=picpath%>" style="width:100%;height:100%;float: left;margin-left:50px" align="center">
<%} %>
</div>
<div style="width:100%;height:100px;float: left"><br><h3><a href="/Etalent/jsp/view.jsp">BACK</a></h3>
</div>
</body>
</html>