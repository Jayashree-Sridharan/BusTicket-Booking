<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>User History</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.history{  
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
     
    font-size: 17px;  
}     
a{  
    float: center;   
    background-color=white      	
}
</style>
</head>
<body>
<div class="history">
<%
    try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();
	String username=request.getParameter("username");
	String r="select * from `user history` where user_name = '"+ username +"' ;";
    ResultSet rs=stmt.executeQuery(r); 
   if(rs.next()){	
	%>
	<h4 align=center>User History</h4>
   <table cellpadding="1" cellspacing="1" border="1" align=center>
	<tr><td>User_Id</td>    <td>User_Name</td>     <td>Req_Seats</td>
	     <td>Trav_id</td>   <td>From</td>      <td>To</td>
		 <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getInt(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr></table>
 <% while(rs.next())  {%>
 
	<table cellpadding="1" cellspacing="1" border="1" width=105% align=center>
             <tr> <td width=20%><%=rs.getInt(1)%></td>
			      <td width=30%><%=rs.getString(2)%></td>
				  <td width=30%><%=rs.getInt(3)%></td>
				  <td width=30%><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%>   </td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
	<br>
	
	<form action="chart.jsp" method="post" >
	      <label>To View your User History Charts</label><br>
		  <input type="hidden" name="username" value="<%=username%>">
		  <input type="radio" name="type" value="pie">
		  <label>Pie chart</label> <br>
		  <input type="radio" name="type" value="column">
		  <label>Column chart</label><br>
		  <input type="radio" name="type" value="bar">
		  <label>Bar chart</label><br>
		  
		  <input type="submit" value="Click here">
	</form>
	
	<br><br> 
	<form action="maps.jsp" method="post">
	<label>To View your User History Maps</label><br>
	<input type="hidden" name="username" value="<%=username%>">
		  <input type="submit" value="Click here">
	</form>
	<%
	}else{%>
	<h4 align=center>No History found</h4><br>
	
	<%}}
   catch(Exception e)
 { out.println(e);}  
    
%>
<br><br>
<a href ="userLogin.html" align=center>Go to Login page</a>
</div>
</body>
</html>