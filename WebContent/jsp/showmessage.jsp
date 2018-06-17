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
<title>Show Message</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="background-image:url('/Etalent/images/showmessage.jpg');margin: 0px">
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
<div style="background-image:url('/Etalent/images/mess.jpg');height:400px;width:70%;margin-left: 200px;margin-top:100px; border-radius: 30px">
<%
String messageid=request.getParameter("mid");
String pagename=request.getParameter("pname");
int id=Integer.parseInt(messageid);
String sql=null;
String url=null;
if(pagename.equals("sent"))
{
	url="/Etalent/jsp/sentitem.jsp";
	sql="Select msgtext from sentitems where msgid=?";
}
else if(pagename.equals("inbox"))
{
url="/Etalent/jsp/inbox.jsp";
sql="Select msgtext from inbox where msgid=?";
}
ResultSet rs=CrudOperation.getData(sql, id);
if(rs.next())
{
%>
<div><br><div style="margin-top: 60px;margin-left: 350px"><h1 class="fnt">The message is given below:</h1></div>
<div style="margin-left: 150px;margin-top: 100px"><%=rs.getString("msgtext") %>
</div>
</div>
<%} %>
<a href="<%=url%>">BACK</a>
</div>
<%} %>
</body>
</html>