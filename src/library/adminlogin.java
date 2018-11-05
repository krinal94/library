package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class adminlogin {
	
	    public static boolean validate(String name, String pass) {        
	        boolean status = false;
	        Connection conn = null;
	        PreparedStatement pst = null;
	        ResultSet rs = null;

	        System.out.print("hello");
	        String url = "jdbc:mysql://localhost:3306/";
	        String dbName = "library_management_system";
	        String driver = "com.mysql.jdbc.Driver";
	        String userName = "";
	        String password = "";
	        try {
	            Class.forName(driver).newInstance();
	            conn = DriverManager
	                    .getConnection(url + dbName, userName, password);

	            pst = conn
	                    .prepareStatement("select * from admin where username=? and password=?");
	            pst.setString(1, name);
	            pst.setString(2, pass);
	            

	            rs = pst.executeQuery();
	            status = rs.next();
	            System.out.println("table: "+rs);

	        } catch (Exception e) {
	            System.out.println("exception"+e);
	        } finally {
	            if (conn != null) {
	                try {
	                    conn.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (pst != null) {
	                try {
	                    pst.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (rs != null) {
	                try {
	                    rs.close();
	                } catch (SQLException e) {
	                    e.printStackTrace();
	                }
	            }
	        }
	        return status;
	    }
	}
