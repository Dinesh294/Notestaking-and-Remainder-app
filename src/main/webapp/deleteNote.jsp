<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Note</title>
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

String notename=request.getParameter("deletenote");
try{
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 

PreparedStatement ps1=con1.prepareStatement("delete from notecred where notename=?");

ps1.setString(1, notename);

out.println("<br><br>");
int result=ps1.executeUpdate();
if(result==1){%>
<p style="color:red";>Data Deleted Successfully </p>
<% }
else{%>
<p style="color:red";>Error in  Deleting </p>
<% }

}
catch(Exception e){

}

%>
<br>
<br>
<a href="Home.jsp" >View notes</a>
</div>
</body>
</html>