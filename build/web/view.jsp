<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daftar Produk</title>
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
        table {
            margin-top: 20px;
            border-radius: 10px;
            overflow: hidden;
            border: none;
        }
        table th, table td {
            text-align: center;
            vertical-align: middle;
        }
        table th {
            background-color: #343a40;
            color: white;
        }
        table thead tr th:first-child {
            border-top-left-radius: 10px;
        }
        table thead tr th:last-child {
            border-top-right-radius: 10px;
        }
        table tbody tr td:first-child {
            border-bottom-left-radius: 10px;
        }
        table tbody tr td:last-child {
            border-bottom-right-radius: 10px;
        }
        table tr:hover {
            background-color: #f1f1f1;
        }
        .table-wrapper {
            overflow-x: auto;
        }
        .btn-custom {
            background-color: #2196F3;
            color: white;
        }
        .btn-custom:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>
    <!-- Fixed Menu -->
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
            <h1 class="text-center my-4">Daftar Barang</h1>
            <div class="d-flex justify-content-end mb-3">
                <a href="add.jsp" class="btn btn-custom">Tambah Barang</a>
            </div>
            <table class="table table-bordered table-striped">
                <thead class="table-dark">
                    <tr>
                        <th>Nama Barang</th>
                        <th>Stok</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ResultSet rs = JDBC.getBarang();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("nama_barang") %></td>
                        <td><%= rs.getInt("stok") %></td>
                        <td>
                            <a href="edit.jsp?id=<%= rs.getInt("id") %>" class="btn btn-warning btn-sm">Edit</a>
                            <a href="delete.jsp?id=<%= rs.getInt("id") %>" class="btn btn-danger btn-sm" onclick="return confirm('Apakah Anda yakin ingin menghapus barang ini?');">Delete</a>
                        </td>
                    </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
