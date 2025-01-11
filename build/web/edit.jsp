<%-- 
    Document   : edit
    Created on : 3 Jan 2025, 23.35.24
    Author     : raiha
--%>

<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
    <h1>Edit Product</h1>
    <%
        // Pastikan parameter "id" tersedia
        String idParam = request.getParameter("id");
        if (idParam == null) {
            out.println("Error: Parameter 'id' tidak ditemukan.");
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
        <label>Nama Barang:</label><br>
        <input type="text" name="nama_barang" value="<%= rs.getString("nama_barang") %>" required><br>
        <label>Stok:</label><br>
        <input type="number" name="stok" value="<%= rs.getInt("stok") %>" required><br>
        <button type="submit">Update Product</button>
    </form>
    <%
                }
            }
            if (!found) {
                out.println("Error: Barang dengan ID " + id + " tidak ditemukan.");
            }
        }
    %>
</body>
</html>