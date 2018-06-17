<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="etalent.dbinfo.CrudOperation"%>
    <%@ page import="java.sql.*"%>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="/Etalent/bootfiles/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width,initial-scale=1">
<script src="/Etalent/bootfiles/bootstrap.min.js"></script>
<link rel="stylesheet"  href="/Etalent/bootfiles/bootstrap.min.css"> 
<title>View</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<script>
$(document).ready(function()
{
	$("#cmbid").change(
			function()
			{
				var cid=this.value;
				
				$.get("/Etalent/jsp/look.jsp",
					{
					userid:cid
					},
					function(data,status){
						
						$("#divmsg").html(data);
						$("#divmsg").show();
						//$("#divmsg").hide(5000);
					});
				
				
		    });
});
</script>
</head>
<body style="background-image:url('/Etalent/images/look.jpg');margin: 0px">
<br><br>
<form method="post">
<table style="border-radius: 20px;background-color:threedlightshadow;width:700px">
<tr><th>Please select candidate whose uploads you want to search..</th>
<th><select name="cmbid" id="cmbid">
<option value="def">Select Candidate</option>
<%String strsql="select distinct(userid) from uploaddetails";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
%>
<option value="<%=rs.getString("userid") %>"><%=rs.getString("userid") %></option>
<%} %>
</th></tr>
</select>
</table>
</form>
<br><br>
<div id="divmsg" style= "background-color:#baabee; width:100%">

</div>
</body>
</html>