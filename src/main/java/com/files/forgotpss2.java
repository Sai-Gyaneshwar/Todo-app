package com.files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;


public class forgotpss2 {
	String sql="select * from users where name=?";
	String names="root";
	String pass="password";
	public boolean checkingusername(String name) {
	try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todos",names,pass);
	PreparedStatement st=con.prepareStatement(sql);
	st.setString(1,name);
	ResultSet rs=st.executeQuery();

	if(rs.next()) {
		return true;
	}
}
	catch (Exception e) {
		e.printStackTrace();
	}
	return false;
	}
}
