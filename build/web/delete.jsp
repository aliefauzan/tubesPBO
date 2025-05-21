<%-- 
    Document   : delete
    Created on : 4 Jan 2025, 00.17.48
    Author     : raiha
--%>

<%@ page import="java.sql.*" %>
<%@ page import="JDBC.JDBC" %>
<%
    String idParam = request.getParameter("id");
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        Connection conn = JDBC.getConnection();
        String query = "DELETE FROM barang WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(query);
        stmt.setInt(1, id);
        int rowsDeleted = stmt.executeUpdate();
        if (rowsDeleted > 0) {
            out.println("Data berhasil dihapus.");
        } else {
            out.println("Data tidak ditemukan.");
        }
    } else {
        out.println("Parameter 'id' tidak ditemukan.");
    }
    response.sendRedirect("view.jsp");
%>

