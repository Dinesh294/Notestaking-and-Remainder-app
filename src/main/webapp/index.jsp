<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html> 

<head> 
<meta charset="ISO-8859-1">

<title>Login</title>
</head> 

<link  rel="stylesheet" type="text/css" href="login.css" />
<body> 
 <div class="bef">
<form id="form1" action="ValidateLogin.jsp" method="post" onsubmit="return CheckUser()" >

<div class="login">
<label for="user"> User Name: </label> 

<input type="text" name="user" id="user" >    <!-- onblur="CheckUser(form1)"> -->
<br><br><br>
<label for="pass"> PassWord: </label> 

<input type="password" name="pass" id="pass" >   <!--  onblur="CheckPass(form1)">  -->
<br><br><br>
<input type="submit" value="Login" >

<!-- <form action="#" ><input type="button" value="Sign Up"></form> --> 
<br> <br>

<p> Not a User? <a href="SignUp.jsp">Sign Up</a> </p>

</div>

</form>
 </div>

<script>
 function CheckUser(){
	if(document.getElementById("user").value.length==0 ){ 
		alert("Please Provide a UserName");  
		document.getElementById("user").style.borderColor="red"; 
		return false;
	}
	else if(document.getElementById("pass").value.length==0 ){
		alert("Please Provide a Password");  
		document.getElementById("pass").style.borderColor="red"; 
		return false;
	}
	
	else 
	{
		 return true;
	}
	
}  
 


</script>


</body>
</html>
