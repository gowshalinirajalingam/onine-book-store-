<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Forgot Password</title>
<style type="text/css">
div.form
{
    display: block;
    text-align: center;
    float: left;
    margin: 10px;
    position:relative;
    
}
form
{
	/*this is for take form to center*/
    display: inline-block;
    margin-left: 80%;
    margin-right: 20%;
    margin-top:30%;
    text-align: left;
    background-color: #f4f9f2;
    
     /* this is to change the radius of from */
    border-radius: 25px;
    border: 2px solid #b7bfb3;
    padding: 20px; 
    width: 500px;
    height: 400px;  
    
}
#logpic{
 margin-top:10%;
 border-radius: 50%;
  margin-left: 30%;
   
  width: 500px;
  position:absolute;
  height: 300px; 
      float: left;
      margin: 100px;
     border:rgba(72,165,26,1);   
}
.footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
   background-color: red;
   color: white;
   text-align: center;
   }
   .header{
   position: fixed;
   left:0;
   top:0;
   width: 100%;
   background-color: green;
   color: white;
   text-align: center
   }

</style>


</head>
<body>
<div class="header">
<p><b>Book Club</b></p>
</div>
<div class="col-md-12">

<div class="form">
<form class="" action="ForgotPw" method="post">
  <div class="form-group">
    <label for="formGroupExampleInput">User Email</label>
    <input type="email" class="form-control" id="memberID" name="email1" placeholder="insert your email as user Email" required>
  </div>
 
  <div class="form-group">
    <label for="formGroupExampleInput2">New Password</label>
    <input type="password" class="form-control" name="newpswd" id="pass" placeholder="insert your New password" required>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Confirm Password</label>
    <input type="password" class="form-control" name="compswd" id="pass" placeholder="insert your confirmation password" required>
  </div>
  <div>
  <br>
  <input type="submit" class="form-control" id="submit" value="Submit" >
  </div>
  <div class="form-group" style="text-align: center">
  <br>
  
  </div>
</form>
</div>
</div>


        
        
    </body>
</html>