<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <script>
var colarr=new Array(2);
colarr[0]="orange";
colarr[1]="yellow";
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
	setTimeout("blink()",500);	
}</script>
 --><script src="/Etalent/js/validation.js"></script>
<script>
function main()
{
	var userid=document.getElementById("txtuserid").value;
	var userpass=document.getElementById("txtuserpass").value;
	var regno=document.getElementById("txtregno").value;
	var cname=document.getElementById("txtcname").value;
	var address=document.getElementById("txtaddress").value;
	var email=document.getElementById("txtemail").value;
	var phone=document.getElementById("txtphoneno").value;
	var owner=document.getElementById("txtowner").value;
	var work=document.getElementById("txtworkarea").value;


	    
	if(checkEmpty(userid)==false)
		{
		
		document.getElementById("msgid").innerHTML="userid needed";
		document.getElementById("txtuserid").focus();
		return false;
		}
	if(checkEmpty(userpass)==false)
	{
	document.getElementById("msgid1").innerHTML="Password needed";
	document.getElementById("txtuserpass").focus();
	return false;
	}
	if(checkLength(userpass)==false)
	{
		document.getElementById("msgid1").innerHTML="Password should be upto 8 characters";
		document.getElementById("txtuserpass").focus(); 
		return false;
	}
	if(checkEmpty(regno)==false)
	{
	document.getElementById("msgid2").innerHTML="Please enter the registration no.of company";
	document.getElementById("txtregno").focus();
	return false;
	}
	if(checkEmpty(cname)==false)
	{
	document.getElementById("msgid3").innerHTML="Please enter the company name";
	document.getElementById("txtcname").focus();
	return false;
	}
	if(checkEmpty(address)==false)
	{
	document.getElementById("msgid4").innerHTML="Please enter the address";
	document.getElementById("txtaddress").focus();
	return false;
	}
	if(checkEmpty(email)==false)
	{
	document.getElementById("msgid5").innerHTML="Please enter the email";
	document.getElementById("txtemail").focus();
	return false;
	}
	if(checkEmpty(phone)==false)
	{
	document.getElementById("msgid6").innerHTML="Please enter the phone number";
	document.getElementById("txtphoneno").focus();
	return false;
	}
	if(checkEmpty(owner)==false)
	{
	document.getElementById("msgid7").innerHTML="Please enter the owner's name";
	document.getElementById("txtowner").focus();
	return false;
	}
	if(checkEmpty(work)==false)
	{
	document.getElementById("msgid8").innerHTML="Please enter the work area";
	document.getElementById("txtworkarea").focus();
	return false;
	}
		
	return true;
}
</script>
<title>Registration for professional</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="margin: 0px">
<div style="background-color:#addaaa; width:100% ;height:100%;background-image:url('/Etalent/images/Reg1.jsp')">
<div style="width:100%;height: 220px">
<img src="/Etalent/images/regprof.jpg" style=" width:100% ;height:220px">
</div>
<br><br>
<form onsubmit="return main()" action="/Etalent/RegisterProfessional" method="post">
<table class="table" align="center">
<tr><th>UserId</th><th colspan="2"> <input type="text" class="global" id="txtuserid" name="txtuserid"  placeholder="Enter the user id">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>UserPass</th><th colspan="2"><input type="password" class="global" id="txtuserpass" name="txtuserpass"  placeholder="Enter the user pass">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid1" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Registration no.</th><th colspan="2"><input type="text" class="global" id="txtregno" name="txtregno"  placeholder="Enter your name">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid2" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>

<tr><th>Company Name</th><th colspan="2"><input type="text" class="global" id="txtcname" name="txtcname"  placeholder="Enter company's name">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid3" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Address</th><th colspan="2"><input type="text" class="global" id="txtaddress" name="txtaddress"  placeholder="Enter your address">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid4" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Email</th><th colspan="2"><input type="email" class="global" id="txtemail" name="txtemail"  placeholder="Enter your email id">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid5" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>PhoneNo</th><th colspan="2"><input type="number" class="global" id="txtphoneno" name="txtphoneno" >
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid6" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Owner Name</th><th colspan="2"><input type="text" class="global" id="txtowner" name="txtowner" placeholder="Enter name of owner">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid7" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Work Area</th><th colspan="2"><input type="text" class="global" id="txtworkarea" name="txtworkarea" placeholder="Enter your work area">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid8" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr>
<th><input type="submit"></th>
</tr>
</table>
</form>
</div>
</body>
</html>