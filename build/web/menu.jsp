<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu Utama</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f7f7f7;
        }
        /* Fixed menu styles */
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
        .content {
            margin-left: 240px; /* Memberikan jarak agar konten tidak tertutup menu */
            padding: 20px;
        }
        .card-header {
            background-color: #4CAF50;
            color: white;
            font-weight: bold;
            text-align: center;
            padding: 20px;
        }
        .card-body a {
            text-decoration: none;
            color: inherit;
        }
        .menu-item {
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 10px;
            background-color: #ffffff;
            transition: all 0.3s ease;
        }
        .menu-item:hover {
            background-color: #4CAF50;
            color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>
    <!-- Fixed Menu on the left -->
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
        <div class="card shadow menu-card">
            <div class="card-header">
                <h2>Selamat Datang, <%= session.getAttribute("username") %>!</h2>
            </div>
            <div class="card-body">
                <div class="menu-item">
                    <a href="view.jsp" class="d-flex justify-content-between align-items-center">
                        <span>Lihat Barang</span>
                        <span class="badge bg-primary">Lihat</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="add.jsp" class="d-flex justify-content-between align-items-center">
                        <span>Tambah Barang</span>
                        <span class="badge bg-success">Tambah</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="ambil.jsp" class="d-flex justify-content-between align-items-center">
                        <span>Ambil Barang</span>
                        <span class="badge bg-warning">Ambil</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="history.jsp" class="d-flex justify-content-between align-items-center">
                        <span>Riwayat Transaksi</span>
                        <span class="badge bg-info">History</span>
                    </a>
                </div>
                <div class="menu-item">
                    <a href="logout.jsp" class="d-flex justify-content-between align-items-center">
                        <span>Logout</span>
                        <span class="badge bg-danger">Keluar</span>
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
