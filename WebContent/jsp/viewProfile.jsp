<%@page import="etalent.dbinfo.CrudOperation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
 <%String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Profile</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="margin: 0px">
<%
String picpath=null;
String imgname=null;
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
<div style="background-color:aqua;height:400px;width:70%;margin-left: 200px;margin-top:100px; border-radius: 30px">

<%String strsql="select * from candidatesinfo where userid=?";
ResultSet rs=CrudOperation.getData(strsql, uid);
if(rs.next())
{
	imgname=rs.getString("pic");
	if(imgname==null)
	{
		picpath="/Etalent/images/default.jpg";
		
	}
	else
	{ 
		picpath=basePath+uid+"/"+imgname;
		System.out.println(picpath);
	}
%>
<div style= "background-color:#dca9a0;width:100% ;height:500px;border-radius: 20px">
<I class="fnt">Your profile is...</I><br><br>
<div style="height: 200px;width: 200px;margin-left: 50px">
<img src="<%=picpath%>" style="width: 200px;height: 200px;margin-top: 10px">
</div>
<br><br>
<table><tr><th>NAME: </th>
<th><%=rs.getString("name") %></th></tr>
<tr><th>ADDRESS: </th><th>
<%=rs.getString("address") %>
</th></tr>
<tr><th>EMAIL: </th><th>
<%=rs.getString("email") %>
</th></tr>
<tr><th>PHONE: </th><th>
<%=rs.getString("phoneno") %>
</th></tr>
<tr><th>GENDER: </th><th>
<%=rs.getString("gender") %>
</th></tr>
</table>
<%} %>
</div>
</div>
<%} %>
</body>
