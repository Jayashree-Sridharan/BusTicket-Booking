<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Add Travels</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.addtrav{  
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
<div class="addtrav">
<%  try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	String name=request.getParameter("Trav_Name");
	int s=Integer.parseInt(request.getParameter("Seats"));
	int p=Integer.parseInt(request.getParameter("Price"));
	String f=request.getParameter("From_Loc");
	String t=request.getParameter("To_Loc");
	String q="insert into `travels details` "+" (Trav_Name,Available_Seats,Ticket_Price,From_Loc,To_Loc)"+ " values ( ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setString(1,name);
	pstmt.setInt(2,s);
	pstmt.setInt(3,p);
	pstmt.setString(4,f);
	pstmt.setString(5,t);
    pstmt.executeUpdate();  
	%>
	<h4>updated table</h4>
	<%
	ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  {%>
	<table cellpadding="1" cellspacing="1" border="1" width=100%>
             <tr> <td width=10%><%=rs.getInt(1)%></td>
			      <td width=20%><%=rs.getString(2)%></td>
				  <td width=20%><%=rs.getString(3)%></td>
				  <td width=20%><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
	</table>
      
<% con.close();}
catch(Exception e){ out.println(e);}  

%>
<br>
<h1 align=center>details added</h1>
<br>
<a href = "admin.jsp">Go to admin page</a>
</div>
</body>
</html>