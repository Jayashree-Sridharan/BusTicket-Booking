import java.util.*;
import javax.servlet.*;
import java.io.*;

public class loginServlet
{
	public void service(HttpServletRequest request, HttpServletResponse)
	{String uname=request.getParameter("user");
    String pswd=request.getParameter("pwd");
 
    if(uname.equals("admin") && pswd.equals("admin123"))
	{RequestDispatcher r = request.getRequestDispatcher("admin.jsp");
      r.forward(request,response);}
	else
    {out.println("Acess denied... Try again.");
    RequestDispatcher r = request.getRequestDispatcher("login.jsp");
      r.forward(request,response);}
	}
}

