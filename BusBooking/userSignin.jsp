<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sevlet.http.*"%>
<html>
<head><title>Sign in</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.signin{  
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
<div class="signin">
 <%
 try{
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   String uname=request.getParameter("username");
 String pswd=request.getParameter("password");
   String q="select * from `user login` where user_name = '"+ uname +"' and password = '"+ pswd +"' ;";
  ResultSet rs=stmt.executeQuery(q);  

    if(rs.next())
	{%><p align=center>Login Successful 
         <br><br>
         <form action= "location.jsp" method="post" align=center>
		    <label align= center>To book tickets</label><br>
			<input type="hidden" name="username" value="<%=uname%>">
			<input type="submit" value="Click here">
		 </form>
		 <br>
		 <form action= "history.jsp"" method="post" align=center>
		    <label align= center>To View History</label><br>
			<input type="hidden" name="username" value="<%=uname%>">
			<input type="submit" value="Click here">
		 </form>


            <!-- <p align=center>To Book Tickets     <a href= "location.jsp">Click Here</a></p>
			 <p align=center>To View History     <a href="history.jsp">Click Here</a></p>
			 <br><a href="homepage.jsp">Go to Homepage</a>-->
       </p>
     <%}
	else
    {%><p align=center>Username or Password Incorrect...<br><br> Try again
        <br><br> <p align=center><a href ="userLogin.html" align=center>Go to Login page</a></p></p>
    <%}}
 
  catch(Exception e)
 { out.println(e);} 

%>

