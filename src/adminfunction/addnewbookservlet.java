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
 * Servlet implementation class addnewbookservlet
 */
@WebServlet("/addnewbookservlet")
public class addnewbookservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addnewbookservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		  System.out.print("hello");
		  /*boolean status = false;
	        HttpSession session = request.getSession();
	       session.setAttribute("name", n);
	       System.out.print(n+", "+p);*/
	        
	  String a = request.getParameter("isbn");
      
      String b = request.getParameter("title");
      
      String c = request.getParameter("publisher_name");
      
      String d = request.getParameter("author_name");
      
      String e = request.getParameter("publication_date");
      
      String f = request.getParameter("branch_name");
      
      
      try {
          Class.forName("com.mysql.jdbc.Driver");
          Connection conn = DriverManager.getConnection(
                  "jdbc:mysql://localhost/library_management_system", "root", "");
          String sql1 = "select * from book where title = ?";         
          PreparedStatement check = conn.prepareStatement(sql1);
          check.setString(1,b);
          ResultSet resultSet = check.executeQuery();
          if(resultSet.next()){
        	  String sql2 = "update copy set no_of_copies = no_of copies + 1 where title=?";
          }
          
          PreparedStatement ps = conn
                  .prepareStatement("INSERT INTO `book`( `isbn`,`title`,`publisher_id`,`author_id`,`publication_date`,`branch_name`) VALUES (?,?,?,?,?,?)");

          ps.setString(1, a);
          ps.setString(2, b);
          ps.setString(3, c);
          ps.setString(4, d);
          ps.setString(5, e);
          ps.setString(6, f);
          
          
          int i = ps.executeUpdate();
       //   conn.commit(); 
          String msg=" ";
          if(i!=0){  
        	  System.out.print("Record Added");
        	  response.sendRedirect("Book_info.jsp");
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