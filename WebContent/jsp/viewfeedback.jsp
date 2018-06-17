<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<title>View Feedback</title>
</head>
<body style="background-image:url('/Etalent/images/events.jpg');margin: 0px">

<div style="margin-top: 60px;margin-left: 350px"><h1 class="fnt">The feedbacks are..</h1></div>
<div style="background-color:aqua;width:90%;margin-left: 100px;margin-top:100px; border-radius: 30px">
<table class="table" style="height: 100%;width: 100%">
<tr><th>Userid</th><th>Feedback</th></tr>
<%
String strsql="select * from feedback ";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
%>
<tr><th><%=rs.getString("userid") %></th>
<th><%=rs.getString("contents") %></th></tr>
<%} %>
</table>
</div>

</body>
</html>