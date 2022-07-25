import java.io.*;
import java.util.*;
import java.sql.*;

public class BusBooking{
  
    String[] TravlesList=new String[25];   
    int [] PriceList=new int[25];  
    int[] seats=new int [25]; 
    
	List<String> BookingList=new ArrayList<String>();
    ArrayList<Integer> AgeList=new ArrayList<Integer>();
    
//customer booking
public void reservation(Connection con)
{ String fromloc,toloc; 
  Scanner sc=new Scanner(System.in);
  System.out.println("Enter 'from' location : ");
    fromloc = sc.next(); 
   System.out.println("Enter 'to' location : ");
   toloc = sc.next();
   int f=0;
   try{
  //Class.forName("com.mysql.jdbc.Driver");
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   String r="select * from `travels details` ";
  ResultSet rs=stmt.executeQuery(r);  
  int i=0;
  while(rs.next())  
  { 
    TravlesList[i]=rs.getString(2);
	PriceList[i]=rs.getInt(4);
	seats[i]=rs.getInt(3);
	i++;
 }
}
catch(Exception e)
 { System.out.println(e);} 
 
 try{
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement(); 
   String r="select * from `travels details` where From_Loc = '"+ fromloc +"' and To_Loc = '"+ toloc +"' ;";
  ResultSet rs=stmt.executeQuery(r);  
  System.out.println("\n"+"Id-Travels -Seats-Price-From-To"+"\n");
  while(rs.next())  
  {System.out.println(rs.getInt(1)+"   "+rs.getString(2)+"   "+rs.getString(3)+"  " +rs.getInt(4)+ "  "+ rs.getString(5)+"  "+rs.getString(6));
   f=1;
    
 }
} 
   catch(Exception e)
 { System.out.println(e);}  
   if(f==0){System.out.println("Sorry no buses available. Try later.");}
   else{
    Scanner tkts=new Scanner(System.in);
    System.out.println("Enter the travels number: ");
    int t_no= tkts.nextInt();
    System.out.println("Prices of the selected travels is : "+PriceList[t_no - 1]+" rs");
    System.out.println("Enter the tickets needed:");
    int tickets=tkts.nextInt();
    if(tickets<= seats[t_no-1]){
      System.out.println("Name and age please");
     
        for(int i=0;i<tickets;i++)
     {
        Scanner nom=new Scanner(System.in);
        Scanner age=new Scanner(System.in); 
        System.out.print("Name:");
        String name=nom.nextLine();
        System.out.print("age:");
        int Age=age.nextInt();
        BookingList.add(name);
        AgeList.add(Age);
        seats[t_no-1]--;
	try{
    Statement stmt=con.createStatement();		
	String q="insert into `user details` "+" (Trav_Id,Cust_Name,Age,Travels_Name,From_Loc,To_Loc)"+ " values ( ? , ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setInt(1,t_no);
	pstmt.setString(2,name);
	pstmt.setInt(3,Age);
	pstmt.setString(4,TravlesList[t_no-1]);
	pstmt.setString(5,fromloc);
	pstmt.setString(6,toloc);
    pstmt.executeUpdate();  
	
     }
	 catch(Exception e){ System.out.println(e);} }
      
    }else{
      System.out.println(tickets+"tickets  unavailable");
    }
    System.out.println("Names: "+BookingList+"\n"+"Age:"+AgeList);
    int payment=tickets * PriceList[t_no - 1];
	 System.out.println("Amount to be paid is "+payment+"rs");

try{
  //Class.forName("com.mysql.jdbc.Driver");
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement();  
   //  update preparedstatement
      String query = "update `travels details` set Available_Seats = "+ seats[t_no-1] +" where Trav_id = " + t_no ;
       PreparedStatement pstmt = con.prepareStatement(query);
	   pstmt.execute(query); 
       ResultSet rs=stmt.executeQuery("select * from `travels details`");  
	   System.out.println("\n"+"Updated table: ");
       while(rs.next())  
System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"   "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
//con.close();  
} 
   catch(Exception e){ System.out.println(e);} }
}


//admin adds new travels
 public static  void addTravels(Connection con){
try{
    //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter id of travels : ");
	int id=sc.nextInt();
	System.out.println("Enter name of travles : ");
	String name=sc.next();
	System.out.println("Enter seats : ");
	int s=sc.nextInt();
	System.out.println("Enter price : ");
	int p=sc.nextInt();
	System.out.println("Enter from location : ");
	String f=sc.next();
	System.out.println("Enter to location : ");
	String t=sc.next();
	String q="insert into `travels details` "+" (Trav_id,Trav_Name,Available_Seats,Ticket_Price,From_Loc,To_Loc)"+ " values ( ? , ? , ? , ? , ? , ? );" ;
	PreparedStatement pstmt = con.prepareStatement(q);
	pstmt.setInt(1,id);
	pstmt.setString(2,name);
	pstmt.setInt(3,s);
	pstmt.setInt(4,p);
	pstmt.setString(5,f);
	pstmt.setString(6,t);
    pstmt.executeUpdate();  
	System.out.println("Updated table");
	ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  
             System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6) );
      
//con.close();  
}
catch(Exception e){ System.out.println(e);}  
}

//removing a travels by admin
public static  void removeTravels(Connection con){
try{
   //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
	Statement stmt=con.createStatement();  
	Scanner sc=new Scanner(System.in);
	System.out.println("Enter id of travel to be deleted");
	int id=sc.nextInt();
	String q="delete from `travels details`" + " where Trav_id = "+ id ;
    stmt.executeUpdate(q);  
	System.out.println("Updated table after deleting travels");
	ResultSet rs=stmt.executeQuery("select * from `travels details`");
	while(rs.next())  
             System.out.println(rs.getInt(1)+"  "+rs.getString(2)+"  "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
      
//con.close();  
}
catch(Exception e){ System.out.println(e);}  
}

//admin update tickets in travels
public void updateTicket(Connection con)
{   
	System.out.println("Enter id of the travels: ");
    Scanner sc=new Scanner(System.in);
	int id= sc.nextInt();
	System.out.println("Enter seat numbers to be updated: ");
	int s_no= sc.nextInt();
	
try{
  //Class.forName("com.mysql.jdbc.Driver");
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement();  
    String query = "update `travels details` set Available_Seats = "+ s_no +" where Trav_id = " + id ;
    PreparedStatement pstmt = con.prepareStatement(query);
	pstmt.execute(query);
    ResultSet rs=stmt.executeQuery("select * from `travels details`");  
	System.out.println("\n"+"Updated table: ");
       while(rs.next())  
           System.out.println(rs.getInt(1)+"  "+rs.getString(2)+" "+rs.getString(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
    //con.close();  
} 
catch(Exception e){ System.out.println(e);} 
}

//view travels details
void viewTravelsDetails(Connection con)
{
	try{
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement();  
    ResultSet rs=stmt.executeQuery("select * from `travels details`");  
	System.out.println("\n"+"Updated table: ");
       while(rs.next())  
           System.out.println(rs.getInt(1)+"  "+rs.getString(2)+" "+rs.getInt(3)+" " +rs.getInt(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
   // con.close();  
} 
catch(Exception e){ System.out.println(e);} 

	
}


//view customer details
void viewCustomerDetails(Connection con)
{
	try{
  //Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30");
  Statement stmt=con.createStatement();  
    ResultSet rs=stmt.executeQuery("select * from `user details`");  
	System.out.println("\n"+"Id-Name-Age-Travels-From-To ");
       while(rs.next())  
           System.out.println(rs.getInt(1)+"  "+rs.getString(2)+" "+rs.getInt(3)+" " +rs.getString(4)+ " "+ rs.getString(5)+" "+rs.getString(6));
    //con.close();  
} 
catch(Exception e){ System.out.println(e);} 
}
	


//main program
 public static void main(String[] args) {

BusBooking b1=new BusBooking();
    System .out.println("WELCOME TO BUS TICKET PORTAL");
	Scanner sc=new Scanner(System.in);
	Connection con=null;
	try{
     //   Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/busbooking","root","Anuumasri@30"); 
	}
	catch(Exception e)
	{ System.out.println(e);}
	int s=1;
	while(s!=0){
	System.out.println("\n"+"Enter '1' for admin login"+"\n"+"Enter '2' To Book Tickets"+"\n"+"Enter '0' to exit");
	s = sc.nextInt();
	if(s==1)
	{
		System.out.println("Enter user name and password : ");
		System.out.println("User name : ");
		String uname=sc.next();
		System.out.println("Password : ");
		String pswd=sc.next();
		if(uname.equals("admin") && pswd.equals("admin123"))
		{
		System.out.println("WELCOME ADMIN"+"\n"+"Enter '1' to add travels details"+"\n"+"Enter '2' to delete travels details"+"\n"+
		   "Enter '3' to update seats of a travels"+"\n"+"Enter '4' to view travels details"+"\n"+"Enter '5' to view customer details");
		int c=sc.nextInt();
		switch(c)
		{
			case 1: {b1.addTravels(con);
			        break;}
			case 2:{b1.removeTravels(con);
			        break;}
			case 3:{b1.updateTicket(con);
			        break;}
			case 4:{b1.viewTravelsDetails(con);
			         break;}
			case 5:{b1.viewCustomerDetails(con);
			         break;}
			default:
			      System.out.println("Invalid request");
		}}
		else
		{System.out.println("Username or password incorrect !! Try again ");}
		
	}
	else if(s==2)
	{
		System.out.println("Bus Ticket Booking Welcomes you. Let's book your tickets");
	    b1.reservation(con);
	}}
	try{
	con.close();}
	catch(Exception e){ System.out.println(e);} 
}
}


/*1.create login for admin 
2.store user travel details 
3. add from to location 
4.create common link for sql 
5.create a simple homepage with jsp
6. create loop for entering into portal*/