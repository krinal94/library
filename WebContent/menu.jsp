<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">NYIT Library System</a>
    </div>
    <ul class="nav navbar-nav">
      
      <li class="dropdown" >
        <a class="dropdown-toggle" data-toggle="dropdown" href="adminmenu.jsp">Book
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
        <li><a href="adminmenu.jsp">Add New Book</a></li>
          <li><a href="addbook.jsp">Add Existing Book</a></li>  
          <li><a href="Book_info.jsp">Book Information</a></li>
        </ul>
      </li>
      
      <li><a href="publisher.jsp">Add Publisher</a></li>
      <li><a href="branch.jsp">Add Branch</a></li>
      
      <li><a href="AddReader.jsp">Add New Reader</a></li>
      
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown">Print
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="branch_info.jsp">Branch information</a></li>
          <li><a href="top_borrowers.jsp">Top 10 most frequent borrowers in branch and no. of books each has borrowed </a></li>
          <li><a href="top_books.jsp">Top 10 most borrowed books in a branch.</a></li>
        </ul>
      </li>
      
      <li><a href="#">Average Fine Paid Per Reader</a></li>
      
      <li class=""><a href="index.jsp">Quit</a></li>
    </ul>
  </div>
</nav>

