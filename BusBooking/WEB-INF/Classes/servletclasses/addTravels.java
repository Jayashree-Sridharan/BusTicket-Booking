package servletclasses;
import java.util.*;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;
import javax.servlet.http. *;
import java.io.*;

@WebServlet("/addTravels")
public class addTravels extends HttpServlet
{
    public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException
	{
		try{
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	PrintWriter out = response.getWriter();
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
	while(rs.next())  
             out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6) );
      
con.close();  
}
catch(Exception e){ System.out.println(e);}  
	}
	
	public static void main(String args[])
	{
		
	}
	
}