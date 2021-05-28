<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title> 
<link  rel="stylesheet" type="text/css" href="login.css" />
</head>
<body>

<div class="bef">
<form action="ValidateSignup.jsp" onsubmit="return Validateform()" method="post">  

<div class="signup">
<label for="user"> User Name: </label> 

<input type="text" name="user" id="user">
<br><br><br>
<label for="mail">Mail Id:</label>

<input type="text" id="mail" name="mail" >
<br><br><br>

<label for="mobileno">Mobile No: </label> 
<input type="text" id="mobileno" name="mobileno" >

<br><br><br>
<label for="pass"> PassWord: </label> 

<input type="password" name="pass" id="pass"> 
<br><br><br> 

<label for="pass1"> Re-Enter PassWord: </label> 

<input type="password" name="pass1" id="pass1"> 
<br><br><br>
<input type="submit" value="Sign Up">  

<p> Already a User? <a href="index.jsp">Login</a> </p>

</div>

</form> 

</div> 

<script>
function Validateform(){
	if(document.getElementById("user").value.length==0){alert("Please Provide a UserName");return false;}
	if(document.getElementById("mail").value.length==0){alert("Please Provide a MailId");return false;} 
	if((document.getElementById("mobileno").value).toString().length==0){alert("Please Provide a Mobile Number");return false;} 
	
	if(document.getElementById("pass").value.length==0 || document.getElementById("pass1").length==0 ){alert("Please Provide a Passwordr");return false;} 
	
	if(document.getElementById("pass").value.length<8 || document.getElementById("pass").value.length>15){
		alert("password length should be 8 to 15 characters..");
		return false;
	}
	
	if(document.getElementById("pass").value != document.getElementById("pass1").value){
		alert("Password Mismatch");
		return false;
	}



}



</script>

</body>
</html>