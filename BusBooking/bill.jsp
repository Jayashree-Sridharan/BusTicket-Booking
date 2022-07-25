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
.bill{  
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
  text-align: center;   	
}  
</style>
</head>
<body>
<div class="bill">
    <% 
	String[] c_name=request.getParameterValues("name");
	String[] age = request.getParameterValues("age");
	int id=Integer.parseInt(request.getParameter("id"));
	int req_seats=Integer.parseInt(request.getParameter("req_seats"));
	String username=request.getParameter("username");
	final int tot_seat,price; 
     String trav_name,toloc,fromloc;
	try{
	Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
    Statement stmt=con.createStatement();	
	String r="select * from `travels details` where Trav_Id = " + id;
   ResultSet rs=stmt.executeQuery(r); 
    if(rs.next()) {
	    trav_name=rs.getString(2);
	    tot_seat=rs.getInt(3);
		 price=rs.getInt(4);
		 fromloc=rs.getString(5);
		 toloc=rs.getString(6);
	
	%>
	<%
	for(int i=0;i<req_seats;i++){
	
    %><!--String query = "update `travels details` set Available_Seats = "+ (ava_seats-req_seats) +" where Trav_id = " + id ;	
	PreparedStatement s = con.prepareStatement(query);
	s.executeUpdate();-->
	<%String q="insert into `user details` "+" (Trav_Id,Cust_Name,Age,Travels_Name,From_Loc,To_Loc)"+ " values ( ? , ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setInt(1,id);
	pstmt.setString(2,c_name[i]);
	pstmt.setInt(3,Integer.parseInt(age[i]));
	pstmt.setString(4,trav_name);
	pstmt.setString(5,fromloc);
	pstmt.setString(6,toloc);
    pstmt.executeUpdate();  
	
	}
	ResultSet st=stmt.executeQuery("select mail_id from `user login` where user_name = '"+username+"';"); 
	String mailid;
	st.next();
	mailid=st.getString(1);
	int billprice=price*req_seats;
	%>
	<p>Bill amount to be paid is rupees  <%= billprice%>
	</p><br>
	<form action="mailpdf.jsp" method="post" align=center> 
	<%for(int i=0;i<req_seats;i++){%>
    <input type="hidden" name="name" value="<%=c_name[i]%>">
	<input type="hidden" name="age" value="<%=age[i]%>"> <%}%>
	<input type="hidden" name="fromloc" value="<%=fromloc%>">
	<input type="hidden" name="toloc" value="<%=toloc%>">
	<input type="hidden" name="req_seats" value="<%=req_seats%>">
	<input type="hidden" name="username" value="<%=username%>">
	<input type="hidden" name="mailid" value="<%=mailid%>">
	<input type="hidden" name="billprice" value="<%=billprice%>">
	<input type="submit" value="Get Ticket">
</form><%}}
	 catch(Exception e){ System.out.println(e);} 
%>


<a href = "homepage.jsp" align=center >Go to Homepage</a>
</div>

</body>
</html>