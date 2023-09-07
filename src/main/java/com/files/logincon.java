package com.files;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class logincon {
	String sql="select * from users where name=? and password=?";
	String url="jdbc:mysql://localhost:3306/todos";
	String dbusername="root";
	String dbpassword="password";
	
	public boolean check(String name,String password) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,dbusername,dbpassword);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, name);
			st.setString(2, password);
		
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return false;
		
	}

}