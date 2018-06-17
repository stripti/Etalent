<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>Login</title>
<script src="/Etalent/js/validation.js"></script>
<script>
var colarr=new Array(2);
colarr[0]="white";
colarr[1]="green";
var idx=0;
function blink()
{
	var di=document.getElementById("div1");
	di.style.color=colarr[idx];
	idx++;
	if(idx>1)
		{
		idx=0;
		}
	setTimeout("blink()",800);	
}</script>
<script>
function main()
{
	var userid=document.getElementById("txtuserid").value;
	var userpass=document.getElementById("txtuserpass").value;
    //alert(userid+" "+userpass);
	if(checkEmpty(userid)==false)
		{
		document.getElementById("msgid").style.display="block";
		document.getElementById("msgid").innerHTML="*Userid needed";
		document.getElementById("txtuserid").focus();
		return false;
		}
	if(checkEmpty(userpass)==false)
	{
    document.getElementById("msgid1").style.display="block";
    document.getElementById("msgid1").innerHTML="*Password needed";
	document.getElementById("txtuserpass").focus();
	return false;
	}
	
	if(checkLength(userpass)==false)
	{
		 document.getElementById("msgid1").style.display="block";
		document.getElementById("msgid1").innerHTML="Password should be upto 8 characters";
		document.getElementById("txtuserpass").focus();
		return false;
	}	
	return true;
}
</script>

<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body onload="blink()" style="margin: 0px">

<div style= "background-image:url(/Etalent/images/login.jpg); width:100% ;height:800px;float:left">
<%String message=(String)request.getAttribute("msg");
if(message!=null)
{
%>
<div class="alert alert-danger" style="font-size: 20px;margin-top: 20px">
    <strong>Danger!</strong> <%=message %>
  </div>
<%}%>
<div style="height:100px;width: 400px;margin-left: 500px;margin-top: 100px" align="center">
<h1 color="green" id="div1">Login here!!</h1>
</div>
<div style="background-color:aqua;width:600px;height:250px ;margin-left: 400px;margin-top:100px; border-radius: 20px">
<form onsubmit="return main()" action="/Etalent/Login" method="post">
<table style="background-color:#baedad;width:100%;height:250px;border-radius: 20px" align="center" >
<tr><th>UserId</th><th>
<input type="text" class="global" id="txtuserid" name="txtuserid"  placeholder="Enter the userid ">
</th></tr>
<tr><td>
<div class="alert alert-info" align="center"id="msgid" style="color:red;display: none;margin-left:30px">
</div>
</td></tr>
<tr><th>UserPass</th><th><input type="password" class="global" id="txtuserpass" name="txtuserpass"  placeholder="Enter the userpass">
</th></tr>
<tr><td>
<div class="alert alert-info" align="center"id="msgid1" style="color:red;display: none;margin-left:30px">
</div>
</td>
</tr>
<tr><th colspan="2"><button type="submit" class="btn btn-success btn-lg">Submit</button></th></tr>

</table>
</form>
</div>
</div>
</body>
</html>