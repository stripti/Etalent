<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
        <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify Professionals</title>
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
<div style="width:50%;margin-left:300px;margin-top:100px; border-radius: 30px">

<%String strsql="select l.userid,cp.regnumber,cp.companyname from logininfo l,companyprofessionals cp where l.userid=cp.userid and l.status='false'";
ResultSet rs=CrudOperation.getData(strsql);
%>
<form method="post" action="/Etalent/UpdateStatus">
<br>
<%if(!rs.next())
{
%>
<div class="alert alert-info" align="center" style="color:red;margin-left:30px">There are no professionals to be verified!!
</div>
<%} 
else
{ %>
<table class="table" style="width: 100%">
<tr><th>Update</th><th>Registration No</th><th>Company Name</th><th>Userid</th></tr>
<%while(rs.next())
{%>
<tr><td align="center"><input id="chkupd" type="checkbox" name="chkupd" value="<%=rs.getString("userid")%> "></td>
<th><%=rs.getString("regnumber") %></th>
<th><%=rs.getString("companyname") %></th>
<th><%=rs.getString("userid") %></th></tr>
<%} %>
<tr><th colspan="4"><button type="submit" class="global">Update</button></th></tr>
</table>
</form>
</div>
<%}} %>
</body>
</html>