<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body {
    margin: 0;
    height: 100vh;
    font-family: Arial, Helvetica, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;

    background: linear-gradient(135deg, #ff9a9e, #fad0c4, #a1c4fd, #c2e9fb);
    background-size: 400% 400%;
    animation: gradientMove 15s ease infinite;
}



.forgot-container {
    width: 380px;
    background: linear-gradient(145deg, #9b7bbd, #7e5aa6);
    padding: 25px;
    border-radius: 15px;
    color: white;
    box-shadow: 0 20px 40px rgba(0,0,0,0.35), inset 0 3px 6px rgba(255,255,255,0.2);
    transform-style: preserve-3d;
    transition: transform 0.4s ease, box-shadow 0.4s ease;
}

.forgot-container:hover {
    transform: translateY(-10px) scale(1.02);
    box-shadow: 0 35px 60px rgba(0,0,0,0.45), inset 0 3px 6px rgba(255,255,255,0.25);
}

.forgot-container h3 {
    background: linear-gradient(135deg, #ffd86f, #fc6262);
    color: #222;
    padding: 12px;
    border-radius: 10px;
    text-align: center;
    margin-bottom: 25px;
    font-weight: bold;
}

.form-control {
    border-radius: 10px;
    box-shadow: inset 3px 3px 6px rgba(0,0,0,0.2);
}

.btn-reset {
    width: 100%;
    border: none;
    border-radius: 10px;
    padding: 10px;
    font-weight: bold;
    color: white;
    background: linear-gradient(135deg, #1fa2ff, #12d8fa);
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    transition: all 0.3s ease;
}

.btn-reset:hover {
    transform: translateY(-2px);
    background: linear-gradient(135deg, #12d8fa, #1fa2ff);
    box-shadow: 0 12px 25px rgba(0,0,0,0.4);
}

a {
    font-weight: bold;
    text-decoration: none;
}
</style>
</head>

<body>

<div class="forgot-container">

    <h3>Forgot Password</h3>
    <%
        String username = request.getParameter("username");
        String newPassword = request.getParameter("newPassword");
        String submit = request.getParameter("submit");

        if (submit != null) {
        	try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost/zeal", 
                    "root", 
                    "root"
                );

                PreparedStatement ps = con.prepareStatement(
                    "UPDATE faculty_login SET password=? WHERE username=?"
                );

                ps.setString(1, newPassword);
                ps.setString(2, username);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<div class='alert alert-success text-center'>Password updated successfully!</div>");
                } else {
                    out.println("<div class='alert alert-danger text-center'>Username not found!</div>");
                }

                ps.close();
                con.close();

            } catch (Exception e) {
                out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
            }
        }
    %>

     <form method="post">
        <div class="mb-3">
            <label>Username</label>
            <input type="text" name="username" class="form-control" required>
        </div>

        <div class="mb-3">
            <label>New Password</label>
            <input type="password" name="newPassword" class="form-control" required>
        </div>

        <button type="submit" name="submit" class="btn btn-reset">
            Reset Password
        </button>
    </form>

    <div class="text-center mt-3">
        <small>
            Remembered your password?
            <a href="Facultylogin.jsp" style="color:#fff;">Login</a>
        </small>
    </div>

</div>

</body>
</html>