package com.ourProject1.login;  

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ourProject1.encrypt.perform;
import com.ourProject1.login.dao.LoginDao;
import com.ourProject1.login.model.Login;


@WebServlet("/Login")
public class LoginController extends HttpServlet {
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberID=request.getParameter("memberID");
		String Pass=request.getParameter("pass");
		LoginDao ld=new LoginDao();
		Login lg=ld.getUserName(memberID);
		if(memberID.equals(lg.getEmail()) && Pass.equals(perform.decrypt(lg.getPass()))) {
			HttpSession session=request.getSession();
			session.setAttribute("mess",lg);
			
			session.setAttribute("globEmail", memberID);
			String em=(String)session.getAttribute("globEmail");
			
			if(lg.getU_type().equals("owner")) {
			response.sendRedirect("Owner.jsp");
			}
			else if(lg.getU_type().equals("admin")) {
				response.sendRedirect("admin.jsp");
			}
			else if(lg.getU_type().equals("member")) {
				session.setAttribute("name", lg.getName());
				response.sendRedirect("UserView.jsp");
			}
			else {
				System.out.println("there is a error in selecting user type");
			}
		}
		else {
			
			System.out.println("There is no user like this");
			response.sendRedirect("index.jsp");
		}
		
		
	
	}

	
	

}
