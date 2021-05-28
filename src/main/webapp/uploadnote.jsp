<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Uploading note</title>
<style>
#firstdiv{

padding:30px;
margin:10px;
border:15px;
background-color: silver;

}

</style>
</head>
<body>
<div id="firstdiv">
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

boolean flag=true;
while(temp_index < index){
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps1=con1.prepareStatement("select notename from notecred where notename=? and nbid=?");
	ps1.setString(1,request.getParameter("notename"));
	ps1.setInt(2,(Integer)array1[temp_index]);
	ResultSet rs1=ps1.executeQuery();
	if(rs1.next()){
		flag=false;
		break;
	 }
	else{
		flag=true;
	}
}
catch(Exception e){
 
/* <!--  <h4  style="color:red;">Error in creating note try again</h4> --> */
	
 }
temp_index++;
}
if(!flag){%>
	<h4 style="color:red;">Notename already exist try different name..</h4>
	<p>to create notes <a href="createnote.jsp" >click here</a></p>
<% }

else{
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
	PreparedStatement ps=con.prepareStatement("insert into notecred(nbid,notename,startdate,enddate,remainderdate,tag,description,status) values(?,?,?,?,?,?,?,?)");
	ps.setInt(1,(Integer)session.getAttribute("nbid"));
	ps.setString(2,request.getParameter("notename"));
	ps.setString(3,request.getParameter("startdate"));
	ps.setString(4,request.getParameter("enddate"));
	ps.setString(5,request.getParameter("remainderdate"));
	ps.setString(6,request.getParameter("tag"));
	ps.setString(7,request.getParameter("description"));
	ps.setString(8,request.getParameter("status"));
	
	int rs = ps.executeUpdate();
	if(rs==1){%>
		<h4 style="color:blue;"> Note is Created Successfully </h4>
		<p> To view Notes
		<a href="Home.jsp" > click here</a></p>
	<% }
	else{%>
		<h2  style="color:red;"> Error in creating note Try again else</h2>
	<% }
}
catch(Exception e){%>

<h4  style="color:red;">Error in creating note try again catch </h4>
	
<%}


}


%>
</div>
</body>
</html>