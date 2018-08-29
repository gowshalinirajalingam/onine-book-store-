package com.BookClub.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.BookClub.sendMail.SendEmail;
import com.BookClub.web.dao.ChangePwDao;
import com.BookClub.web.dao.ForgotPwDao;

import com.BookClub.web.model.ForgotPw;
 


@WebServlet("/ChangePw")
public class ChangePwController extends HttpServlet {

       
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");  
		PrintWriter out = response.getWriter();  
		
		
		String oldpw=request.getParameter("oldpwd");
		String newpswd=request.getParameter("newpswd");
		String confpw=request.getParameter("compswd");
		String uemail=request.getParameter("email1");
		
	  
		
		
		
		ChangePwDao fpd=new ChangePwDao();
	System.out.print(fpd.getEmailAndPW(uemail).getEmail());

		 if(fpd.getEmailAndPW(uemail).getEmail()==null)
		{
			
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('There is no user exist');");  
			out.println("location='changePw.jsp';");
			out.println("</script>");
		

		}
		 else if(!newpswd.equals(confpw)) {
			
			
			
			
			
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Confirm Password is incorrect');");  
			out.println("location='changePw.jsp';");
			out.println("</script>");
			

		}
		
		else if(!fpd.getEmailAndPW(uemail).getOldpw().equals(oldpw))
		{
			
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Password does not match with old password');");  
			out.println("location='changePw.jsp';");
			out.println("</script>");
		

		}
		else {
			
		fpd.SetPassword(uemail, newpswd);
		
		//send mail
		SendEmail se=new SendEmail(uemail);
		
		out.println("<script type=\"text/javascript\">");  
		out.println("alert('Password has been updated successfully');");  
		out.println("location='index.jsp';");
		out.println("</script>");
	
		
		
		}
		
		
		
		
	}

}
