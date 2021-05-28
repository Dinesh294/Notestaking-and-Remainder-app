<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
<!--  for bootstrap  -->
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 
<style>
 body{
background-color: silver;
} 
#div13{

margin:5px;
border:10px;
padding:35px;

position:relative;

}

#div12{
 position:absolute;
 left:50%;

/* left:50;*/
transform: translate(-50%); 

 
}
#editbutton{
background-color: #4CAF50;
}

</style>
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  
<script>
$(function(){
	$('#navigation').load('Header.jsp');
	
}) 



</script>
</head>
<body>

 <!-- for navbar -->
 
 <div id="navigation"></div>  
 
 
<% String notename=request.getParameter("editnote");
try{
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 

PreparedStatement ps1=con1.prepareStatement("select notename ,startdate ,enddate ,remainderdate ,tag ,description ,status from notecred where notename=?");

ps1.setString(1, notename);

out.println("<br><br>");
ResultSet rs1=ps1.executeQuery();

if(rs1.next()){

%> 
<div id="div13">
<div id="div12">
<form action="updatenote.jsp" method="get">
<label for="nname">Note Name</label>
<input type="text" id="nname" name="notename" value="<%=rs1.getString("notename") %>" />
<br><br>
<label for="sdate">Start Date</label>
<input type="date" id="sdate" name="startdate" value="<%=rs1.getString("startdate") %>" />
<br><br>
<label for="edate">End Date</label>
<input type="date" id="edate" name="enddate"  value="<%=rs1.getString("enddate")%>" />
<br><br>
<label for="rdate">Remainder Date</label>
<input type="date" id="rdate" name="remainderdate" value="<%=rs1.getString("remainderdate") %>" />
<br><br>
<label for="status">Status</label>
<input type="text" id="status" name="status" value="<%=rs1.getString("status") %>" />
<br><br>
<label for="tag">Tag</label>
<input type="text" id="tag" name="tag" value="<%=rs1.getString("tag") %>" />
<br><br>
<label for="des">Description</label>
<br><br>
<textarea rows="10" cols="37" id="des" name="description" value="<%= rs1.getString("description")%>" > <%= rs1.getString("description")%>  </textarea>
<br>
<br>

&nbsp; &nbsp; &nbsp; &nbsp;<input type="submit" value="Edit" id="editbutton" >
</form>

</div>
</div>
<%
}
con1.close();
}
catch(Exception e){
	
}

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>