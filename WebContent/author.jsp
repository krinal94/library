

<jsp:include page="adminpanel.jsp"></jsp:include>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- right column -->
        <div class="col-md-8  col-sm-offset-2 col-md-offset-3 col-lg-offset-3">
          <!-- Horizontal Form -->
          <div class="box box-info" >
            <div class="box-header with-border">
              <h3 class="box-title">Add New Author</h3>
            </div>
                <div class="alert alert-danger alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                </div>
                <p class="login-box-msg"></p>
            <!-- form start -->
            <form class="form-horizontal" action="authorservlet" method="post"> 
              <div class="box-body">
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-4 control-label">Author Name : </label>

                  <div class="col-sm-8">
                    <input type="text" name="author_name" class="form-control" id="inputPassword3" placeholder="">
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

      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->

