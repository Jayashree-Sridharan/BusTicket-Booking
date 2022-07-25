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
.loc{  
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
<%  String username=request.getParameter("username");
 try{
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   ResultSet res=stmt.executeQuery("select * from `user login` where user_name = '"+ username +"';");
   if(res.next())
   {int userid=res.getInt(1);%>  

   <div class="loc" align=center>
      <form action="search.jsp" autocomplete="off">  
	  <label>From Location</label> 
	      <input type= "text" id="from_loc" name="from_loc">
		  <br><br>
		  <label>To Location</label> 
		  <input type= "text"  id="to_loc" name="to_loc">
		  <br><br>
		  <input type= "hidden"  name="username" value="<%=username%>">
		  <input type= "hidden"  name="userid" value="<%=userid%>">
		 <!-- <label>Number of seats</label> 
		  <input type= "text"  id="seats" name="seats">
		  <br><br>-->
		  <input type="submit" value="Search Travels"></form>
		  <br><br>
		  <p align=center><a href ="userLogin.html" align=center>Go to Login page</a></p>
   </div>
     <%}}
    catch(Exception e)
    { out.println(e);}   %>
</body>
</html>