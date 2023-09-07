package com.files;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/forgotpassword")
public class forgotpassword extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("funame");
		String fpassword=request.getParameter("fpassword");
		String ffpassword=request.getParameter("ffpassword");

	
		forgotpss2 forgot= new forgotpss2();
		if(forgot.checkingusername(fname)){
//			HttpSession session=request.getSession();
//			session.setAttribute("uname", fname);
			try(Connection connection = regustration2.getConnection()) {
				String sql="update users set password=? where name=?";
				PreparedStatement st=connection.prepareStatement(sql);
				
				st.setString(1,fpassword);
				st.setString(2,fname);
				
				PrintWriter pw=response.getWriter();
				response.setContentType("text/html");

				int rt=st.executeUpdate();
				if(rt>0) {
					pw.println("<script type=\"text/javascript\">");
					pw.println("alert('Password Changed Successfully!');");
					pw.println("</script>");
//					response.sendRedirect("login.jsp");
					RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
					rd.include(request, response);
				}
				
				
				
		}
			catch (Exception e) {
			 System.out.println(e.getMessage()); 
			 response.getWriter().write("you enter the worng username");
			}
		
		}
		
	}
}