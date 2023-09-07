<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int a=Integer.parseInt(request.getParameter("Edit"));%>
  <form action="TodoEdit" method="post">
  <label>taskname</label>
    <input type="text" name="taskname">
    <label>taskdes</label>
    <input type="text" name="taskdes">
    <input type="hidden" name="Edit" value=<%=a %>>
    <input type="submit" value="Save">
    </form>

</body>
</html>