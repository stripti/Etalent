<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function()
		{
	      $("#div").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/adsearchcand.jsp");  
	    		  });
	      $("#div1").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/view.jsp");  
	    		  });

	    });
</script>
<script>
$(document).ready(function()
		{
	      $("#btnlogout").click(function()
	    		  {
	    			window.location.href="/Etalent/Logout";
	    		  });
		});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>Professional Profile</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
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
{String utype=(String) hs.getAttribute("ut");
String picname=utype+".jpg";
	
%>

<div style= "background-color:#baabee; width:100% ;height:100%;float:left">
<jsp:include page="/jsp/dynamicheader.jsp">
<jsp:param value="<%=picname %>" name="pic"/>
</jsp:include>
<nav class="navbar navbar-inverse ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/Etalent/html/Etalent.html">E-Talent Hunt</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="div" href="#">Search candidates</a></li>
      <li><a href="/Etalent/jsp/candmessages.jsp">Communicate</a></li>
      <li><a id="div1" href="#">View Uploads</a></li>
      
      </ul>
     <ul class="nav navbar-nav navbar-right">
     <li><a href="/Etalent/jsp/feedback.jsp"><span class="glyphicon glyphicon-envelope"></span>Feedback</a></li>
     <li><a id="btnlogout" href="#"><span class="glyphicon glyphicon-log-out"></span>LogOut</a></li>
     </ul>
  </div>
</nav>
<div id="divright" style="background-color:#baabee;height: 700px;width: 100%"></div>
</div>
<%} %>
</body>
</html>