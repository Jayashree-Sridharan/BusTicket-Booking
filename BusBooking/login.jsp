<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page import="java.sevlet.http.*"%>

 <%

 try{
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   String uname=request.getParameter("user");
 String pswd=request.getParameter("pwd");
   String q="select * from `admin details` where name = '"+ uname +"' and password = '"+ pswd +"' ;";
  ResultSet rs=stmt.executeQuery(q);  

    if(rs.next())
	{out.println("Welcome admin....<br>");
     RequestDispatcher r = request.getRequestDispatcher("admin.jsp");
      r.forward(request,response);}
	else
    {out.println("Acess denied... Try again.");
      RequestDispatcher r = request.getRequestDispatcher("adminerror.jsp");
 r.forward(request,response);}}
 
  catch(Exception e)
 { out.println(e);} 

%>

