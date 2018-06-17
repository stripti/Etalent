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
<title>Details</title>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
</head>
<body style="margin: 0px">
<%	String c_id=request.getParameter("skills");
String strsql="select *from candidatesinfo where skills=?";
ResultSet rs=CrudOperation.getData(strsql, c_id);
%>
<table style="border-radius: 20px;background-color:threedlightshadow;width:700px">
<tr><th>User Id</th><th>Name</th><th>Email</th></tr>
<%while(rs.next())
	{String uid=rs.getString("userid");

%>
<tr><th><a href="/Etalent/jsp/showdetails.jsp?usid=<%=uid%>"><%=rs.getString("userid") %></a></th>
<th><%=rs.getString("name") %></th>
<th><%=rs.getString("email") %></th>

<%} %>
</table>

</body>
</html>