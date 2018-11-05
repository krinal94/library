<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>NYIT Library System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="menu.jsp"></jsp:include>
<div class="container">
  <h2>Add New Book</h2>
  <form class="form-horizontal" action="adminmenuservlet" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="isbn">ISBN:</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="isbn" placeholder="" name="isbn">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">Title:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="title" placeholder="" name="title">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="select">Select Publisher:</label>
      <div class="col-sm-10">          
        <select class="form-control selectpicker"id="select" placeholder="" name="publisher_id">
        <option>1</option>
  		<option>2</option>
  		<option>3</option>
		</select>
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="author">Author Name:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="author" placeholder="" name="author_id">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pubdate">Publication Date:</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="pubdate" placeholder="" name="publication_date">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="branch">Select Branch Name:</label>
      <div class="col-sm-10">          
        <select class="form-control selectpicker" id="branch" placeholder="" name="branch_name">
        <option>Mustard</option>
  		<option>Ketchup</option>
  		<option>relish</option>
		</select>
      </div>
    </div>
    
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default">Submit</button>
      </div>
    </div>
  </form>
</div>
</body>
</html>
