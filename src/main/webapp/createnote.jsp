<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Note</title>
<style>
#firstdiv{
background-color: silver;
padding:35px;
margin:10px;
border:5px;
position:absolute;
left:50%;
top:50%;
transform:translate(-50%,-50%);
}
</style>

<script>
//form validation...

function validateForm(){
	
	if(document.getElementById("nname").value.length==0){
		alert("Enter Note Name");
		return false;
	}
	
	if(document.getElementById("sdate").value.length==0){
		alert("select StartDate ");
		return false;
	}
	
	if(document.getElementById("edate").value.length==0){
		alert("select EndDate ");
		return false;
	}
	
	if(document.getElementById("rdate").value.length==0){
		alert("select RemainderDate");
		return false;
	}
	
	if(document.getElementById("status").checked==false && document.getElementById("status1").checked==false ){
		alert("select status");
		return false;
	}
	
	if(document.getElementById("tag").checked==false && document.getElementById("tag1").checked==false){
		alert("select tag ");
		return false;
	}
	
	
	
}
</script>


</head>
<body>
<div id="firstdiv">
<h3 style="color:red;"> All Fields are mandatory </h3>
<form action="uploadnote.jsp" method="get" name="noteform">
<label for="nname">Note Name :</label>
<input type="text" id="nname" name="notename"  />
<br><br>
<label for="sdate">Start Date :</label>
<input type="date" id="sdate"  name="startdate" placeholder="dd-mm-yyyy"   />
<br><br>
<label for="edate">End Date :</label>
<input type="date" id="edate" name="enddate"  placeholder="dd-mm-yyyy" />
<br><br>
<label for="rdate">Remainder Date :</label>
<input type="date" id="rdate" name="remainderdate" placeholder="dd-mm-yyyy"   />
<br><br>
<label for="status">Status :</label>
<input type="radio" id="status" name="status" value="Started" />Started
<input type="radio" id="status1" name="status" value="Stoped" />Stopped
<br><br>
<label for="tag">Tag :</label>
<input type="radio" id="tag" name="tag" value="Public" />Public
<input type="radio" id="tag1" name="tag" value="Private" />Private
<br><br>
<label for="des">Description :</label>
<br><br>
<textarea rows="10" cols="37" id="des" name="description"  >   </textarea>
<br>
<br>

&nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" value="Create" id="editbutton" onClick="return validateForm()" >
</form>
</div>


</body>
</html>