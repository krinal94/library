package adminfunction;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class readerloginservlet
 */
@WebServlet("/readerloginservlet")
public class readerloginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readerloginservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");  
        PrintWriter out = response.getWriter();  
        
        String r=request.getParameter("reader_id");  
       
        boolean status = false;
        HttpSession session = request.getSession();
//        if(session!=null)
        session.setAttribute("name", r);
        System.out.print(r+" ");
        
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
//        	Statement stmt = conn.createStatement();
//        	String sql = "select * from admin where username="+n+" and password="+p;
//        	ResultSet rs = stmt.executeQuery(sql);
        	
        	pst = conn
                    .prepareStatement("select * from reader where reader_id=?");
            pst.setString(1, r);
            

            ResultSet rs = pst.executeQuery();
        	while(rs.next()){
                //Retrieve by column name
                String dbusername = rs.getString("reader_id");
                status = true;

                //Display values
                System.out.println("reader_id: " + dbusername);
                
             }

            rs = pst.executeQuery();
            System.out.println("table: "+rs);

        } catch (Exception e) {
            System.out.println("exception"+e);
        }
        
        
        
        
        if(status){
        	
            RequestDispatcher rd=request.getRequestDispatcher("readerpanel.jsp");  
            rd.forward(request,response);  
        }  
        else{  
            //out.print("<p style=\"color:red\">Sorry card number invalid</p>");
        	
            session.setAttribute("msg", "Sorry card number invalid");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request,response);  
        }  

        out.close(); 
	}

}
