<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function()
		{
	      $("#uploads").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/view.jsp");  
	    		  });
	      $("#profile").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/viewcandprofile.jsp");  
	    		  });
	      
		});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title> View Upload</title>
</head>
<body style="background-image: url('/Etalent/images/compose.jpg')" >
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
  <h2 align="center" style="color: white">Upload</h2>
  </div>
</nav>
<div class="container" style="background-color:grey; width:20% ;height:900px;float:left;margin:0px;border-radius: 20px">
<ul class="nav nav-pills nav-stacked" role="tablist">
<br>
<li><a id="uploads" href="#">View Uploads</a></li>
<li><a id="profile" href="#">Candidates Profile</a></li>
</ul>
</div>
<div id="divright" style="background-color:#baabee;height: 800px;width: 70%;margin-left: 300px;border-radius: 20px"></div>
<div style= "background-color:#cdadda; width:100% ;height:100px;float:left;">
</div>
</div>
<%} %>
</body>


</html>