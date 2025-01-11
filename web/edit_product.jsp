<%-- 
    Document   : edit_product
    Created on : 3 Jan 2025, 23.44.16
    Author     : raiha
--%>

<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String nama = request.getParameter("nama_barang");
    int stok = Integer.parseInt(request.getParameter("stok"));

    Connection conn = JDBC.getConnection();
    PreparedStatement stmt = conn.prepareStatement("UPDATE barang SET nama_barang = ?, stok = ? WHERE id = ?");
    stmt.setString(1, nama);
    stmt.setInt(2, stok);
    stmt.setInt(3, id);
    stmt.executeUpdate();

    response.sendRedirect("view.jsp");
%>
