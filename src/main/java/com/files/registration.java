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

@WebServlet("/registration")
public class registration extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		String namer=request.getParameter("name");
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		String passcon=request.getParameter("conpass");
		if(!pass.equals(passcon)) {
			response.getWriter().write("password is worng or not matched");	
			return; }
		try(Connection connection = regustration2.getConnection()) {
			String sql="insert into users(name,email,password) values (?,?,?)";
			PreparedStatement st=connection.prepareStatement(sql);
			st.setString(1, namer);
			st.setString(2, email);
			st.setString(3, pass);
			int result =st.executeUpdate();
			PrintWriter pw=response.getWriter();
			response.setContentType("text/html");

			if(result>0) {

				pw.println("<script type=\"text/javascript\">");
				pw.println("alert('Registered Successfully!');");
				pw.println("</script>");
				RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			
			}
			else {
				response.getWriter().write("registration failed");
			}
			

		}
		catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("an error occurred: "+e.getMessage());
		}
	}

}