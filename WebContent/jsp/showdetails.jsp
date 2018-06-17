<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>    
    <%String path=request.getContextPath();
    String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<title>Show Details</title>
</head>
<body style="background-image:url('/Etalent/images/talent hunt4.jpg');margin: 0px">
<%String picpath=null;
String imgname=null;
 %>
<div style="background-color:aqua;height:400px;width:70%;margin-left: 200px;margin-top:100px; border-radius: 30px">
<%
String userid=request.getParameter("usid");
String	url="/Etalent/jsp/searchcand.jsp";
String	sql="Select * from candidatesinfo where userid=?";

ResultSet rs=CrudOperation.getData(sql, userid);
if(rs.next())
{imgname=rs.getString("pic");
if(imgname==null)
{
	picpath="/Etalent/images/default.jpg";
	
}
else
{ 
	picpath=basePath+userid+"/"+imgname;
}
%>
<div style= "background-color:#dca9a0;width:100% ;height:500px;border-radius: 20px">
<I class="fnt">The details of the candidate you requested to see are:</I><br><br>
<div style="height: 200px;width: 200px;margin-left: 50px">
<img src="<%=picpath%>" style="width: 200px;height: 200px;margin-top: 10px">
</div>
<h4>Name: <%=rs.getString("name") %></h4>
<h4>Email: <%=rs.getString("email") %></h4>
<h3 class="font">For further details, please do registration <a href="/Etalent/jsp/registrationProf.jsp">here.</a></h3>
</div>
<%} %>
<a href="<%=url%>">BACK</a>
</div>
</body>
</html>