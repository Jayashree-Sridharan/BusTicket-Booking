<%@ page import=" java.io.* , java.util.* , java.sql.* "%>
<%@page import=" javax.servlet.* , javax.servlet.http.* " %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Booking</title>
<style>
body  
{  
    margin: 0;  
    padding: 0;  
    
    font-family: 'Arial';  
}  
.book{  
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
input[type=submit] {
 
  border: none;
  border-radius: 2px ;  
}
input[type=submit]:hover{
	background-color:#696969;
	color:#ffffff;
}    
a{  
    float: center;  
    background-color=white      	
}
</style>
</head>
<body>
<div class="book">
      <% try{
     Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
     Statement stmt=con.createStatement(); 
     int trav_id= Integer.parseInt(request.getParameter("id"));
	 int s_no= Integer.parseInt(request.getParameter("seats"));
	 String username=request.getParameter("username");
     int userid= Integer.parseInt(request.getParameter("userid"));
     String r="select * from `travels details` where Trav_Id = " + trav_id;
     ResultSet rs=stmt.executeQuery(r); 
     int tot_seat,price; 
     String name,toloc,fromloc;
     if(rs.next()) {
	    name=rs.getString(2);
	    tot_seat=rs.getInt(3);
		 price=rs.getInt(4);
		 fromloc=rs.getString(5);
		 toloc=rs.getString(6);
		 %>
		 <!--session.setAttribute("id",trav_Id);
		 session.setAttribute("id",""+trav_id);
		 session.setAttribute("price",""+price);
		  session.setAttribute("req_seats",""+s_no);
		   session.setAttribute("ava_seats",""+tot_seat);
		   session.setAttribute("name",name);
		   session.setAttribute("fromloc",fromloc);
		   session.setAttribute("toloc",toloc);
		 %>-->
		
   <!--insert into user history--><%
   
   
   String query="SELECT count(*) FROM `user details` where Trav_Id = "+trav_id;
	ResultSet m=stmt.executeQuery(query);
  
   if(m.next()){int count=m.getInt(1);
   int ava_seats=tot_seat-count;
   if(s_no<=(ava_seats)){
	   try{
	 
	String q="insert into `user history` "+" (user_id,user_name,req_seats,trav_id,from_loc,to_loc)"+ " values ( ? , ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setInt(1,userid);
	pstmt.setString(2,username);
	pstmt.setInt(3,s_no);
	pstmt.setInt(4,trav_id);
	pstmt.setString(5,fromloc);
	pstmt.setString(6,toloc);
    pstmt.executeUpdate();
  }
  catch(Exception e){ out.println(e);}
	   %>
   <p align=center>Seats available is <%=ava_seats%> of <%=tot_seat%></p>
   <p></p>
   <form action="bill.jsp" method="post" align=center autocomplete="off">
       <%for(int i=0;i<s_no;i++){%>
	   <label>Name</label>
	   <input type="text" name="name" id="name" placeholder="Name"><br>
	   <label>Age</label>
	   <input type="text" name="age" id="age" placeholder="Age">
	   <br><br>
	   <%}%>
	   <input type="hidden" name="id" value="<%=trav_id%>"/>
		<input type="hidden" name="req_seats" value="<%=s_no%>"/>
       <input type= "hidden" id="username" name="username" value="<%=username%>">
		<input type= "hidden" id="userid" name="userid" value="<%=userid%>">
	   
	   <input type="submit" value="Proceed">
	   <%}else{%> 
	   <p>Seats not available <br>  <br>
	   <p align=center><a href ="userLogin.html" align=center>Go to Login page</a></p>

	  <%}}}}
	  
	   catch(Exception e){ out.println(e);}%>
   </form>
  
</div>
</body>
</html>