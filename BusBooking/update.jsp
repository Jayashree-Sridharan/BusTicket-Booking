<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Update Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.update{  
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
<div class="update">
<%
   try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
    Statement stmt=con.createStatement(); 
	int id= Integer.parseInt(request.getParameter("Trav_Id"));
	int s_no= Integer.parseInt(request.getParameter("Seats"));
    String query = "update `travels details` set Available_Seats = "+ s_no +" where Trav_id = " + id ;
    PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.execute(query);
    
	ResultSet rs=stmt.executeQuery("select * from `travels details`");%>
	<table cellpadding="1" cellspacing="1" border="1" align=center >
	<tr><td>Id</td>    <td>Name</td>     <td>Seats</td>
	     <td>Price</td>   <td>From</td>      <td>To</td>
	<%while(rs.next())  {%>
	<table cellpadding="1" cellspacing="1" border="1" align=center >
             <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getString(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
      
<%    con.close();  
} 
catch(Exception e){ out.println(e);}
%>
<h4 align=center>Table updated</h4>
<br><a href = "admin.jsp">Go to admin page</a>
</div>
</body>
</html>