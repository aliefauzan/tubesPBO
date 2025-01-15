<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<%
    String errorMessage = null;
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = JDBC.getConnection();
        String query = "SELECT * FROM users WHERE username = ? AND password = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setString(1, username);
        stmt.setString(2, password);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            session.setAttribute("username", username);
            response.sendRedirect("menu.jsp");
        } else {
            errorMessage = "Login gagal. Username atau password salah.";
        }
    }
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            font-family: "Poppins", sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-card {
            max-width: 400px;
            margin: auto;
        }
        .card-header {
            background-color:#343a40; 
            background-size: cover;
            height: 150px;
            position: relative;
        }
        .card-header h2 {
            position: absolute;
            bottom: 10px;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            font-weight: bold;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.8);
        }
        .btn-login {
            background-color: #343a40;
            border: none;
        }
        .btn-login:hover {
            background-color: #1976D2;
        }
        .btn-register {
            background-color: #2196F3;
            border: none;
        }
        .btn-register:hover {
            background-color: #1976D2;
        }
        .error-message {
            color: red;
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow login-card">
            <div class="card-header">
                <h2>SIGN IN</h2>
            </div>
            <div class="card-body">
                <form method="POST">
                    <input type="hidden" name="action" value="login">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                        <label>Username</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                        <label>Password</label>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <input type="checkbox" id="remember" name="remember">
                            <label for="remember" class="form-check-label">Remember me</label>
                        </div>
                        <a href="#" class="text-decoration-none">Forgot password?</a>
                    </div>
                    <button type="submit" class="btn btn-login w-100 text-white mb-3">Login</button>
                    <% if (errorMessage != null) { %>
                    <p class="error-message text-center"><%= errorMessage %></p>
                    <% } %>
                </form>
                <div class="text-center">
                    <p>Belum punya akun? <a href="registrasi.jsp" class="btn btn-register text-white">Daftar Akun</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
