package adminfunction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class adminmenuservlet
 */
@WebServlet("/adminmenuservlet")
public class adminmenuservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminmenuservlet() {
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
		  ResultSet rs;
		  System.out.print("	hello you are in");
		  /*boolean status = false;
	        HttpSession session = request.getSession();
	       session.setAttribute("name", n);
	       System.out.print(n+", "+p);*/
	        
        String a = request.getParameter("isbn");
        String b = request.getParameter("title");
        String c = request.getParameter("publisher_id");
        String d = request.getParameter("publication_date");
        String e = request.getParameter("author_id");
        String f = request.getParameter("branch_name");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost/library_management_system", "root", "");
 
            PreparedStatement ps = conn
                    .prepareStatement("INSERT INTO `book`(`isbn`, `title`, `publisher_id`, `publication_date`, `author_id`, `branch_name`) VALUES (?,?,?,?,?,?)");
 
            ps.setString(1, a);
            ps.setString(2, b);
            ps.setString(3, c);
            ps.setString(4, d);
            ps.setString(5, e);
            ps.setString(6, f);
            
            int i = ps.executeUpdate();
            conn.commit(); 
            String msg=" ";
            if(i!=0){  
              msg="Record has been inserted";
              pw.println("<font size='6' color=blue>" + msg + "</font>");  
            }  
            else{  
              msg="failed to insert the data";
              pw.println("<font size='6' color=blue>" + msg + "</font>");
             }  
            ps.close();
          }  
          catch (Exception e1){  
            pw.println(e1);  
          }  

  }

  }