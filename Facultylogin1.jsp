<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>

<body style="background-color:#5DE2E7;">
<div class="container mt-4" style="background-color:#FFDE59; color: white;"></div>

    


<%@ page import="java.sql.*" %>
<%
String user = request.getParameter("username");
String pass = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/zeal", "root", "root");
PreparedStatement ps = con.prepareStatement("SELECT * FROM faculty_login WHERE username=? AND password=?");
ps.setString(1, user);
ps.setString(2, pass);
ResultSet rs = ps.executeQuery();

if(rs.next()) {
    session.setAttribute("admin", user);
    response.sendRedirect("header5.jsp");
} else {
    out.println("Invalid login. Try again.");
}
%>
</body>
</html>