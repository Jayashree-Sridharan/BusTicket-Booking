import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http. *;
import java.io.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/delTravels")
public class delTravels extends HttpServlet
{
    public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException
	{try{
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	 PrintWriter out = response.getWriter();  
	int id= Integer.valueOf(request.getParameter("Trav_Id"));
	String q="delete from `travels details`" + " where Trav_id = "+ id ;
    stmt.executeUpdate(q);  
	out.println("Updated table after deleting travels");
	ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  
             out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
      
con.close();  
}
catch(Exception e){ System.out.println(e);}  }
public static void main(String args[])
	{}}