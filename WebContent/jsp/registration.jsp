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
	var name=document.getElementById("txtname").value;
	var address=document.getElementById("txtaddress").value;
	var phone=document.getElementById("txtphoneno").value;
	var skills=document.getElementById("txtskills").value;
	    
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
	if(checkEmpty(name)==false)
	{
	document.getElementById("msgid2").innerHTML="Please enter the name";
	document.getElementById("txtname").focus();
	return false;
	}
	if(checkEmpty(address)==false)
	{
	document.getElementById("msgid3").innerHTML="Please enter the address";
	document.getElementById("txtaddress").focus();
	return false;
	}
	if(checkEmpty(phone)==false)
	{
	document.getElementById("msgid4").innerHTML="Please enter the phone number";
	document.getElementById("txtphoneno").focus();
	return false;
	}
	if(checkEmpty(skills)==false)
	{
	document.getElementById("msgid5").innerHTML="Please enter the skills";
	document.getElementById("txtskills").focus();
	return false;
	}
	var chkarr=document.getElementsByName("gender");
	if(checkCtrl(chkarr)==false)
		{document.getElementById("msgid6").innerHTML="Please enter the gender ";
		return false;
		}
	
	return true;
}
</script>
<title>Registration Candidates</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
</head>
<body style="margin: 0px">
<div style="background-color:#eeaadd; width:100% ;height:1000px;background-image:url('/Etalent/images/Reg1.jsp')">
<div style="width:100%;height: 220px">
<img src="/Etalent/images/Reg.jpg" style=" width:100% ;height:220px">
</div>
<br><br>
<form onsubmit="return main()" action="/Etalent/RegisterCandidate" method="post">
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
<tr><th>Name</th><th colspan="2"><input type="text" class="global" id="txtname" name="txtname"  placeholder="Enter your name">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid2" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Address</th><th colspan="2"><input type="text" class="global" id="txtaddress" name="txtaddress"  placeholder="Enter your address">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid3" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>PhoneNo</th><th colspan="2"><input type="number" class="global" id="txtphoneno" name="txtphoneno" >
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid4" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr><th>Skills</th><th colspan="2"><input type="text" class="global" id="txtskills" name="txtskills" placeholder="Enter your Skills">
</th></tr>
<tr><td colspan="2"><div>
<h4 id="msgid5" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<!-- <tr><th>Email(not mandatory)</th><th colspan="2"><input type="email" class="global" id="txtemail" name="txtemail"  placeholder="Enter your email id">
</th></tr>

<tr><th>Picture(not mandatory)</th><th colspan="2"><input type="file" name="fl"/><button type="submit">UPLOAD</button>
</th></tr>
 -->
<tr><th>Gender</th>
<td><input type="radio" name="gender" value="male">Male</td>
<td><input type="radio" name="gender" value="female">Female</td>
</tr>
<tr><td colspan="2"><div>
<h4 id="msgid6" style="color:red;text-transform: uppercase;"></h4></div></td>
</tr>
<tr>
<th><input type="submit"></th>
<th></th>
<th><input type="reset"></th>
</tr>
</table></form>
</div>
</body>
</html>