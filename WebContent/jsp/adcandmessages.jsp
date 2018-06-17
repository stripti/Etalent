<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function()
		{
	      $("#compose").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/adcandcompose.jsp");  
	    		  });
	      $("#inbox").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/adcandinbox.jsp");  
	    		  });
	      $("#sent").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/adcandsentitem.jsp");  
	    		  });

		});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>Messages</title>
</head>
<body style="background-image: url('/Etalent/images/letter.jpg')" >
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
  <h2 align="center" style="color: white">Messaging Area</h2>
  </div>
</nav>
<div class="container" style="background-color:grey; width:20% ;height:900px;float:left;margin:0px;border-radius: 20px">
<ul class="nav nav-pills nav-stacked" role="tablist">
<br>
<li class="active"><a href="#">Home</a></li>
<li><a id="compose" href="#">Compose</a></li>
<li><a id="inbox" href="#">Inbox</a></li>
<li><a id="sent" href="#">Sent Items</a></li>
</ul>
</div>
<div id="divright" style="height: 800px;width: 70%;margin-left: 300px;border-radius: 20px">
<img src="/Etalent/images/compose.jpg" style="width: 100%;height: 100%"></div>
<div style= "background-color:#cdadda; width:100% ;height:100px;float:left;">
<h2 style="font-family: monospace">Created by Tripti Singh and Shweta Singh</h2>

</div>
</div>
<%} %>
</body>


</html>