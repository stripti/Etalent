<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.Date" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">

<title>Candidate Profile</title>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<script>
$(document).ready(function()
		{
	      $("#div").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/uploadpic.jsp");  
	    		  });
	      $("#div1").click(function()
	    		  {
	    			$("#divright").load("/Etalent/jsp/editProfile.jsp");  
	    		  });
	      $("#div2").click(function()
	    	      {
	    	   		$("#divright").load("/Etalent/jsp/viewProfile.jsp");  
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
</head>
<body style="margin: 0px">
<%
HttpSession hs=request.getSession(false);

ServletContext sc=hs.getServletContext();
int c=(Integer)sc.getAttribute("count");

String uid=(String) hs.getAttribute("userinfo");

if(uid==null || hs.isNew())
{
	request.setAttribute("msg","This is unauthorised access");
	RequestDispatcher rd=request.getRequestDispatcher("/jsp/login.jsp");
	rd.forward(request,response);
}
else
{
	String utype=(String) hs.getAttribute("ut");
	String picname=utype+".jpg";
%>
<div style= "background-color:#eeddbb; width:100% ;height:100%;float:left">
<jsp:include page="/jsp/dynamicheader.jsp">
<jsp:param value="<%=picname %>" name="pic"/>
</jsp:include>
<nav class="navbar navbar-inverse ">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/Etalent/html/Etalent.html">E-Talent Hunt</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a id="div" href="#">Upload Profile pic</a></li>
      <li><a id="div1" href="#">Update Profile</a></li>
      <li><a id="div2" href="#">View Profile</a></li>
      <li><a href="/Etalent/jsp/candmessages.jsp">Communicate</a></li>
      <li><a href="/Etalent/jsp/candidatepost.jsp">Post</a></li>
    </ul>
     <ul class="nav navbar-nav navbar-right">
     <li><a href="/Etalent/jsp/feedback.jsp"><span class="glyphicon glyphicon-envelope"></span>Feedback</a></li>
     <li><a id="btnlogout" href="#"><span class="glyphicon glyphicon-log-out"></span>LogOut</a></li>
     </ul>
  </div>
</nav>
<div id="divright" style="background-color:#eeddbb;height: 700px;width: 100%"></div>
</div>

<%} %>
</body>
</html>