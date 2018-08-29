<%@page import="java.util.List"%>
<%@page import="java.util.*"%>

<%@page import="com.ourProject1.login.model.Login"%>
<%@page import ="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>OwnerPage</title>
<!-- this is for bootstrap arshad**************************************************************************************************-->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!--****************bootstrap   ends ***************************************************************************************** -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script>
function myFunction() {
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

<style> 
input[type=text] {
    width: 200px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
}

 .apple{
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

<br><br><br>
<div>
<input class="name" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Using Id..." title="Type in a name">
</div>
<br>
<div class="table-responsive">
<table class="table" id="myTable">
  <tr class="header">
    <th>FullName</th>
     <th >Date of Birth</th>
      <th >Current Address</th>
       <th >Permanent Address</th>
        <th >Mobile</th>
         <th >Telephone No</th>
          <th >Interests</th>
  </tr>
  <%
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  String url="jdbc:mysql://localhost:3306/book";
	  String username="root";
	  String password="";
	  
	 
	  String query="select * from member";
	  Connection conn=DriverManager.getConnection(url, username, password);
	  Statement stmt=conn.createStatement();
	  ResultSet rs=stmt.executeQuery(query);
	  while(rs.next())
	  {
		  //
		 List<String> asd=new ArrayList<String>();
		 int x=Integer.parseInt(rs.getString(1));
		  System.out.println(x);
		  String query2="select * from interest i where i.mid = ?";
		  PreparedStatement st=conn.prepareStatement(query2);
		  st.setInt(1,x);
		  ResultSet rss=st.executeQuery();
		  while(rss.next()){
			  asd.add(rss.getString(2));
			  
		  }
		  %>
		  <tr>
		  <td><%=rs.getString(2)+" "+rs.getString(3)%></td>
		  <td><%=rs.getDate(4)%></td>
		  <td><%=rs.getString(5) %></td>
		  <td><%=rs.getString(6) %></td>
		  <td><%=rs.getString(7) %></td>
		   <td><%=rs.getString(8) %></td>
		   <td><%
		   Iterator<String> iterator = asd.iterator();
		    while (iterator.hasNext()) {    
		        out.println(iterator.next()+" ,");
		    }
		    asd.clear();
		   
		   %></td>
		  </tr>
		   <%
		  }
	  
	  rs.close();
	  stmt.close();
	  conn.close();
  }
  catch(Exception e)
  {
  e.printStackTrace();
  }
  %>
  
</table>

</div>
</body>
</html>