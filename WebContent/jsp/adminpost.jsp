<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<title>Posts</title>
</head>
<body style="background-image: url('/Etalent/images/post.jpg')">
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
  <h2 align="center" style="color: white">Post Events</h2>
  </div>
  </nav>
 <form action="/Etalent/AdminPost" method="post">
<table class="table" align="center">
<tr><th>Event Name</th><th colspan="2"> <input type="text" class="global" id="txteventname" name="txteventname"  placeholder="Enter the event name">
</th></tr>
<tr><th>Date</th><th colspan="2"> <input type="date" class="global" id="txtdate" name="txtdate"  placeholder="Enter the date">
</th></tr>
<tr><th>City</th><th colspan="2"> <input type="text" class="global" id="txtcity" name="txtcity"  placeholder="Enter the city">
</th></tr>
<tr><th>Venue Address</th><th colspan="2"> <input type="text" class="global" id="txtvenue" name="txtvenue"  placeholder="Enter the venue's address">
</th></tr>
<tr><th>Url Page</th><th colspan="2"> <input type="text" class="global" id="txturl" name="txturl"  placeholder="Enter the url address">
</th></tr>
<tr><th>Remarks</th><th colspan="2"> <input type="text" class="global" id="txtrem" name="txtrem"  placeholder="Enter the remarks!!">
</th></tr>
<tr><th colspan="2">
<button type="submit" class="btn btn-primary">Post</button>
</th></tr>
</table></form>
<a href="/Etalent/jsp/post.jsp">BACK</a>
  </div>
<%} %>
</body>
</html>