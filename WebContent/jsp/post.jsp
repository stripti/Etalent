<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">

<title>Post Events</title>
</head>
<body style="background-image: url('/Etalent/images/post.jpg')" >
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
<div style="width: 100%;height: 100%">
 <nav class="navbar navbar-inverse">
  <div class="container-fluid" style= "width:100% ;height:80px">
  <h2 align="center" style="color: white">Post Upcoming Events</h2>
  </div>
</nav>
<div class="container" style="background-color:grey; width:20% ;height:900px;float:left;margin:0px;border-radius: 20px">
<ul class="nav nav-pills nav-stacked" role="tablist">
<br>
<li class="active"><a href="#">Home</a></li><br>
<li><a href="/Etalent/jsp/adminpost.jsp">Post Events</a></li><br>
<li><a href="/Etalent/jsp/viewevents.jsp">View Events</a></li><br>
</ul>
</div>
<div id="divright" style="background-color:#baabee;height: 800px;width: 70%;margin-left: 300px;border-radius: 20px">
<div style="margin-top: 60px;margin-left: 350px"><h1 class="font">You can post upcoming events here..</h1></div>
</div>
<div style= "background-color:#cdadda; width:100% ;height:100px;float:left;">
<h2 style="font-family: monospace">Created by Tripti Singh and Shweta Singh</h2>
</div>
</div>
<%} %>
</body>


</html>