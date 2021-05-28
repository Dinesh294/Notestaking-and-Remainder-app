
 <div id="navigation">
<nav class="navbar navbar-inverse" >

	<div class="container-fluid">  
<div class="navbar-header">
<button type="button"  class="navbar-toggle" data-toggle="collapse" data-target="#collapseid">
 <span class="icon-bar" > </span> <span class="icon-bar" > </span></button>
<a class="navbar-brand" href="#"> Hi <%=  (session.getAttribute("user")) %>   </a>
</div>
<div class="collapse navbar-collapse" id="collapseid">
<ul class="nav navbar-nav">
<li>  <a href="Home.jsp">NoteBook </a> </li> 
<li> <a href="createbook.jsp">Create NoteBook</a> </li>
<li>  <a href="edituser.jsp">Edit User </a> </li>
</ul> 


<form class="navbar-form navbar-right" action="logout">

<input type="submit" class="btn btn-danger" Value="Logout">
</form>


 <form class="navbar-form navbar-right" action="todayreminder.jsp" method="get">
<div class="form-group">
<button type="submit" class="btn btn-primary">Today's Reminder</button>
</div>

</form>




</div>
</div>
</nav> 
</div>








