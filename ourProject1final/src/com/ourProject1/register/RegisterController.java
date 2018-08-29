package com.ourProject1.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ourProject1.encrypt.perform;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		String fname, lname, pAddress, cAddress, mobNo, homeNo, email,pwd,conPwd;
		String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
	    Pattern pattern = Pattern.compile(regex);
	    Pattern pattern2 = Pattern.compile("^[0-9]{10}$");
		boolean valid = true;
		
		fname=request.getParameter("fname").toString();
		lname=request.getParameter("lname").toString();
		pAddress=request.getParameter("p_address").toString();
		cAddress=request.getParameter("c_address").toString();
		mobNo=request.getParameter("mobile").toString();
		homeNo=request.getParameter("home_tel").toString();
		email=request.getParameter("email").toString();
		pwd=request.getParameter("pwd").toString();
		conPwd=request.getParameter("con_pwd").toString();
		
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date;
		java.sql.Date sqlStartDate = null;
		try {
			date = sdf1.parse(request.getParameter("DoB").toString());
			sqlStartDate = new java.sql.Date(date.getTime()); 
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String select[]= request.getParameterValues("selected");
		if(select == null) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Select atleast one interest.');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
			System.out.println("Select atleast one interest");
	        valid = false;
		}
		if (sqlStartDate.after(new Date())) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Date invalid. Cannot be a future date.');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
	        System.out.println("Date invalid");
	        valid = false;
		}
		
		Matcher matcher = pattern.matcher(pwd);
		if (!matcher.matches()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Password should contains atleast 8 characters including a digit,a lower case,an uppercase letter,a special character and no spaces allowed');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
	        System.out.println("pass inval");
	        valid = false;
		}
		if (!pwd.equals(conPwd)) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Your password mismatch.');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
	        System.out.println("pass mismatch");
	        valid = false;
		}
		Matcher matcher2 = pattern2.matcher(mobNo);
		if (!matcher2.matches()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Invalid Mobile No. Cannot contain characters.');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
	        System.out.println("mob inval");
	        valid = false;
		}
		Matcher matcher3 = pattern2.matcher(homeNo);
		if (!matcher3.matches()) {
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Invalid Home No. Cannot contain characters.');");
	        out.println("location='Register.jsp';");
	        out.println("</script>");
	        System.out.println("hp inval");
	        valid = false;
	        
		}
		if (valid) {
			RegisterDao Rd=new RegisterDao();
			Rd.registerDetails(fname,lname, sqlStartDate, pAddress, cAddress, mobNo, homeNo, email,perform.encrypt(pwd),select);
			out.println("<script type=\"text/javascript\">");
	        out.println("alert('Register Successful !!');");
	        out.println("location='index.jsp';");
	        out.println("</script>");
		}
	}
	}


