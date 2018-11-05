
<jsp:include page="adminpanel.jsp"></jsp:include>


    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- right column -->
        <div class="col-md-8  col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
          <!-- Horizontal Form -->
          <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Add New Branch</h3>
            </div>
                <div class="alert alert-danger alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                </div>
                <p class="login-box-msg"></p>
            <!-- /.box-header -->
            <!-- form start -->
            <form class="form-horizontal" action="branchservlet" method="post"> 
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-4 control-label">Branch name : </label>

                  <div class="col-sm-8">
                    <input type="text" name="branch_name" class="form-control" id="inputEmail3" placeholder="Branch Name">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">Branch Address : </label>

                  <div class="col-sm-8">
                    <input type="text" name="location" class="form-control" id="inputPassword3" placeholder="Branch Address">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" name="submit" value="submit" class="btn btn-info">Submit</button>
                <button type="submit" class="btn btn-default pull-right">Cancel</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
          <!-- /.box -->
        </div>
        <!--/.col (right) -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
