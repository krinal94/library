package adminfunction;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import library.adminlogin;

/**
 * Servlet implementation class adminlogin
 */
@WebServlet("/adminloginservlet")
public class adminloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminloginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String n=request.getParameter("username");  
        String p=request.getParameter("password"); 
        boolean status = false;
        HttpSession session = request.getSession();
//        if(session!=null)
        session.setAttribute("name", n);
        System.out.print(n+", "+p);
        
//        Connection conn = null;
        PreparedStatement pst = null;
//        ResultSet rs = null;
        
        System.out.print("hello");
        String url = "jdbc:mysql://localhost/library_management_system";
        String dbName = "library_management_system";
//        String driver = "com.mysql.jdbc.Driver";
        String userName = "root";
        String password = "";
        try {
        	Class.forName("com.mysql.jdbc.Driver").newInstance();
        	Connection conn = DriverManager.getConnection(url, userName, password);

        	
        	pst = conn
                    .prepareStatement("select * from admin where username=? and password=?");
            pst.setString(1, n);
            pst.setString(2, p);
            

            ResultSet rs = pst.executeQuery();
        	while(rs.next()){
                //Retrieve by column name
                String dbusername = rs.getString("username");
                String dbpassword = rs.getString("password");
                status = true;

                //Display values
                System.out.println(" Username: " + dbusername);
                System.out.println(" Password: " + dbpassword);
             }

            rs = pst.executeQuery();

        } catch (Exception e) {
            System.out.println("exception"+e);
        }
        
        
        
        
        if(status){
        	
            RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");  
            rd.forward(request,response);  
        }  
        else{  
            //out.print("<p style=\"color:red\">Sorry username or password error</p>");
        	
            session.setAttribute("msg", "Sorry username or password error");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request,response);  
        }  

        out.close();  
	}

}
