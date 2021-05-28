<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit user</title>
<style>
#newid{
background-color:silver;
padding:30px;
border:15px;
margin:15px; 
}
</style>
</head>
<body>

<div id="newid">
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
	else{%>
	<h4  style="color:red;"> Error in uploading details try again  </h4>
<%}
	
}
catch(Exception e){%>
<h4  style="color:red;"> Error in uploading details try again  </h4>
<%}
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps1=con1.prepareStatement("update usercred set username=?,password=?,mailid=?,mobileno=? where userid=?");
	ps1.setString(1,request.getParameter("username"));
	ps1.setString(2,request.getParameter("conpass"));
	ps1.setString(3,request.getParameter("maild"));
	ps1.setString(4,request.getParameter("phonenumber"));
	ps1.setInt(5,(Integer)userid);
	int result=ps1.executeUpdate();
	out.println("<br><br>");
	if(result==1)
		response.sendRedirect("logout");
	
	
	else{ %>
		<h4  style="color:pink;"> Error in uploading details try again  </h4>
	<% }
}
catch(Exception e){%>
	<h4  style="color:red;"> Error in uploading details try again  </h4>
<%}




%>

<p>For Home page <a href="Home.jsp">Click here</a> </p>

</div>

</body>
</html>