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
<title>Sent Items</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="background-image:url('/Etalent/images/inbox.jpg');margin: 0px">
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
<div style="margin-top: 60px;margin-left: 350px"><h1 class="fnt">Please, tick if you want to delete messages...</h1></div>
<div style="background-color:aqua;width:90%;margin-left:100px;margin-top:100px; border-radius: 30px">
<%String strsql="select * from sentitems where senderid=?";
ResultSet rs=CrudOperation.getData(strsql,uid);
%>
<form action="/Etalent/DeleteMessage" method="post">
<input type="hidden" name="txthid" value="sent"/>
<%if(!rs.next())
{
%>
<div class="alert alert-info" align="center" style="color:red;">There are no messages!!
</div>
<%} 
else
{ %>
<table class="table" style="width: 100%">
<tr><th>Delete</th><th>Receiver ID</th><th>Subject</th><th> Date</th></tr>
<%if(rs.next())
{
	String str="Select s.msgid,s.receiverid,s.subject,s.date from sentitems s,logininfo l where s.receiverid=l.userid and l.usertype='professional'";
	ResultSet rs1=CrudOperation.getData(str);
	while(rs1.next())
	{
	String msid=rs1.getString("msgid");

%>
<tr><th><input type="checkbox" name="chkdel" value="<%=rs1.getString("msgid")%>"/></th>
<th><%=rs1.getString("receiverid") %></th>
<th><a href="/Etalent/jsp/showmessage.jsp?mid=<%=msid%>&pname=sent"><%=rs1.getString("subject")%>
</a></th>
<th><%=rs1.getString("date")%></th></tr>
<%}%>
<tr><th colspan="4" align="center"><button type="submit" class="btn btn-info btn-lg">Delete</button>
</th></tr></table>
</form>
</div>
<%} %>
<h1><a href="/Etalent/jsp/adprofmessages.jsp">No,Thanks</a></h1>
<%}} %>
</body>
</html>