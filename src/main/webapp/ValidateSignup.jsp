<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<body> 


<%@ page import="org.jdbc.ValidateUser" %>

<div style="background-color:#BEBEBE;padding:50px;border:10px"> 
<% 
String username=request.getParameter("user");
String password=request.getParameter("pass1");
String mailid=request.getParameter("mail");
String mobileno=request.getParameter("mobileno");  

ValidateUser vs=new ValidateUser();  
//PrintWriter out=response.getWriter(); 
int var=vs.validateSignup(username, password, mailid, mobileno);
if(var==0) {
	
	out.println("Account Created Successfully......Login Now"); 
	
}
else if(var==1)  {
	out.println("Username already exists.. try different name"); 

} 
else if(var==2){
	out.println("mailid already exists.. try different mail"); 
}
else if(var==3){
	out.println("mobile number already exists.. try different mobile number"); 
}
else {
	out.println("There was a problem in creating account....Please try again");
} 
 
 %>
 
 <p> For Login? <a href="index.jsp">Login in</a> </p> 
 
  <p> For Sign Up?  <a href="SignUp.jsp">Sign Up</a> </p>
  </div>

</body>
</html>