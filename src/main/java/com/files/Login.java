package com.files;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebServlet;




@WebServlet("/Login")
public class Login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		String name=request.getParameter("uname");
		String password=request.getParameter("pass");
	
		logincon log=new logincon();
		if(log.check(name, password)) {
			HttpSession session=request.getSession();
			session.setAttribute("uname", name);
			response.sendRedirect("index.jsp");
		}
		else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Invalid Username or Password ! Try Again');");
			out.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
		
	}


	

}