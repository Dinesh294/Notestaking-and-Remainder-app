<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>   
    
    <%@ page import="java.sql.*" %>
    
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reminder App</title>  

<!--  for bootstrap  -->
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<style>

#layout{ 
margin:100px;
padding:30px;
background-color:silver;
border:15px;

}

.newdiv{
background-color: silver;
padding:30px;
margin:5px;
border:5px;
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

<%   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	 if(session.getAttribute("user")==null){
		 //out.print("welcome "+session.getAttribute("username"));

	
		 response.sendRedirect("index.jsp");
	 }
	 
	 %>
 <!-- for navbar -->
 
<div id="navigation"></div> 
 

 
 
 <%  
 // getting userid from database using username.
int userid=-1;
 try {            
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
		
		PreparedStatement ps=con.prepareStatement("select userid from usercred where username=?");
		ps.setString(1,session.getAttribute("user").toString());
		
		ResultSet rs=ps.executeQuery(); 
		if(rs.next()) {userid=rs.getInt("userid");}
		session.setAttribute("userid", userid);
		con.close();
		
 }
 catch(Exception e){
	 
 }
		
		// getting all the notebook from a database 
			
			try{ 
				Class.forName("com.mysql.cj.jdbc.Driver"); 
				Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
				
				PreparedStatement ps1=con1.prepareStatement("select nbname from nbcred where userid=?");
				
				ps1.setInt(1, userid);
			
				out.println("<br><br>");
				ResultSet rs1=ps1.executeQuery(); 
				int count=0;
				while(rs1.next()) { 
					count++;
					%>
					<form id="layout" action="getBookInfo.jsp" method="get" >
					<input type="text" class="btn btn-info" name="bookinfo" value="<%=rs1.getString("nbname")%>" readonly />
					<input type="submit" style="position:absolute;left:30%;"  class="btn btn-primary" value="View"  /> 
					</form>
				<% }
				
				if(count==0){%>
				<div class="newdiv">
				<h4>you didn't have any notebook..</h4>
				<p>please create notebook <a href="createbook.jsp" >click here </a> </p>
					</div>
				<% }
				
				
			}
			catch(Exception e){
				
			}
		   
 %>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>



</body>
</html>