package adminfunction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class readerservlet
 */
@WebServlet("/readerservlet")
public class readerservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readerservlet() {
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
		  
		  /*boolean status = false;
	        HttpSession session = request.getSession();
	       session.setAttribute("name", n);
	       System.out.print(n+", "+p);*/
	        
      String a = request.getParameter("reader_name");
      
      String b = request.getParameter("reader_address");
      
      String c = request.getParameter("reader_phone");
      
      
      try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost/library_management_system", "root", "");

          PreparedStatement ps = conn
                  .prepareStatement("INSERT INTO `reader`(`reader_name`, `reader_address`, `reader_phone`) VALUES (?,?,?)");

          ps.setString(1, a);
          ps.setString(2, b);
          ps.setString(3, c);
          
          
          int i = ps.executeUpdate();
       //   conn.commit(); 
          String msg=" ";
          if(i!=0){  
        	  System.out.print("Recorded Added");
        	  response.sendRedirect("reader_list.jsp");
        	  //RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");  
              //rd.forward(request,response);    
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