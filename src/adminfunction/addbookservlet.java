package adminfunction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addbookservlet
 */
@WebServlet("/addbookservlet")
public class addbookservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addbookservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:mysql://localhost/library_management_system";
		  Connection connection=null;
		  ResultSet rs;
		  response.setContentType("text/html");
		  PrintWriter out = response.getWriter();
		  //get the variables entered in the form
		  String isbn = request.getParameter("isbn");
		  
		  String sbranch = request.getParameter("sbranch");
		  
		  try {
		  // Load the database driver
		  Class.forName("com.mysql.jdbc.Driver");
		  // Get a Connection to the database
		  connection = DriverManager.getConnection
		  (connectionURL, "root", ""); 
		  //Add the data into the database
		  String sql = 
		  "insert into book values (?,?,?,?,?,?)";
		  PreparedStatement pst = 
		  connection.prepareStatement(sql);
		  pst.setString(1, isbn);
		  pst.setString(6, sbranch);
		  
		  int numRowsChanged = pst.executeUpdate();
		  // show that the new account has been created
		  out.println(" Book added successfully ");
		  out.println(" '"+isbn+"'");
		  pst.close();
		  }
		  catch(ClassNotFoundException e){
		  out.println("Couldn't load database driver: " 
		  + e.getMessage());
		  }
		  catch(SQLException e){
		  out.println("SQLException caught: " 
		  + e.getMessage());
		  }
		  catch (Exception e){
		  out.println(e);
		  }
		  finally {
		  // Always close the database connection.
		  try {
		  if (connection != null) connection.close();
		  }
		  catch (SQLException ignored){
		  out.println(ignored);
		  }
		  }
		  }
		}