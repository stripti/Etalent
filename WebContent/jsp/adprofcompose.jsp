<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<title>Compose</title>
</head>
<body>
<form action="/Etalent/Composeprof" method="post">
<table class="table" align="center">
<tr><th>Receiver's Id</th><th colspan="2"><input type="text" class="global" id="txtrecid" name="txtrecid"  placeholder="Enter the Receiver's Id">
</th></tr>
<tr><th>Subject</th><th colspan="2"><input type="text" class="global" id="txtsub" name="txtsub"  placeholder="Enter the Subject">
</th></tr>
<tr><th>Text</th><th colspan="2"><input type="text" class="global" id="txtarea" name="txtarea" placeholder="Type the message here!"> 
</th></tr>
<tr><th colspan="3" align="center">
<button type="submit" class="btn btn-primary">Compose</button>
</th></tr>
</table>
</form>
</body>
</html>