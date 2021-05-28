<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notes</title>
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1"> 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
#seconddiv,#thirddiv{
background-color:silver;
padding:15px;
margin:5px;
border:10px;
/* position:absolute;
top:15%;
left:50%;
transform:translate(-50%,-50%); */

}
#div1{
padding:5px;
border:5px;
border-style:none;
margin:5px;
background-color: silver;

}
#p1{
position:relative;
}
#button1{
position:absolute;
left:35%;
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

<div id="navigation"></div> 

<div id="seconddiv">
 <p>To Create Notes </p>
 <a href="createnote.jsp" >Click Here</a>

</div>
<%String bookname= request.getParameter("bookinfo");
int nbid=-1;

%>
<%

try{ 
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
	
	PreparedStatement ps1=con1.prepareStatement("select nbid from nbcred where nbname=?");
	
	ps1.setString(1, bookname);

	out.println("<br><br>");
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next())
	nbid=rs1.getInt("nbid");
	session.setAttribute("nbid", nbid);
	con1.close();
}
catch(Exception e){
	
}%>
<% 
try{ 
	Class.forName("com.mysql.cj.jdbc.Driver"); 
	Connection con1 =DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root"); 
	
	PreparedStatement ps1=con1.prepareStatement("select notename,status,description from notecred where nbid=?");
	
	ps1.setInt(1, nbid);

	//out.println("<br><br>");
	ResultSet rs1=ps1.executeQuery();
	int count=0;
	while(rs1.next()){ count++; %>
		
		<div id="div1">
		
		<p id="p1"> <button  class="btn btn-info" style="align-items:center;position:absolute;"> <%= (rs1.getString("notename")) %> </button>
		 
		 <form action="viewNote.jsp" method="get">
		 <button style="position: absolute; right: 15%;" name="viewnote" class="btn btn-primary" value="<%= rs1.getString("notename") %>" >View Notes</button> 
		 </form>
		 
		 <form action="editNote.jsp" method="get">
		 <button style="position: absolute; right: 9%;"  name="editnote" class="btn btn-primary" value="<%= rs1.getString("notename") %>">Edit</button>
		 </form>
		 
		  <form action="deleteNote.jsp" method="get">
		 <button style="position: absolute; right: 2%;" name="deletenote" class="btn btn-primary"  value="<%= rs1.getString("notename") %>">Delete</button>
		 </form>
		 
		 </p>
		 <br><br>
		</div>
		
<% 	}
	if(count==0){%>
	<div id="thirddiv">
		<h4 style="color:blue;">Didn't have any notes</h4>
		<br>
		<h4>Please Create Notes</h4>
		</div>
	<% }
	con1.close();
}
catch(Exception e){
}	


%>

<script type="text/javascript">
function addsymbol(thisid){

	if(thisid.innerHTML=="-"){
		thisid.innerHTML="+";
		document.getElementById("getdes").style.visibility="hidden";
	}
	else if(thisid.innerHTML=="+"){
	document.getElementById("getdes").style.visibility="visible";
	thisid.innerHTML="-";
	}
	
}


</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"> </script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</body>
</html>