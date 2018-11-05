
<%@ page import="java.sql.*" %>
<jsp:include page="adminpanel.jsp"></jsp:include>
<%ResultSet resultset =null;%>

<!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 align="center">Add Existing Book</h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Add Existing Book</li>
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
              <form role="form" method="post" action="">
                <!-- /.box-body -->
<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from book") ;
%>
                <div class="form-group">
                  <label>Select Book</label>
                  <select class="form-control select2" name="isbn">
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

<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/library_management_system", "root", "");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from branch") ;
%>
                <div class="form-group">
                  <label>Select Branch</label>
                  <select class="form-control select2" name="branch_id">
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

