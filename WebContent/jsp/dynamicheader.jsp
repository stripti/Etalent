<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String name=request.getParameter("pic");
String path="/Etalent/images/"+name;
%>


<div style="width:100%;height: 200px;background-image:url('<%=path%>');">

</div>