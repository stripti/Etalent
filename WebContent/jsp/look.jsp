<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.*,etalent.dbinfo.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<title>View</title>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
</head>
<body style="background-image:url('/Etalent/images/look.jpg');margin: 0px">
<%	String c_id=request.getParameter("userid");
String strsql="select distinct(filetype) from uploaddetails where userid=?";
ResultSet rs=CrudOperation.getData(strsql, c_id);
while(rs.next())
{
	String ft=rs.getString("filetype");
%>
<div>
<table class="table">
<tr><th><%=ft%></th></tr>
<%
String str="select filename from uploaddetails where userid=? and filetype=?";
ResultSet rs1=CrudOperation.getData(str,c_id,ft);
while(rs1.next())
{
	String fname=rs1.getString("filename");%>
<tr><th><a href="/Etalent/jsp/showuploads.jsp?usid=<%=c_id%>&type=<%=ft%>&fname=<%=fname%>"><%=rs1.getString("filename") %></a></th></tr>
<%}}%>
</table>
</div>
</body>
</html>