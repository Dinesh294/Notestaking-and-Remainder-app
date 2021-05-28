<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload NoteBook</title>
<style>
#firstdiv{
padding:35px;
margin:5px;
border:10px;
background-color: silver;
}



</style>
</head>
<body>
<div id="firstdiv">
<%
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps=con.prepareStatement("select nbname from nbcred where nbname=?");
	//ps.setInt(1,Integer.parseInt(session.getAttribute("nbid").toString()));
	ps.setString(1,request.getParameter("nbname"));
	ResultSet rs=ps.executeQuery();
	if(rs.next()){%>
	    <br>
		<h3 style="color:red;">Error in Creating ,Notebook name already exists... </h3>
		<br>
	<% }
	else{
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
			PreparedStatement ps1=con1.prepareStatement("insert into  nbcred(userid,nbname) values (?,?)");
			
			ps1.setInt(1,(Integer)session.getAttribute("userid"));
		
			//ps.setInt(1,session.getAttribute("userid"));
			ps1.setString(2,request.getParameter("nbname"));
			//out.println("no exception");
			int rs1=ps1.executeUpdate();
			
			if(rs1==1){%>
				<p style="color:blue;" > NoteBook Created Successfully </p>
			<% }
			else{%>
				
				<p style="color:red;">Error1 in Creating NoteBook</p>
			<% }
		}
		catch(Exception e){%>
			<p style="color:red;">Error4 in Creating NoteBook</p>
		<% }	
	}
}
catch(Exception e){%>
	   <br>
		<h3 style="color:red;">Notebook name already exists... </h3>
		<br>
<% }

%>
<h4> click here to view notes </h4>
<a href="Home.jsp">View Notes</a>
</div>
</body>
</html>