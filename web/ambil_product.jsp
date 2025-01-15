<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<%
    String nama_barang = request.getParameter("nama_barang");
    int stok_ambil = Integer.parseInt(request.getParameter("stok"));
    String username = (String) session.getAttribute("username");
    String tanggalKeluar = request.getParameter("tanggal_keluar");
    Connection conn = JDBC.getConnection();
    
    // Cek ketersediaan barang
    PreparedStatement checkStmt = conn.prepareStatement("SELECT stok FROM barang WHERE nama_barang = ?");
    checkStmt.setString(1, nama_barang);
    ResultSet rs = checkStmt.executeQuery();

    if (rs.next()) {
        int stok = rs.getInt("stok");
        
        // Pastikan stok cukup
        if (stok >= stok_ambil) {
            // Kurangi stok barang di tabel barang
            PreparedStatement updateStmt = conn.prepareStatement("UPDATE barang SET stok = stok - ? WHERE nama_barang = ?");
            updateStmt.setInt(1, stok_ambil);
            updateStmt.setString(2, nama_barang);
            updateStmt.executeUpdate();
            
            // Catat transaksi ke tabel history
            PreparedStatement historyStmt = conn.prepareStatement("INSERT INTO history (nama_barang, stok, tanggal, username, action) VALUES (?, ?, ?, ?, ?)");
            historyStmt.setString(1, nama_barang);
            historyStmt.setInt(2, stok_ambil);
            historyStmt.setString(3, tanggalKeluar);
            historyStmt.setString(4, username);
            historyStmt.setString(5, "Keluar");
            historyStmt.executeUpdate();

            // Hapus barang jika stok menjadi 0
            PreparedStatement checkZeroStmt = conn.prepareStatement("SELECT stok FROM barang WHERE nama_barang = ?");
            checkZeroStmt.setString(1, nama_barang);
            ResultSet zeroRs = checkZeroStmt.executeQuery();
            if (zeroRs.next() && zeroRs.getInt("stok") == 0) {
                PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM barang WHERE nama_barang = ?");
                deleteStmt.setString(1, nama_barang);
                deleteStmt.executeUpdate();
            }

            out.println("<script>alert('Barang berhasil diambil!'); window.location = 'view.jsp';</script>");
        } else {
            out.println("<script>alert('Stok tidak cukup!'); window.location = 'ambil.jsp';</script>");
        }
    }
%>
