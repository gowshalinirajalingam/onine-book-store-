package com.ourProject1.userView;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserViewController
 */
@WebServlet("/UserView")
public class UserViewController extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String pAddress, cAddress, mobNo, homeNo;
	    Pattern p = Pattern.compile("^[0-9]{10}$");
		boolean valid = true;
		
		String email=request.getParameter("email").toString();
		System.out.println(email);
		
		pAddress=request.getParameter("p_address").toString();
		cAddress=request.getParameter("c_address").toString();
		mobNo=request.getParameter("mobile").toString();
		homeNo=request.getParameter("home_tel").toString();
		
		String select[]= request.getParameterValues("selected");
		if(select == null) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Select atleast one interest.');");
	        out.println("location='UserView.jsp';");
	        out.println("</script>");
			System.out.println("Select atleast one interest");
	        valid = false;
		}
		Matcher matcher2 = p.matcher(mobNo);
		if (!matcher2.matches()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Invalid Mobile No. Cannot contain characters.');");
	        out.println("location='UserView.jsp';");
	        out.println("</script>");
	        System.out.println("mob inval");
	        valid = false;
		}
		Matcher matcher3 = p.matcher(homeNo);
		if (!matcher3.matches()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Invalid Home No. Cannot contain characters.');");
	        out.println("location='UserView.jsp';");
	        out.println("</script>");
	        System.out.println("hp inval");
	        valid = false;
	        
		}
		if (valid) {
			UserViewDao ud=new UserViewDao();
			ud.updateDetails(email, pAddress, cAddress, mobNo, homeNo,select);
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Update Successful !!');");
	        out.println("location='UserView.jsp';");
	        out.println("</script>");
		}
	}

}
