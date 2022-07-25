<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Delete Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.delete{  
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
<div class="delete">
<%	
   try{
	   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement(); 
	    int id= Integer.parseInt(request.getParameter("Trav_Id"));
	String q="delete from `travels details` " + " where Trav_id = "+ id ;
    int s = stmt.executeUpdate(q); 	
	if(s==1){%>
	<h4 align=center>Updated table after deleting travels</h4>
	<%ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  {%>
	<table cellpadding="1" cellspacing="1" border="1"  align=center width=100%>
             <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getString(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
	<%}else{%>
	<h4 align=center>Error occured Travels not found</h4>
	<%}%>
	<%
con.close();  
}
catch(Exception e){ out.println(e);}
%>
<br><a href = "admin.jsp" align=center>Go to admin page</a>
</div>
</body>
</html>