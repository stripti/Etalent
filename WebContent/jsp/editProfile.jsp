<%@page import="etalent.dbinfo.CrudOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Profile</title>
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
<div style="background-color:aqua;width:350px;margin-left: 300px;margin-top:200px; border-radius: 20px">
<%String strsql="select * from candidatesinfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, uid);
if(rs.next())
{%>
<form method="post" action="/Etalent/UpdateProfile">
<table class="table" align="center" >
<tr><th>Address</th><th> <input type="text" class="global" id="txtaddress" name="txtaddress" value="<%=rs.getString("address") %>" placeholder="Enter the address">
</th></tr>
<tr><th>Email</th><th> <input type="email" class="global" id="txtemail" name="txtemail" value="<%=rs.getString("email") %>" placeholder="Enter the email id">
</th></tr>
<tr><th>Phone</th><th> <input type="number" class="global" id="txtphone" name="txtphone" value="<%=rs.getLong("phoneno") %>"  placeholder="Enter the phone number">
</th></tr>
<tr><th colspan="2"><button type="submit" class="global">Update</button></th></tr></table>
</form>
<%} %>
</div>
<%} %>
</body>
</html>