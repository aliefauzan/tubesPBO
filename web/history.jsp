<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
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
            background-color: #4CAF50;
        }
        .container {
            margin-top: 20px;
        }
        .table th, .table td {
            text-align: center;
        }
    </style>
</head>
<body>
    <!-- Fixed menu on the left -->
    <div class="fixed-menu">
        <div class="logo-container text-center mb-4">
            <img src="https://i.ibb.co.com/9TCjSps/singgung.jpg" alt="Logo" class="img-fluid" style="max-width: 80%; border-radius: 5px;">
        </div>
        <a href="view.jsp">Lihat Barang</a>
        <a href="add.jsp">Tambah Barang</a>
        <a href="ambil.jsp">Ambil Barang</a>
        <a href="history.jsp">Riwayat Transaksi</a>
        <a href="logout.jsp">Logout</a>
    </div>

    <!-- Main content -->
    <div class="content">
        <div class="container mt-4">
            <h2>Riwayat Masuk dan Keluar Barang</h2>
            <table class="table table-bordered mt-3">
                <thead>
                    <tr>
                        <th>Nama Barang</th>
                        <th>Stok</th>
                        <th>Tanggal</th>
                        <th>User</th>
                        <th>Status Barang</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Menyiapkan koneksi ke database
                        Connection conn = JDBC.getConnection();
                        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM history ORDER BY tanggal DESC");
                        ResultSet rs = stmt.executeQuery();
                        
                        // Menampilkan data riwayat transaksi
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("nama_barang") %></td>
                        <td><%= rs.getInt("stok") %></td>
                        <td><%= rs.getString("tanggal") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("action") %></td>
                    </tr>
                    <% 
                        }
                        // Menutup koneksi dan statement
                        rs.close();
                        stmt.close();
                        conn.close();
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
