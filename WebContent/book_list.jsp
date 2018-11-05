<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

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
        <form role="form" action="" method="post">
            
          <div class="box-body">
            <div class="row">
              <div class="col-md-1 col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
                ISBN
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="inputEmail3" name="isbn" placeholder="Select ISBN">
                </div>
                <!-- /.form-group -->
              </div>
              
<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from book") ;
%>
              <div class="col-md-1">
                Book Name
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <input type="text" class="form-control" id="inputEmail3" name="book_name" placeholder="Select Book name">
                  <%  while(resultset.next()){ %>
            				<option value="<%= resultset.getString(1)%>" ><%= resultset.getString(2)%></option>
        				<% } %>
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
             
<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from publisher") ;
%>
              <div class="col-md-2">
                Publisher Name
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <select class="form-control select2" name="publisher_id">
                    <%  while(resultset.next()){ %>
            				<option value="<%= resultset.getString(1)%>" ><%= resultset.getString(2)%></option>
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
              <div class="col-md-1">
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
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Book Information</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                  <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Publisher Name</th>
                    <th>Publication Date</th>
                    <th>Author Name</th>
                  </tr>
                </thead>
                <tbody>
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <th>ID</th>
                    <th>ISBN</th>
                    <th>Title</th>
                    <th>Publisher Name</th>
                    <th>Publication Date</th>
                    <th>Author Name</th>
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



</body>
</html>