<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Notebook</title>
<style type="text/css">
body{
background-color: silver;
}
#firstdiv{
padding:50px;
margin:10px;
border:5px;
background-color: silver;
position:absolute;
left:50%;
top:50%;
transform: translate(-50%, -50%);
}

</style>
</head>
<body>
<div id="firstdiv">

<h3 style="color:red";>NoteBook Name must be unique.</h3>
<br><br>
<form action="uploadbook.jsp" method="post" name="bookform">
 
 <label for="name">Enter NoteBook Name :</label>
<input type="text" name="nbname" id="name"  />
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;
<br>
<input type="submit" name="create" onclick="return checkName()" />
</form>


</div>

<script>
function checkName(){
	var name=bookform.name.value;
	if(name.length==0){
		alert("Please Provide NoteBook Name");
		document.getElementById("name").style.borderColor="red";
		return false;
	}
	return true;
}


</script>
</body>
</html>