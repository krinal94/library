package adminfunction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class bookinfoservlet
 */
@WebServlet("/bookinfoservlet")
public class bookinfoservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookinfoservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        PrintWriter pw = response.getWriter(); 
		  //get the variables entered in the form

		  Connection connection=null;
		  ResultSet rs = null;
		  String sql;
		  Statement statement;
		  HttpSession session = null;
		  
		  /*boolean status = false;
	        HttpSession session = request.getSession();
	       session.setAttribute("name", n);
	       System.out.print(n+", "+p);*/
	        
      String a = request.getParameter("title");
      
      try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost/library_management_system", "root", "");

	sql = "select * from book";
	statement= connection.createStatement();
	rs = statement.executeQuery(sql);

/*	PreparedStatement ps = conn
	        .prepareStatement(sql);*/
	if(rs.next())
	{
	    System.out.println(rs.getString(1));
	    System.out.println(rs.getString(2));
	    System.out.println(rs.getString(3));
	    System.out.println(rs.getString(4));
	    System.out.println(rs.getString(5));
	}
//   conn.commit(); 
      	} 
      catch (Exception e) 
      {

          e.printStackTrace();
      }
      finally
      {

          try 
          {
              session.setAttribute("resultset", rs);
              RequestDispatcher rd= request.getRequestDispatcher("Book_info.jsp");
              rd.forward(request, response);
              //response.sendRedirect("editrecord.jsp");
          } 
          catch (Exception e) 
          {
              System.out.println("This is finally block editrecord.jsp");
              e.printStackTrace();
          }
      }

	}
}