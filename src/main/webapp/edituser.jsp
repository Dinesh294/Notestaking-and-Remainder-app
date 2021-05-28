<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User</title>
<style>
#firstdivs{
background-color: silver;
padding:35px;
margin:10px;
border:15px;
position:absolute;
left:50%;
top:50%;
transform: translate(-50%,-50%);
}

</style>

<script>
function validateForm(){
	if(document.getElementById("uname").value.length==0){
		alert("please provide username");
		return false;
	}
	
	if(document.getElementById("mail").value.length==0){
		alert("please provide Email Id");
		return false;
	}
	
	if(document.getElementById("phno").value.length==0){
		alert("please provide Phone Number");
		return false;
	}
	
	if(document.getElementById("phno").value.length!=10){
		alert("Incorrect Phone Number");
		return false;
	}
	
	if(document.getElementById("pass").value.length==0  ){
		alert("please provide Password");
		return false;
	} 
	
	if(document.getElementById("pass").value.length<8 || document.getElementById("pass").value.length>15  ){
		alert("password length should be 8 to 15 characters..");
		return false;
	} 
	

	
	

}

</script>
</head>
<body>
<div id="firstdivs">

<% 
int userid=0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps=con.prepareStatement("select userid from usercred where username=?");
	ps.setString(1,session.getAttribute("user").toString());
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		userid=rs.getInt("userid");
	}
}
catch(Exception e){
}


try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps1=con1.prepareStatement("select username,mailid,mobileno,password from usercred where userid=?");
	ps1.setInt(1,(Integer)userid);
	ResultSet rs=ps1.executeQuery();
	if(rs.next()){ %>

<form action="updateUser.jsp" method="post">
<label for="uname">User Name :</label>
<input type="text"  id="uname" name="username" value="<%= rs.getString("username") %>"/>
<br><br>

<label for="mail">Mail ID :</label>
<input type="text"  id="mail" name="maild" value="<%= rs.getString("mailid") %>"/>
<br><br>

<label for="phno">Phone Number :</label>
<input type="text"  id="phno" name="phonenumber" value="<%= rs.getString("mobileno") %>" />
<br><br>

<label for="pass">Password :</label>
<input type="password"  id="pass" name="password" />
<br><br>




<input type="submit" value="Edit" onclick="return validateForm()"/>

<br><br>
</form>

<% }
}
catch(Exception e){
	
}
	
	%>

<p style="color:red;">Note: All changes you made will be reflected in next login... </p>
</div>
</body>
</html>