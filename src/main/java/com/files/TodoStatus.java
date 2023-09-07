package com.files;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class TodoStatus extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //   int chkb=Integer.parseInt(request.getParameter("taskId"));
			String[] taskIds= request.getParameter("Id").split(" ");
	    	//String[] taskIds =  request.getParameterValues("Id");
	        //String[] taskS = request.getParameterValues("Status");

	        if (taskIds != null ) {
	            try {
	                Class.forName("com.mysql.cj.jdbc.Driver");
	                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todos", "root", "password");

	                String updateQuery = "UPDATE todo SET status = 'Completed' WHERE id = ?";
	                PreparedStatement ps = con.prepareStatement(updateQuery);

//	                for (int i = 0; i < taskIds.length; i++){
//	                	ps.setString(1,taskIds[i]);
//	                	ps.setString(2, taskS[i]);
//	                    ps.executeUpdate();
//	                }
	                for(int i=0;i<taskIds.length;i++) {
	                    ps.setInt(1, Integer.parseInt(taskIds[i]));
	               // ps.setString(2, taskS);
	                ps.executeUpdate();
	                }
	                ps.close();
	                con.close();
	                response.sendRedirect("index.jsp");
	            } catch (ClassNotFoundException | SQLException e) {
	                e.printStackTrace();
	                response.getWriter().println("Error: " + e.getMessage());
	            }
	        } else {
	            response.getWriter().println("Invalid request parameters");
	        }
	    }
}
