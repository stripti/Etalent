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
<title>Search Candidate</title>
<link rel="stylesheet" type="text/css" href="/Etalent/css/mystyle.css">
<script>
$(document).ready(function()
{
	$("#cmbskill").change(
			function()
			{
				var cid=this.value;
				
				$.get("/Etalent/jsp/adcandidatedetails.jsp",
					{
					skills:cid
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
<body style="margin: 0px">
<form method="post">
<table style="border-radius: 20px;background-color:threedlightshadow;width:700px">
<tr><th>Please select candidate whom you want to search</th>
<th><select name="cmbskill" id="cmbskill">
<option value="def">Select Skills</option>
<%String strsql="select * from candidatesinfo";
ResultSet rs=CrudOperation.getData(strsql);
while(rs.next())
{
%>
<option value="<%=rs.getString("skills") %>"><%=rs.getString("skills") %></option>
<%} %>
</th></tr>
</select>
</table>
</form>
<br><br>
<div id="divmsg" style= "background-color:#baabee; width:100% ;height:500px">

</div>
<a href="/Etalent/jsp/professionalProfile.jsp">BACK</a>
</body>
</html>