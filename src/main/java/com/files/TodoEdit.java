package com.files;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodoEdit
 */
public class TodoEdit extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("Edit"));

		String data = request.getParameter("taskname");
		String data1 = request.getParameter("taskdes");
		String dbcon = "jdbc:mysql://localhost:3306/todos";
		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(dbcon, "root", "password");
			PreparedStatement ps = con.prepareStatement("update todo set taskname=?,des=? where id=?");
			ps.setString(1, data);
			ps.setString(2, data1);
			ps.setInt(3, id);
			int n=ps.executeUpdate();
			if(n>0) {
				response.sendRedirect("index.jsp");
			}
		}
		catch (Exception e) {
			// TODO: handle exception
		}
	}

}
