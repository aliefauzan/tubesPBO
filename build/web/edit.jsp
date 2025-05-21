<%-- 
    Document   : edit
    Created on : 3 Jan 2025, 23.35.24
    Author     : raiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
            font-family: "Poppins", sans-serif;
        }
        .fixed-menu {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 220px;
            background-color: #343a40;
            padding-top: 30px;
        }
        .fixed-menu a {
            display: block;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .fixed-menu a:hover {
            background-color: #1976D2;
        }

        .content {
            margin-left: 240px;
        }
        .edit-card {
            max-width: 600px;
            margin: 30px auto;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #343a40;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 20px;
        }
        .form-control, .btn-update {
            border-radius: 5px;
        }
        .btn-update {
            background-color: #343a40;
            border: none;
            font-weight: bold;
        }
        .btn-update:hover {
            background-color: #1976D2;
        }
        .card-body {
            padding: 30px;
        }
    </style>
</head>
<body>
    <!-- Fixed Menu on the left -->
    <div class="fixed-menu">
        <div class="logo-container text-center mb-4">
            <img src="https://i.ibb.co.com/9TCjSps/singgung.jpg" alt="Logo" class="img-fluid" style="max-width: 80%; border-radius: 5px;">
        </div>
        <a href="menu.jsp">Dashboard</a>
        <a href="view.jsp">Lihat Barang</a>
        <a href="add.jsp">Tambah Barang</a>
        <a href="ambil.jsp">Ambil Barang</a>
        <a href="history.jsp">Riwayat Transaksi</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <div class="content">
        <div class="container">
            <div class="card shadow edit-card">
                <div class="card-header">
                    <h2>Edit Barang</h2>
                </div>
                <div class="card-body">
                    <%
                        // Pastikan parameter "id" tersedia
                        String idParam = request.getParameter("id");
                        if (idParam == null) {
                    %>
                        <div class="alert alert-danger" role="alert">
                            Error: Parameter 'id' tidak ditemukan.
                        </div>
                    <%
                        } else {
                            int id = Integer.parseInt(idParam);
                            ResultSet rs = JDBC.getBarang();

                            boolean found = false;
                            while (rs.next()) {
                                if (rs.getInt("id") == id) {
                                    found = true;
                    %>
                    <form action="edit_product.jsp" method="POST">
                        <input type="hidden" name="id" value="<%= id %>">
                        <div class="form-floating mb-3">
                            <input type="text" class="form-control" name="nama_barang" placeholder="Nama Barang" value="<%= rs.getString("nama_barang") %>" required>
                            <label for="nama_barang">Nama Barang</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input type="number" class="form-control" name="stok" placeholder="Stok" value="<%= rs.getInt("stok") %>" required>
                            <label for="stok">Stok</label>
                        </div>
                        <button type="submit" class="btn btn-update w-100 text-white">Update Barang</button>
                    </form>
                    <%
                                }
                            }
                            if (!found) {
                    %>
                        <div class="alert alert-danger" role="alert">
                            Error: Barang dengan ID <%= id %> tidak ditemukan.
                        </div>
                    <%
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
