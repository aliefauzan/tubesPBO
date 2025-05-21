<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ambil Barang</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: "Poppins", sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            display: flex;
            height: 45vh;
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

        /* Center Content */
        .main-content {
            margin-left: 220px;
            width: 100%;
            display: flex;
            justify-content: center;
        }

        .attach-card {
            max-width: 500px;
            width: 100%;
            margin: 20px;
        }
        .card-header {
            background-color: #343a40;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 20px;
        }
        .btn-attach {
            background-color: #343a40;
            border: none;
        }
        .btn-attach:hover {
            background-color: #1976D2;
        }
    </style>
</head>
<body>

    <!-- Sidebar Fixed -->
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

    <!-- Main Content -->
    <div class="main-content">
        <div class="card shadow attach-card">
            <div class="card-header">
                <h2>Ambil Barang</h2>
            </div>
            <div class="card-body">
                <form action="ambil_product.jsp" method="POST">
                    <div class="form-floating mb-3">
                        <select class="form-select" name="nama_barang" required>
                            <option value="">Pilih Barang</option>
                            <%
                                // Mengambil data nama barang dari database
                                Connection conn = JDBC.getConnection();
                                PreparedStatement stmt = conn.prepareStatement("SELECT nama_barang FROM barang");
                                ResultSet rs = stmt.executeQuery();
                                while (rs.next()) {
                                    String nama_barang = rs.getString("nama_barang");
                            %>
                            <option value="<%= nama_barang %>"><%= nama_barang %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-floating mb-3">
                        <input type="number" class="form-control" name="stok" placeholder="Jumlah Barang" required>
                        <label>Jumlah Barang</label>
                    </div>
                        <div class="form-floating mb-3">
                        <input type="date" class="form-control" name="tanggal_keluar" required>
                        <label for="tanggal_keluar">Tanggal Keluar Barang</label>
                    </div>
                    <button type="submit" class="btn btn-attach w-100 text-white">Ambil Barang</button>
                </form>
            </div>
        </div>
    </div>

</body>
</html>