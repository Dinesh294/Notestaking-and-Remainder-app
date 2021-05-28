<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Note</title>
<style>
body{
background-color: silver;
}
div{
display:block;
padding:10px;
margin:5px;


}

</style>
</head>
<body>
<div>

<%
try{
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 

PreparedStatement ps1=con1.prepareStatement("update notecred set notename=?,startdate=?,enddate=?,remainderdate=?,tag=?,description=?,status=? where notename=?");

ps1.setString(1, request.getParameter("notename"));
ps1.setString(2,request.getParameter("startdate"));
ps1.setString(3,request.getParameter("enddate"));
ps1.setString(4,request.getParameter("remainderdate"));
ps1.setString(5,request.getParameter("tag"));
ps1.setString(6,request.getParameter("description"));
ps1.setString(7,request.getParameter("status"));
ps1.setString(8,request.getParameter("notename"));
out.println("<br><br>");
int result=ps1.executeUpdate();
if(result==1){%>
	<p style="color:red";>Data uploaded Successfully </p>
<% }
else{%>
	<p style="color:red";>Error in  uploading </p>
<% }

}
catch(Exception e){%>
<p style="color:red";>Error in  uploading </p>
<% }

%>
<br>
<br>
<a href="Home.jsp" >View notes</a>
</div>
</body>
</html>