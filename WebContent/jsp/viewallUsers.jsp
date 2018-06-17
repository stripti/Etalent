<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>View Users</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="margin: 0px">
<%
HttpSession hs=request.getSession(false);

String uid=(String) hs.getAttribute("userinfo");

if(uid==null || hs.isNew())
{
	request.setAttribute("msg","This is unauthorised access");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request,response);
}
else
{
	
%>
<div style="background-color:aqua;height:400px;width:35%;margin-left: 400px;margin-top:100px; border-radius: 30px">
<table class="table" style="height: 100%;width: 100%">
<tr><th>USERID</th><th>USERPASS</th><th>USERTYPE</th></tr>
<%String strsql="select * from logininfo";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{%>
<tr>
<td align="center"><%=rs.getString("userid") %></td>
<td align="center"><%=rs.getString("userpass") %></td>
<td align="center"><%=rs.getString("usertype") %></td>
</tr>
<%} %>
</table>
</div>
<%} %>
</body>
</html>