<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
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
        .container {
            margin-top: 20px;
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
    <!-- Fixed menu on the left -->
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

    <!-- Main content -->
    <div class="content">
        <div class="container">
            <h2 class="text-center">Riwayat Masuk dan Keluar Barang</h2>
            <table class="table table-bordered mt-3">
                <thead class="table-dark">
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
                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;
                        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
                        
                        try {
                            conn = JDBC.getConnection();
                            String query = "SELECT * FROM history ORDER BY tanggal DESC";
                            stmt = conn.prepareStatement(query);
                            rs = stmt.executeQuery();
                            
                            while (rs.next()) {
                                // Format tanggal
                                String formattedDate = sdf.format(rs.getTimestamp("tanggal"));
                    %>
                    <tr>
                        <td><%= rs.getString("nama_barang") %></td>
                        <td><%= rs.getInt("stok") %></td>
                        <td><%= formattedDate %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("action") %></td>
                    </tr>
                    <% 
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
