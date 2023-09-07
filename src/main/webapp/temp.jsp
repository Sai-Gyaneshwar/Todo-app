<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: Yellow;
  color: white;
}
</style>
</head>
<body>
<h1>Retrieve data from database</h1>

<form action="TodoStatus" method="get"> <!-- Wrap the table in a form -->
<table id="customers" border="1">
<tr>
  <td>Check or Uncheck Task</td>
  <td>Task Id</td>
  <td>Task Name</td>
  <td>Task Description</td>
  <td>Task Status</td>
  <td>Operation</td>
</tr>

<%
try {
  Class.forName("com.mysql.cj.jdbc.Driver");
  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/todos","root","password");
  System.out.println("Connected");
  PreparedStatement ps = con.prepareStatement("select * from todo;");
  ResultSet rs = ps.executeQuery();
  int i=0; 
  while(rs.next()){ %>
    <tr>
      <td><input type="checkbox"  name="cb" value="<%= rs.getInt(1) %>"></td>
     <%--     <td><input type=name="cb<%= i %>" value="<%= rs.getInt(1) %>"></td> --%>
      <td><%= rs.getInt(1) %></td>
      <td><%= rs.getString(2) %></td>
      <td><%= rs.getString(3) %></td>
      <td><% if (rs.getString(4).equals("completed")) { %>
            completed
          <% } else { %>
            <input type="hidden" name="taskId" value="<%= rs.getInt(1) %>">
            <input type="text" name="taskStatus" value="<%= rs.getString(4) %>">
          <% } %></td>
      <td> 
        <% int taskId = rs.getInt(1); %>
        <form action="TaskDelete" method="post">
          <input type="hidden" name="delete" value="<%= taskId %>"> 
          <input type="submit" value="delete">
        </form>
        <form action="TaskUpdate" method="post">
          <input type="hidden" name="update" value="<%= taskId %>"> 
          <input type="hidden" name="update" value="<%= rs.getString(2) %>"> 
          <input type="hidden" name="update" value="<%= rs.getString(3) %>"> 
          <input type="submit" value="update">
        </form>
      </td> 
    </tr>
    <%
    i++;
  }
}
catch(Exception e){
  out.println(e.getMessage());
}
%>

<input type="submit" value="Update Status"> <!-- Add a submit button to update status -->
</table>
</form> <!-- Close the form -->
</body>
</html>