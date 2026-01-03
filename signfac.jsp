<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body {
    margin: 0;
    height: 100vh;
    font-family: Arial, Helvetica, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: white; /* White background */
}

.signup-container {
    width: 380px;
    padding: 25px;
    border-radius: 8px;
    background-color: #f8f9fa; /* light gray */
    border: 1px solid #ccc;
}

.signup-container h3 {
    background-color: #cfe2ff;   /* Light Blue Box */
    color: #000;                 /* Text unchanged */
    padding: 10px;
    border-radius: 6px;
    text-align: center;
    margin-bottom: 20px;

    /* 3D effect */
    box-shadow: 
        inset 0 -2px 4px rgba(0,0,0,0.2),
        0 3px 6px rgba(0,0,0,0.15);
}

.input-box {
    margin-bottom: 15px;
}

.input-box input {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

.btn {
    width: 100%;
    padding: 10px;
    border-radius: 5px;
    border: none;
    background-color: #0d6efd; /* Bootstrap blue */
    color: white;
    font-weight: bold;
}

.btn:hover {
    background-color: #0b5ed7;
}

a {
    font-weight: bold;
    text-decoration: none;
}
</style>
</head>

<body>

<div class="signup-container">
    <h3>Create Account</h3>

<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String submit = request.getParameter("submit");

    if (submit != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost/zeal",
                "root",
                "root"
            );

            PreparedStatement prstm = con.prepareStatement(
                "INSERT INTO student1 (username, password) VALUES (?, ?)"
            );
            prstm.setString(1, username);
            prstm.setString(2, password);
            prstm.executeUpdate();

        } catch (SQLException e) {
            out.println("Database error: " + e.getMessage());
        }
    }
%>

    <form method="post">
        <div class="input-box">
            <input type="text" name="username" placeholder="Enter username" required>
        </div>

        <div class="input-box">
            <input type="password" name="password" placeholder="Enter password" required>
        </div>

        <div class="input-box">
            <input type="submit" name="submit" value="Register" class="btn">
        </div>
    </form>

    <div class="text-center mt-3">
        <small>
            Already have an account?
            <a href="Facultylogin.jsp">Login</a>
        </small>
    </div>
</div>

</body>
</html>
