<%@page import="com.ourProject1.login.model.Login"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<!-- this is for bootstrap arshad**************************************************************************************************-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--****************bootstrap   ends ***************************************************************************************** -->

<title>UserDetails</title>
<style type="text/css">

.checkbox {
  padding-left: 20px;
 
}

.checkbox label {
  display: inline-block;
  vertical-align: middle;
  position: relative;
  padding-left: 5px;
}

.checkbox label::before {
  content: "";
  display: inline-block;
  position: absolute;
  width: 17px;
  height: 17px;
  left: 0;
  margin-left: -20px;
  border: 1px solid #cccccc;
  border-radius: 3px;
  background-color: #fff;
  -webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
  -o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
  transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
}

.checkbox label::after {
  display: inline-block;
  position: absolute;
  width: 16px;
  height: 16px;
  left: 0;
  top: 0;
  margin-left: -20px;
  padding-left: 3px;
  padding-top: 1px;
  font-size: 11px;
  color: #555555;
}

.checkbox input[type="checkbox"] {
  opacity: 0;
  z-index: 1;
}

.checkbox input[type="checkbox"]:focus + label::before {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}

.checkbox input[type="checkbox"]:checked + label::after {
  font-family: 'FontAwesome';
  content: "\f00c";
}

.checkbox input[type="checkbox"]:disabled + label {
  opacity: 0.65;
}

.checkbox input[type="checkbox"]:disabled + label::before {
  background-color: #eeeeee;
  cursor: not-allowed;
}

.checkbox.checkbox-circle label::before {
  border-radius: 50%;
}

.checkbox.checkbox-inline {
  margin-top: 0;
}

.checkbox-primary input[type="checkbox"]:checked + label::before {
  background-color: #428bca;
  border-color: #428bca;
}

.checkbox-primary input[type="checkbox"]:checked + label::after {
  color: #fff;
}

.checkbox-danger input[type="checkbox"]:checked + label::before {
  background-color: #d9534f;
  border-color: #d9534f;
}

.checkbox-danger input[type="checkbox"]:checked + label::after {
  color: #fff;
}

.checkbox-info input[type="checkbox"]:checked + label::before {
  background-color: #5bc0de;
  border-color: #5bc0de;
}

.checkbox-info input[type="checkbox"]:checked + label::after {
  color: #fff;
}

.checkbox-warning input[type="checkbox"]:checked + label::before {
  background-color: #f0ad4e;
  border-color: #f0ad4e;
}

.checkbox-warning input[type="checkbox"]:checked + label::after {
  color: #fff;
}

.checkbox-success input[type="checkbox"]:checked + label::before {
  background-color: #5cb85c;
  border-color: #5cb85c;
}

.checkbox-success input[type="checkbox"]:checked + label::after {
  color: #fff;
}

.radio {
  padding-left: 20px;
}

.radio label {
  display: inline-block;
  vertical-align: middle;
  position: relative;
  padding-left: 5px;
}

.radio label::before {
  content: "";
  display: inline-block;
  position: absolute;
  width: 17px;
  height: 17px;
  left: 0;
  margin-left: -20px;
  border: 1px solid #cccccc;
  border-radius: 50%;
  background-color: #fff;
  -webkit-transition: border 0.15s ease-in-out;
  -o-transition: border 0.15s ease-in-out;
  transition: border 0.15s ease-in-out;
}

.radio label::after {
  display: inline-block;
  position: absolute;
  content: " ";
  width: 11px;
  height: 11px;
  left: 3px;
  top: 3px;
  margin-left: -20px;
  border-radius: 50%;
  background-color: #555555;
  -webkit-transform: scale(0, 0);
  -ms-transform: scale(0, 0);
  -o-transform: scale(0, 0);
  transform: scale(0, 0);
  -webkit-transition: -webkit-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
  -moz-transition: -moz-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
  -o-transition: -o-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
  transition: transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
}

.radio input[type="radio"] {
  opacity: 0;
  z-index: 1;
}

.radio input[type="radio"]:focus + label::before {
  outline: thin dotted;
  outline: 5px auto -webkit-focus-ring-color;
  outline-offset: -2px;
}

.radio input[type="radio"]:checked + label::after {
  -webkit-transform: scale(1, 1);
  -ms-transform: scale(1, 1);
  -o-transform: scale(1, 1);
  transform: scale(1, 1);
}

.radio input[type="radio"]:disabled + label {
  opacity: 0.65;
}

.radio input[type="radio"]:disabled + label::before {
  cursor: not-allowed;
}

.radio.radio-inline {
  margin-top: 0;
}

.radio-primary input[type="radio"] + label::after {
  background-color: #428bca;
}

.radio-primary input[type="radio"]:checked + label::before {
  border-color: #428bca;
}

.radio-primary input[type="radio"]:checked + label::after {
  background-color: #428bca;
}

.radio-danger input[type="radio"] + label::after {
  background-color: #d9534f;
}

.radio-danger input[type="radio"]:checked + label::before {
  border-color: #d9534f;
}

.radio-danger input[type="radio"]:checked + label::after {
  background-color: #d9534f;
}

.radio-info input[type="radio"] + label::after {
  background-color: #5bc0de;
}

.radio-info input[type="radio"]:checked + label::before {
  border-color: #5bc0de;
}

.radio-info input[type="radio"]:checked + label::after {
  background-color: #5bc0de;
}

.radio-warning input[type="radio"] + label::after {
  background-color: #f0ad4e;
}

.radio-warning input[type="radio"]:checked + label::before {
  border-color: #f0ad4e;
}

.radio-warning input[type="radio"]:checked + label::after {
  background-color: #f0ad4e;
}

.radio-success input[type="radio"] + label::after {
  background-color: #5cb85c;
}

.radio-success input[type="radio"]:checked + label::before {
  border-color: #5cb85c;
}

.radio-success input[type="radio"]:checked + label::after {
  background-color: #5cb85c;
}



</style>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
Login lg=(Login)session.getAttribute("mess");
if(lg.getName()==null){
	response.sendRedirect("Login.jsp");
}
%>

<div class="apple">
<form action="Logout">
<input class="btn-danger" type="submit" value="Logout">
<a style="float: right; color:white" href="changePw.jsp">Change Password</a>

</form>
</div>

<div class="container">
    <h1 class="well">Hi ${name}</h1>
	<div class="col-lg-12 well">
	<div class="row">
				<form action="UserView" method="post">
				  <% Connection conn=null;
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/book","root","");
	  
	  String gEmail=(String)session.getAttribute("globEmail");
	  ArrayList<String> al = new ArrayList<String>();
	  
			String sql="select description from interest where mid=(select mid from member where uid=(select uid from user where email=?))";
			PreparedStatement st=conn.prepareStatement(sql);
			st.setString(1,gEmail);
			st.execute();
			ResultSet rs2=st.executeQuery();
			while (rs2.next()){
				al.add(rs2.getString(1));
			}
			
	  String query="select * from member where uid=(select uid from user where email=?)";
	  PreparedStatement stmt=conn.prepareStatement(query);
	  stmt.setString(1,gEmail);
	  ResultSet rs=stmt.executeQuery();
	  if (rs.next())
	  {
		  %>
					<div class="col-sm-12">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>First Name</label>
								<input type="text" class="form-control" disabled="disabled" value="<%=rs.getString(2)%>">
							</div>
							<div class="col-sm-6 form-group">
								<label>Last Name</label>
								<input type="text" class="form-control" disabled="disabled" value="<%=rs.getString(3)%>">
							</div>
						</div>	
						<div class="form-group">
							<label>Date of Birth</label>
							<input type="date"  class="form-control" disabled="disabled" value="<%=rs.getDate(4)%>">
						</div>				
						<div class="form-group">
							<label>Permanent Address</label>
							<input type="text" class="form-control" name="p_address" value="<%=rs.getString(5)%>">
						</div>	
						<div class="form-group">
							<label>Current Address</label>
							<input type="text" class="form-control" name="c_address" value="<%=rs.getString(6)%>">
						</div>	
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Mobile</label>
								<input type="text" class="form-control" name="mobile" value="<%=rs.getString(7)%>">
							</div>		
							<div class="col-sm-6 form-group">
								<label>HomeTP No</label>
								<input type="text"  class="form-control" name="home_tel" value="<%=rs.getString(8)%>">
							</div>	
						</div>				
						<div class="form-group">
							<label>Email Address</label>
							<input type="email"  class="form-control" name="email" readonly="true" value="<%=gEmail%>">
						</div>			
					<div>
					<label>Tick your Interest:</label>
					
		           <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="Artificial Intelligence"<% 
                    		for (String string : al) {
                                if(string.matches("Artificial Intelligence")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
					    >
                      <label for="checkbox3">
                            Artificial Intelligence
                       </label>
                     </div>
                      <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="image processing"<% 
                    		for (String string : al) {
                                if(string.matches("image processing")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                    >
                      <label for="checkbox3">
                            Image Processing
                       </label>
                     </div>
                      <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="middle ware"<% 
                    		for (String string : al) {
                                if(string.matches("middle ware")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                    >
                      <label for="checkbox3">
                          Middle Ware
                       </label>
                     </div>
                      <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="art"<% 
                    		for (String string : al) {
                                if(string.matches("art")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                            >
                      <label for="checkbox3">
                            Art
                       </label>
                     </div>
                      <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="science fiction"<% 
                    		for (String string : al) {
                                if(string.matches("science fiction")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                            >
                      <label for="checkbox3">
                            Science Fiction
                       </label>
                     </div>
                      <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox"  name="selected" value="politics"<% 
                    		for (String string : al) {
                                if(string.matches("politics")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                            >
                      <label for="checkbox3">
                           Politics
                       </label>
                     </div>
                     <div class="checkbox checkbox-success">
                    <input id="checkbox3" type="checkbox" name="selected" value="religion"<% 
                    		for (String string : al) {
                                if(string.matches("religion")){
					        		out.print("checked=\"checked\"");
					    		}
                            } %>
                            >
                      <label for="checkbox3">
                            Religion
                       </label>
                     </div>
            
					</div>
					<div>	
					<input type="submit" class="form-control" id="submit" value="update">
					</div>
		<%
	  }
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }
  finally {
	  conn.close();
  }
  %>
				</form> 
				</div>
	</div>
	</div>

</body>
</html>