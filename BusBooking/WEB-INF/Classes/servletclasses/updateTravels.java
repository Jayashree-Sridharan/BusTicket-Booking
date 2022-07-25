import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http. *;
import java.io.*;
import javax.servlet.annotation.WebServlet;

@WebServlet("/updateTravels")
public class updateTravels extends HttpServlet
{
    public void service(HttpServletRequest request, HttpServletResponse response)
	throws ServletException,IOException
	{
	int id= Integer.valueOf(request.getParameter("Trav_id"));
	int s_no= Integer.valueOf(request.getParameter("Seats"));
	
   try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
    Statement stmt=con.createStatement(); 
   
     PrintWriter out = response.getWriter();  
    String query = "update `travels details` set Available_Seats = "+ s_no +" where Trav_id = " + id ;
    PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.execute(query);
    ResultSet rs=stmt.executeQuery("select * from `travels details`");  
	out.println("\n"+"Updated table: ");
       while(rs.next())  
           out.println(rs.getInt(1)+"  "+rs.getString(2)+" "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
    con.close();  
} 
catch(Exception e){ System.out.println(e);}
}
public static void main(String args[])
	{}} 