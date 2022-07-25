<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Travels Table</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.viewcustomer{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 80px;  
        background:  #ffb136;
        border-radius: 15px ;  
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
<div class="viewcustomer">
<h4 align = center> Travels Table</h4>
<%
    try{
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement(); 
    ResultSet rs=stmt.executeQuery("select * from `user details`");%>
	<table cellpadding="1" cellspacing="1" border="1" align=center width=100%>
	<tr><td>Id</td>    <td>Name</td>     <td>Age</td>
	     <td>Travels</td>   <td>From</td>      <td>To</td>
	<%while(rs.next())  {%>
	<table cellpadding="1" cellspacing="1" border="1" align=center width=100%>
             <tr> <td width=10%><%=rs.getInt(1)%></td>
			      <td width=20%><%=rs.getString(2)%></td>
				  <td width=20%><%=rs.getInt(3)%></td>
				  <td width=20%><%=rs.getString(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
      
<%    con.close();  
} 
catch(Exception e){ out.println(e);}
%>
<br><br><a href = "admin.jsp">Go to admin page</a>
</div>
</body>
</html>