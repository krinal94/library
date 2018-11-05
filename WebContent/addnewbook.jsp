
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
<title>Add new book</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">

<jsp:include page="header.jsp"></jsp:include>

<jsp:include page="aside.jsp"></jsp:include>

<jsp:include page="setting_sidebar.jsp"></jsp:include>

<%ResultSet resultset =null;%>


<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 align="center">Add New Book</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Add new book</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- right column -->
        <div class="col-md-3">

        </div>
        <div class="col-md-6">
          <!-- general form elements disabled -->
          <div class="box box-warning">
          
          
            <!-- /.box-header -->
            <div class="box-body">
                  <div class="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                  </div>
                  <p class="login-box-msg"></p>
              <form role="form" method="post" action="addnewbookservlet">
                <!-- text input -->
                <div class="form-group">
                  <label>ISBN Number</label>
                  <input type="text" class="form-control" name="isbn" placeholder="Enter ISBN no">
                </div>
                <div class="form-group">
                  <label>Book Title</label>
                  <input type="text" class="form-control" name="title" placeholder="Enter Book name">
                </div>
<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from publisher") ;
%>

                <!-- Publisher Name -->
                <div class="form-group">
                  <label>Select Publisher</label>
                  	<select class="form-control select2" name="publisher_name">
                		<%  while(resultset.next()){ %>
            				<option value="<%= resultset.getString(1)%>" ><%= resultset.getString(2)%></option>
        				<% } %>
        			</select>

        		<!-- <input id="publisher_name" type="text" value="" /> -->
                </div>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>

<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from author") ;
%>             
                <!-- Author name -->
                <div class="form-group">
                  <label>Select Author</label>
                  <select class="form-control select2" name="author_name">
                    <%  while(resultset.next()){ %>
            				<option value="<%= resultset.getString(1)%>" ><%= resultset.getString(2)%></option>
        				<% } %>
                  </select>
                </div>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
                <!-- Publication Date -->
                <div class="form-group">
                  <label>Publication Date:</label>

                  <div class="input-group date">
                    <div class="input-group-addon">
                      <i class="fa fa-calendar"></i>
                    </div>
                    <input type="text" class="form-control pull-right" name="publication_date" id="datepicker">
                  </div>
                  <!-- /.input group -->
                </div>

<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from branch") ;
%>
                <!-- /.box-body -->
                <div class="form-group">
                  <label>Select Branch</label>
                  <select class="form-control select2" name="branch_name">
                    <%  while(resultset.next()){ %>
            				<option value="<%= resultset.getString(2)%>" ><%= resultset.getString(2)%></option>
        				<% } %>
                  </select>
                </div>
<%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
                <div class="box-footer">
                  <button type="submit" name="submit" value="submit" class="btn btn-info">Submit</button>
                  <a href=""><label class="btn btn-default pull-right">Cancel</label></a>
                </div>
                <!-- /.box-footer -->
              </form>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
<!-- <script>
function populatepublishername(){
    var selectBox = document.getElementById('selectBox');

    /* selected value of dropdown */
    var selectedCustomerId = selectBox.options[selectBox.selectedIndex].value;

    /* selected value set to input field */
    document.getElementById('publisher_name').value = selectedCustomerId; 
} -->
</script>
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


</body>
</html>