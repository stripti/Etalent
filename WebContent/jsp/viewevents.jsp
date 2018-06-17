<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<title>View Events</title>
</head>
<body style="background-image:url('/Etalent/images/events.jpg');margin: 0px">

<div style="margin-top: 60px;margin-left: 350px"><h1 class="fnt">The upcoming events are..</h1></div>
<div style="background-color:aqua;width:90%;margin-left: 100px;margin-top:100px; border-radius: 30px">
<table class="table" style="height: 100%;width: 100%">
<tr><th>Posts</th></tr>
<%
java.util.Date d=new java.util.Date();
java.sql.Date sd=new java.sql.Date(d.getTime());
String strsql="select * from events where date>=? ";
ResultSet rs=CrudOperation.getData(strsql,sd);
while(rs.next())
{
%>
<tr><td>
<h3>Event Name: <%=rs.getString("eventname") %></h3>
<h3>Date: <%=rs.getString("date") %></h3>
<h3>City: <%=rs.getString("city") %></h3>
<h3>Venue: <%=rs.getString("venueaddress") %></h3>
<h3>Remarks: <%=rs.getString("remarks") %></h3>
<h3>For more details, please do visit the link:<a href="<%=rs.getString("urlpage")%>">here</a></h3>
</td></tr>
<%} %>
</table>
</div>

</body>
</html>