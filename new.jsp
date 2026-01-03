<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
</head>
<style>

body {
    background-color: #f0f2f5;
    font-family: Arial, sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    margin: 0;
}

.card {
    width: 440px;
    border-radius: 12px;
    background-color: white;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    overflow: hidden;
}


.header {
    background: linear-gradient(90deg, #1A9E37, #217AC4);
    padding: 30px;
    color: white;
    text-align: center;
}

.header h1 {
    margin: 0;
    font-size: 24px;
}

.header p {
    margin-top: 10px;
    font-size: 14px;
}



.links {
    display: flex;
    justify-content: center; 
    padding: 20px;
    padding-top: 0; 
    gap: 0; 
    width: fit-content;
    margin: 20px auto 0 auto; 
    background-color: #f0f2f5; 
    border-radius: 10px; 
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.links a {
    flex: 1; 
    padding: 12px 20px;
    background: none; 
    color: #333; 
    text-decoration: none;
    text-align: center;
    font-weight: bold;
    transition: background-color 0.3s ease;
    border-radius: 0; 
    white-space: nowrap; 
}


.links a.active {
    background-color: white; 
    color: #217AC4; 
    border-radius: 8px; 
    box-shadow: 0 1px 4px rgba(0,0,0,0.1); 
    transform: translateY(0); 
}


.links a:not(.active):hover {
    background-color: #e5e5e5; 
    color: #217AC4;
    border-radius: 8px;
}

.links a:first-child {
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}

.links a:last-child {
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}



.login-container {
    width: 380px;
    padding: 30px;
    border-radius: 15px;
    color: white;
    text-align: center;
    background: linear-gradient(135deg, #8e2de2, #ff416c);
    box-shadow: 0 15px 35px rgba(0,0,0,0.3);
    margin: 30px auto; /* Increased margin top to separate from role links */
}

.input-box {
    margin-bottom: 15px;
}

.input-box input {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    box-shadow: inset 2px 2px 5px rgba(0,0,0,0.2);
}

.btn {
    width: 100%;
    padding: 10px;
    border-radius: 8px;
    border: none;
    font-weight: bold;
    background-color: #ff416c; 
    color: white;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn:hover {
    background-color: #8e2de2;
    transform: translateY(-2px);
}

.extra-options {
    margin-top: 15px;
}

.extra-options a {
    color: white;
    font-weight: bold;
    text-decoration: none;
    margin: 0 5px;
}

.extra-options span {
    color: white;
}
.password-box {
    position: relative;
}

.password-box i {
    position: absolute;
    right: 12px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #444;
}

</style>
</head>
<body>
<script>
function togglePassword() {
    var pwd = document.getElementById("password");
    if (pwd.type === "password") {
        pwd.type = "text";
    } else {
        pwd.type = "password";
    }
}
</script>

<div class="card">
    <div class="header">
        <h1>Login to Portal</h1>
        <p>Choose your role to continue</p>
    </div>

    <div class="links">
        <a href="new.jsp" class="active">Student</a>
        <a href="Facultylogin.jsp">Faculty</a>
        <a href="Adminlogin.jsp">Admin</a>
    </div>
<div class="login-container">

    <h2>Student Login</h2>
    

    <form action="NewFile1.jsp" method="post">
        <div class="input-box">
            <input type="text" name="username" placeholder="Enter username" required>
        </div>

       <div class="input-box password-box">
    <input type="password" name="password" id="password" placeholder="Enter password" required>
    <i class="fa fa-eye" onclick="togglePassword()"></i>
</div>

        <div class="input-box">
            <input type="submit" value="Login as Student" class="btn">
        </div>
    </form>

    <div class="extra-options">
        <a href="forgotPassword.jsp">Forgot Password?</a>
        <span>|</span>
        <a href="signupstd.jsp">Sign Up</a>
    </div>

</div>

</div>
</body>
</html>
