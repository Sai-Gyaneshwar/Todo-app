package com.files;

import java.sql.Connection;
import java.sql.DriverManager;

public class regustration2 {
static String url1="jdbc:mysql://localhost:3306/todos";
static String jdbc_user="root";
static String jdbc_password="password";
public static Connection getConnection() throws Exception {
	Class.forName("com.mysql.jdbc.Driver");
	return DriverManager.getConnection(url1,jdbc_user,jdbc_password);
}
}