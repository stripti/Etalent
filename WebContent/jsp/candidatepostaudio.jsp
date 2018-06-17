<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body>
<form action="/Etalent/UploadAudio" method="post" enctype="multipart/form-data">
<div style="margin-top: 60px;margin-left: 350px"><h1 class="fnt">Post your audios here..</h1></div>
DESCRIPTION<input type="text" name="txtdesc">
<br><br>
<input type="file" name="fl"/>
<br>
<button type="submit" class="btn btn-success btn-lg">UPLOAD</button>
</form>
</body>
</html>