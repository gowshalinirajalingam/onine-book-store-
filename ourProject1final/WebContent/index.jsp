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

<title>Welcome</title>
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
    margin-top:50%;
    text-align: left;
    background-color: #f4f9f2;
    
     /* this is to change the radius of from */
    border-radius: 25px;
    border: 2px solid #b7bfb3;
    padding: 20px; 
    width: 500px;
    height: 300px;  
    
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
<p><b>Book Club Web App</b></p>
</div>
<div class="col-md-12">
<div>
<img class="img-responsive" alt="login" id="logpic" src="./Images/booklogin.jpg">
</div>
<div class="form">
<form class="" action="Login" method="post">
  <div class="form-group">
    <label for="formGroupExampleInput">UserName</label>
    <input type="email" class="form-control" id="memberID" name="memberID" placeholder="insert your email as user name" required>
  </div>
  <div class="form-group">
    <label for="formGroupExampleInput2">Password</label><a style="float: right">Forgot Password?</a>
    <input type="password" class="form-control" name="pass" id="pass" placeholder="insert your password" required>
  </div>
  <div>
  <br>
  <input type="submit" class="form-control" id="submit" value="login">
  </div>
  <div class="form-group" style="text-align: center">
  <br>
  <!-- <a>Register New User</a>
  	<input type="button" class="form-control" id="submit" value="Register New User">
  -->
 	 <a class="button" href="Register.jsp">Register New User</a>
  </div>
</form>
</div>
</div>
</body>
</html>