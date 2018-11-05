<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 

<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<title>book information</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="aside.jsp"></jsp:include>

<jsp:include page="setting_sidebar.jsp"></jsp:include>
<%ResultSet resultset =null;%>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/library_management_system"
        user="root" password=""
    />
     
    <sql:query var="infobook"   dataSource="${myDS}">
        SELECT * FROM book  
    </sql:query>
	
    <!-- Main content -->
    <section class="content">
      <!-- SELECT2 EXAMPLE -->
      <div class="box box-default">
        <div class="box-header with-border">
          <div class="box-tools pull-right">
            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
          </div>
        </div>
        
          <div class="alert alert-error alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            
          </div>
          <p class="login-box-msg"></p>
          
          <div class="alert alert-success alert-dismissible">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
            
          </div>
          <p class="login-box-msg"></p>
          
        <!-- /.box-header -->
        <form role="form" action="bookinfoservlet" method="post">

<% ResultSet rs =(ResultSet)session.getAttribute("resultset"); 
      out.println("this is getAttribute of resultset" +rs);
%>

<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;
       rs =(ResultSet)session.getAttribute("rs");
       /* resultset =statement.executeQuery("select * from publisher") ; */
%>
          <div class="box-body">
            <div class="row">
              <div class="col-md-2 col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
                Select Book Name 
              </div>
              <div class="col-md-4 ">
                <div class="form-group">
                  <select class="form-control select2" name="title">
                    <%  while(rs.next()){ %>
            				<option value="<%= rs.getString(3)%>" ><%= rs.getString(3)%></option>
        			<% } %>
                  </select>
                </div>
				<!-- /.form-group -->
				</div>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
              <!-- /.col -->
              <div class="col-md-6 col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
                <div class="form-group">
                    <button type="submit" name="book_search" value="book_search" class="btn btn-primary">Submit</button>
                </div>
              </div>
            </div>
            <!-- /.row -->
          </div>
        </form>
      </div>
      <!-- /.box -->
      <div class="row">
        <div class="col-xs-12 col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Book Information</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>Title</th>
                    <th>Branch Name</th>
                    <th>No Of Copies</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="user" items="${infobook.rows}"> 
               		<tr>
                      <td><c:out value="${user.title}" /></td>
	                  <td><c:out value="${user.branch_name}" /></td>
	                  <td><c:out value="${user.copy_no}" /></td>
                	</tr>
            	  </c:forEach>
                </tbody>
                <tfoot>
                  <tr>
                    <th>Title</th>
                    <th>Branch Name</th>
                    <th>No Of Copies</th>
                  </tr>
                </tfoot>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->  
    
    <!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="bootstrap/js/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- <script>
  $.widget.bridge('uibutton', $.ui.button);
</script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<!-- <script src="dist/js/pages/dashboard.js"></script> -->
<!-- Bootstrap 3.3.6 -->
<script src="js/bootstrap.min.js"></script>
<!-- Select2 -->
<script src="plugins/select2/select2.full.min.js"></script>
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.min.js"></script>
<script src="plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="js/raphael-min.js"></script>
<script src="plugins/morris/morris.min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="js/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="js/demo.js"></script>