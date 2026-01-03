<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body style="background-color:#5DE2E7;">
<div class="container mt-4" style="background-color:#FFDE59; color: white;"></div>

    


<%@ page import="java.sql.*" %>
<%
String user = request.getParameter("username");
String pass = request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/zeal", "root", "root");
PreparedStatement ps = con.prepareStatement("SELECT * FROM student1 WHERE username=? AND password=?");
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