<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Location</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.search{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 80px;  
        background:  #ffb136;
        border-radius: 15px ;  
}
input[type=submit] {
 
  border: none;
  border-radius: 2px ;  
}
input[type=submit]:hover{
	background-color:#696969;
	color:#ffffff;
} 
label{  
    color: #0047b3;  
    font-size: 17px;  
}     
a{  
    float: center;  
    background-color=white      	
}
</style>
</head>
<body>
<div class="search">
<% try{
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
  String fromloc=request.getParameter("from_loc");
   String toloc=request.getParameter("to_loc");
   String username=request.getParameter("username");
   int userid=Integer.parseInt(request.getParameter("userid"));
   %><!--request.setAttribute("from",fromloc);
   request.setAttribute("to",toloc);-->
   <%
   String r="select * from `travels details` where From_Loc = '"+ fromloc +"' and To_Loc = '"+ toloc +"' ;";
  ResultSet rs=stmt.executeQuery(r);  
  if(!rs.next())
  {%><p align=center>No Travels Available</p>
    <p align=center> 
	<form action="location.jsp" method="post" align=center>
	      <input type="hidden" name="username" value="<%=username%>">
		  <input type="submit" value="Go back">
	</form>
	
	<a href="homepage.jsp" align=center>Go to home page</a></p><%}
  else
  {%> 

     <table cellpadding="1" cellspacing="1" border="1" align=center>
	<tr><td>Id</td>    <td>Name</td>     <td>Seats</td>
	     <td>Price</td>   <td>From</td>      <td>To</td>
		 <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getString(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr></table>
 <% while(rs.next())  {%>
 
	<table cellpadding="1" cellspacing="1" border="1"  align=center>
             <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getString(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
	
	<br><br>
    <form action="book.jsp" align=center autocomplete="off">
	    <label>Enter travels id</label>
		<br>
		<input type= "text" id="id" name="id">
		<br>
		<label>Number of seats</label>
		<br>
		<input type= "text" id="seats" name="seats">
		<input type= "hidden" id="username" name="username" value="<%=username%>">
		<input type= "hidden" id="userid" name="userid" value="<%=userid%>">
		<br><br>
		<input type ="submit" value="proceed">
	</form>
	<%
   }} 
   catch(Exception e)
 { out.println(e);}  
    
%>

    

</div>
</body>
</html>