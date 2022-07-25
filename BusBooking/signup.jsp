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
.sign-up{  
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
<div class="sign-up">
 <%
 try{
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   String uname=request.getParameter("username");
 String pswd=request.getParameter("password");
 String mailid=request.getParameter("mailid");
   String q="insert into `user login` "+" (user_name,mail_id,password)"+ " values ( ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setString(1,uname);
	pstmt.setString(2,mailid);
	pstmt.setString(3,pswd);
    int a=pstmt.executeUpdate();
    if(a==1)
	{%><p align=center>Sign-up Successful 
             <p> <a href= "userLogin.html">Go to Sign-in page</a></p>

       </p>
     <%}
	else
    {%><p align=center> Try again
        <br><br> <p align=center><a href="homepage.jsp">Go to Homepage</a>
		</p></p>
    <%}}
 
  catch(Exception e)
 { out.println(e);} 

%>
</body>
</html>

