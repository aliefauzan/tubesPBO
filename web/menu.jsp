<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
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
            padding: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .stat-card {
            border-radius: 15px;
            color: white;
            text-align: center;
            font-weight: bold;
            padding: 20px;
        }
        .stat-card-1 {
            background: linear-gradient(135deg, #ff7f50, #ff4500);
        }
        .stat-card-2 {
            background: linear-gradient(135deg, #7bed9f, #2ecc71);
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

    <!-- Main Content -->
    <div class="content">
        <h1 class="mb-4">Dashboard</h1>
        <div class="row g-3">
            <div class="col-md-6">
                <div class="card stat-card stat-card-1">
                    <h3>
                        <%
                            Connection conn = null;
                            Statement stmt = null;
                            ResultSet rs = null;
                            int barangMasukKeluarBulanIni = 0;
                            try {
                                conn = JDBC.getConnection();
                                String query = "SELECT COUNT(DISTINCT nama_barang) AS total_jenis_barang FROM history WHERE MONTH(tanggal) = MONTH(CURRENT_DATE) AND YEAR(tanggal) = YEAR(CURRENT_DATE)";
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery(query);
                                if (rs.next()) {
                                    barangMasukKeluarBulanIni = rs.getInt("total_jenis_barang");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            }
                        %>
                        Barang Keluar/Masuk: <%= barangMasukKeluarBulanIni %> Jenis Barang
                    </h3>
                    <p>Bulan ini</p>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card stat-card stat-card-2">
                    <h3>
                        <%
                            int totalStok = 0;
                            try {
                                conn = JDBC.getConnection();
                                String query = "SELECT SUM(stok) AS total_stok FROM barang"; // Assuming 'barang' is the table storing stock data
                                stmt = conn.createStatement();
                                rs = stmt.executeQuery(query);
                                if (rs.next()) {
                                    totalStok = rs.getInt("total_stok");
                                }
                            } catch (SQLException e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            }
                        %>
                        Jumlah Barang: <%= totalStok %>
                    </h3>
                    <p>Total Barang</p>
                </div>
            </div>
        </div>
        <div class="table-wrapper">
            <h3 class="text-center mt-4">Last 10 Records</h3>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Username</th>
                        <th>Nama Barang</th>
                        <th>Stok</th>
                        <th>Tanggal</th>
                        <th>Status Barang</th>
                        <th>Created At</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            conn = JDBC.getConnection();
                            String query = "SELECT * FROM history ORDER BY id DESC LIMIT 10";
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery(query);

                            while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("nama_barang") %></td>
                        <td><%= rs.getInt("stok") %></td>
                        <td><%= rs.getDate("tanggal") %></td>
                        <td><%= rs.getString("action") %></td>
                        <td><%= rs.getTimestamp("created_at") %></td>
                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
