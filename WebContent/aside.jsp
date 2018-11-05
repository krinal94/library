<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="image/user2-160x160.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
        <a href="#"><i class="fa fa-circle text-success"></i> Logged in as</a>
      </div>
      </div>
      
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <?php
      if(isset($_SESSION['type']) && $_SESSION['type'] == 'admin')
      {
      ?>
        <ul class="sidebar-menu">
        <li class="header">ADMIN NAVIGATION</li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Add A Book Copy</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="addnewbook.jsp"><i class="fa fa-circle-o"></i> Add New Book</a></li>
            <li><a href="addexistingbook.jsp"><i class="fa fa-circle-o"></i> Add Existing Book</a></li>
          </ul>
        </li>

        <li>
          <a href="Book_info.jsp">
            <i class="fa fa-calendar"></i> <span>Book Information</span>
          </a>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Reader</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="AddReader.jsp"><i class="fa fa-circle-o"></i> Add New Reader</a></li>
            <li><a href="reader_list.jsp"><i class="fa fa-circle-o"></i>Reader List</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Branch</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="branch.jsp"><i class="fa fa-circle-o"></i> Add New Branch</a></li>
            <li><a href="branch_list.jsp"><i class="fa fa-circle-o"></i>Branch Information</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Publisher</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="publisher.jsp"><i class="fa fa-circle-o"></i> Add New Publisher</a></li>
            <li><a href="publisher_list.jsp"><i class="fa fa-circle-o"></i>Publisher Information</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Author</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="author.jsp"><i class="fa fa-circle-o"></i> Add New Author</a></li>
            <li><a href="author_list.jsp"><i class="fa fa-circle-o"></i>Author Information</a></li>
          </ul>
        </li>

        <li class="treeview">
          <a href="#">
            <i class="fa fa-dashboard"></i> <span>Popularity</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li class="active"><a href="index.php?page=top_borrowers"><i class="fa fa-circle-o"></i> Top 10 Borrowers</a></li>
            <li><a href="index.php?page=top_books"><i class="fa fa-circle-o"></i> Top 10 Borrowed Books</a></li>
          </ul>
        </li>
      </ul>
      <?php
      }
      elseif(isset($_SESSION['type']) && $_SESSION['type'] == 'reader')
      {
        ?>
        <ul class="sidebar-menu">
          <li class="header">READER NAVIGATION</li>

          <li>
            <a href="book_list.jsp">
              <i class="fa fa-calendar"></i> <span>Find Book</span>
            </a>
          </li>
<!-- 
          <li>
            <a href="index.php?page=book_checkout_form">
              <i class="fa fa-calendar"></i> <span>Book Checkout</span>
            </a>
          </li> -->

          <li class="treeview">
            <a href="#">
              <i class="fa fa-dashboard"></i> <span>Checkout Book</span>
              <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
            </a>
            <ul class="treeview-menu">
              <li class="active"><a href="index.php?page=book_checkout_form"><i class="fa fa-circle-o"></i> Reserve Book</a></li>
              <li><a href="index.php?page=book_checkout_list"><i class="fa fa-circle-o"></i> Reserved Book List</a></li>
            </ul>
          </li>
          <li>
            <a href="index.php?page=book_checkout_list">
              <i class="fa fa-calendar"></i> <span>Book Return</span>
            </a>
          </li>

          <li>
            <a href="index.php?page=book_by_publisher">
              <i class="fa fa-calendar"></i> <span>Books By Publisher</span>
            </a>
          </li>

        </ul>
        <?php
      } 
      ?>

      
    </section>
    <!-- /.sidebar -->
  </aside>