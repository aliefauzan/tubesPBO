<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<%
    String nama = request.getParameter("nama_barang");
    int stok = Integer.parseInt(request.getParameter("stok"));
    String tanggalMasuk = request.getParameter("tanggal_masuk");

    // Cek apakah barang sudah ada di database
    Connection conn = JDBC.getConnection();
    PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM barang WHERE nama_barang = ?");
    checkStmt.setString(1, nama);
    ResultSet checkRs = checkStmt.executeQuery();

    if (checkRs.next()) {
        // Barang sudah ada, update stok
        int updatedStok = checkRs.getInt("stok") + stok;
        PreparedStatement updateStmt = conn.prepareStatement("UPDATE barang SET stok = ?, tanggal_masuk = ? WHERE nama_barang = ?");
        updateStmt.setInt(1, updatedStok);
        updateStmt.setString(2, tanggalMasuk);
        updateStmt.setString(3, nama);
        updateStmt.executeUpdate();
    } else {
        // Barang belum ada, tambah data baru
        PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO barang (nama_barang, stok, tanggal_masuk) VALUES (?, ?, ?)");
        insertStmt.setString(1, nama);
        insertStmt.setInt(2, stok);
        insertStmt.setString(3, tanggalMasuk);
        insertStmt.executeUpdate();
    }

    // Masukkan data ke history
    String username = (String) session.getAttribute("username");
    PreparedStatement historyStmt = conn.prepareStatement("INSERT INTO history (nama_barang, stok, tanggal, username, action) VALUES (?, ?, ?, ?, ?)");
    historyStmt.setString(1, nama);
    historyStmt.setInt(2, stok);
    historyStmt.setString(3, tanggalMasuk);
    historyStmt.setString(4, username);
    historyStmt.setString(5, "Masuk");
    historyStmt.executeUpdate();

    response.sendRedirect("view.jsp");
%>
