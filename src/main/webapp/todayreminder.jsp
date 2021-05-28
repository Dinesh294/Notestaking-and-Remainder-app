<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Today's reminder</title>
<style>
div{
background-color:silver;
padding:35px;
border:15px;
margin:10px;
}

</style>
</head>
<body>

<div>
<%

int array1[]=new int[500];
int index=0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps1=con1.prepareStatement("select nbid from nbcred where userid=?");
	ps1.setInt(1,(Integer)session.getAttribute("userid"));
	ResultSet rs1=ps1.executeQuery();
	while(rs1.next()){
		array1[index++]=rs1.getInt("nbid");
	}
	
}
catch(Exception e){
	
}
int count=0,temp_index=0;
while(temp_index<index){
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	String todayDate=java.time.LocalDate.now().toString();
	PreparedStatement ps=con.prepareStatement("select notename,description from notecred where remainderdate=? and nbid=?");
	ps.setString(1,todayDate);
	ps.setInt(2,(Integer)array1[temp_index]);
	ResultSet rs=ps.executeQuery();
	while(rs.next()){count++;%>
	
	<form>
	<label for="name" >Note Name: </label>
	<input type="text" id="name"  value="<%= rs.getString("notename")%>"/>
	<br><br>
	<label for="des" >Description: </label>
	<br><br>
	<textarea id="des" rows="10" cols="37"><%= rs.getString("description") %></textarea>
	<br><br>
	<br><br><br><br>
	</form>
		
	<% }
	
	
}
catch(Exception e){
	
}
temp_index++;
}

if(count==0){%>
<h4 style="color:blue;">No Remainders for Today</h4>
<% }

%>
</div>

</body>
</html>