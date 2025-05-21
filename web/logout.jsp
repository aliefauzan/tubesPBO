<%-- 
    Document   : logout
    Created on : 4 Jan 2025, 00.20.10
    Author     : raiha
--%>

<%@ page session="true" %>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
