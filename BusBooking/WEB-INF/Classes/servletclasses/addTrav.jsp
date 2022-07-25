<html>
<head>
<title>Add Travels</title>
</head>
<body>
<%
    try{
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	int id=Integer.valueOf(request.getParameter("Trav_id"));
	String name=request.getParameter("Trav_Name");
	int s=Integer.valueOf(request.getParameter("Seats"));
	int p=Integer.valueOf(request.getParameter("Price"));
	String f=request.getParameter("From_Loc");
	String t=request.getParameter("To_Loc");
	String q="insert into `travels details` "+" (Trav_id,Trav_Name,Available_Seats,Ticket_Price,From_Loc,To_Loc)"+ " values ( ? , ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setInt(1,id);
	pstmt.setString(2,name);
	pstmt.setInt(3,s);
	pstmt.setInt(4,p);
	pstmt.setString(5,f);
	pstmt.setString(6,t);
    pstmt.executeUpdate();  
	out.println("Updated table");
	ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  {%>
	<table cellpadding="1" cellspacing="1" border="1" >
             <tr> <td><%=rs.getInt(1)%></td>
			      <td><%=rs.getString(2)%></td>
				  <td><%=rs.getString(3)%></td>
				  <td><%=rs.getInt(4)%></td>
				  <td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td> </tr>
	<% } %>
      
<% con.close();  
}
catch(Exception e){ System.out.println(e);}  
%>

</body>
</html>