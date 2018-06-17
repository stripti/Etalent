<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>Feedback</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="margin: 0px;background-image:url(/Etalent/images/wall.jpg)">
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
{%>
<div style= "width:100% ;height:1000px">
<div style= "background-image:url(/Etalent/images/feedback.jpg); width:100% ;height:200px"></div>
<br><br>
<form action="/Etalent/Feedbackinsert" method="post">
<table class="table" align="center">
<tr><th>Text</th><th colspan="2"><input type="text" class="global" id="txtarea" name="txtarea" placeholder="Give your feedback here!"> 
</th></tr>
<tr><th>
<button type="submit" class="btn btn-primary">Submit</button>
</th></tr>
</table>
</form>
</div>
<%}%>
</body>
</html>