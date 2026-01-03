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
    background-color: white;
}

/* 3D COLOR CONTAINER */
.forgot-container {
    width: 380px;
    padding: 25px;
    border-radius: 10px;
    background: linear-gradient(145deg, #f0f6ff, #d9e8ff); /* 3D color */
    box-shadow: 
        0 15px 35px rgba(0,0,0,0.25),
        inset 0 2px 4px rgba(255,255,255,0.7);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.forgot-container:hover {
    transform: translateY(-6px);
    box-shadow: 
        0 25px 50px rgba(0,0,0,0.35),
        inset 0 2px 6px rgba(255,255,255,0.8);
}

/* 3D COLOR HEADER */
.forgot-container h3 {
    background: linear-gradient(135deg, #0d6efd, #084298);
    color: white;
    padding: 12px;
    border-radius: 6px;
    text-align: center;
    margin-bottom: 20px;
    box-shadow: 0 4px 10px rgba(0,0,0,0.25);
}

/* INPUTS */
.form-control {
    border-radius: 6px;
    border: 1px solid #b6cffc;
}

/* 3D COLOR BUTTON */
.btn-reset {
    width: 100%;
    border: none;
    border-radius: 6px;
    padding: 10px;
    font-weight: bold;
    color: white;
    background: linear-gradient(135deg, #0d6efd, #084298);
    box-shadow: 0 6px 15px rgba(0,0,0,0.3);
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

.btn-reset:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 22px rgba(0,0,0,0.4);
}

/* LINKS */
a {
    font-weight: bold;
    text-decoration: none;
    color: #0d6efd;
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
                    "UPDATE student1 SET password=? WHERE username=?"
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

        <button type="submit" name="submit" class="btn-reset">
            Reset Password
        </button>
    </form>

    <div class="text-center mt-3">
        <small>
            Remembered your password?
            <a href="new.jsp">Login</a>
        </small>
    </div>

</div>

</body>
</html>
