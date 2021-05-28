<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="org.jdbc.ValidateUser" %>
<div  style="background-color:#BEBEBE;padding:50px;border:10px">
<%
String username =request.getParameter("user"); 
String pass =request.getParameter("pass");

 

ValidateUser vuser=new ValidateUser(); 

int var=vuser.validateLogin(username,pass);

if(var==0) { 
	session.setAttribute("user", username);
	response.sendRedirect("Home.jsp");
	 }
else if(var==1){
	out.println(" Password is wrong!!..");
}
else if(var==2)
	out.println("UserName or Password is wrong!!! ");  

else
	out.println("Error in Login in . Try again");

%> 
 <p> For Login? <a href="index.jsp">Login in</a> </p> 
 
  <p> For Sign Up?  <a href="SignUp.jsp">Sign Up</a> </p>


</div>
</body>
</html>