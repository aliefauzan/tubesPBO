<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrasi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .register-card {
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
        .btn-register {
            background-color: #343a40;
            border: none;
        }
        .btn-register:hover {
            background-color: #1976D2;
        }
        .btn-login {
            background-color: #2196F3;
            border: none;
        }
        .btn-login:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card shadow register-card">
            <div class="card-header">
                <h2>REGISTER</h2>
            </div>
            <div class="card-body">
                <form method="POST">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control" name="username" placeholder="Username" required>
                        <label>Username</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" name="password" placeholder="Password" required>
                        <label>Password</label>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="password" class="form-control" name="confirm-password" placeholder="Confirm password" required>
                        <label>Konfirmasi Password</label>
                    </div>
                    <button type="submit" class="btn btn-register w-100 text-white">Register</button>
                </form>
                <% 
                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        String username = request.getParameter("username");
                        String password = request.getParameter("password");
                        String confirmPassword = request.getParameter("confirm-password");

                        if (!password.equals(confirmPassword)) {
                            out.println("<p style='color:red; text-align:center;'>Password dan konfirmasi password tidak sesuai.</p>");
                        } else {
                            Connection conn = null;
                            PreparedStatement stmt = null;

                            try {
                                conn = JDBC.getConnection();
                                String query = "INSERT INTO users (username, password) VALUES (?, ?)";
                                stmt = conn.prepareStatement(query);
                                stmt.setString(1, username);
                                stmt.setString(2, password); // Untuk keamanan, hash password sebelum menyimpan.

                                int rowsInserted = stmt.executeUpdate();
                                if (rowsInserted > 0) {
                                    out.println("<p style='color:green; text-align:center;'>Registrasi berhasil! Silakan <a href='index.jsp'>login</a>.</p>");
                                } else {
                                    out.println("<p style='color:red; text-align:center;'>Registrasi gagal. Silakan coba lagi.</p>");
                                }
                            } catch (Exception e) {
                                out.println("<p style='color:red; text-align:center;'>Error: " + e.getMessage() + "</p>");
                            } finally {
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            }
                        }
                    }
                %>
                <div class="text-center mt-3">
                    <p>Sudah punya akun? <a href="index.jsp" class="btn btn-login text-white">Masuk Sekarang</a></p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
