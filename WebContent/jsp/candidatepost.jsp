<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function()
		{
	      $("#video").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/candidatepostvideo.jsp");  
	    		  });
	      $("#audio").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/candidatepostaudio.jsp");  
	    		  });
	      $("#images").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/candidatepostimages.jsp");  
	    		  });

		});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">

<title>Upload</title>
</head>
<body style="background-image: url('/Etalent/images/look.jpg')" >
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
<li><a id="video" href="#">Upload Videos</a></li>
<li><a id="audio" href="#">Upload Audio</a></li>
<li><a id="images" href="#">Upload Images</a></li>
</ul>
</div>
<div id="divright" style="background-color:#baabee;height: 800px;width: 70%;margin-left: 300px;border-radius: 20px">
<div style="margin-top: 60px;margin-left: 350px"><h1 class="font">Post your files here..</h1></div>
</div>
<div style= "background-color:#cdadda; width:100% ;height:100px;float:left;">
<h2 style="font-family: monospace">Created by Tripti Singh and Shweta Singh</h2>
</div>
</div>
<%} %>
</body>


</html>