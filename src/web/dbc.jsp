<%-- 
    Document   : db
    Created on : 25-nov-2011, 9.47.37
    Author     : Fallen Angel

DECOMMENTA LA LINEA ERROR PAGE!!!!!
--%>

<%@ page import="java.sql.*" %>
<%-- <%@ page errorPage = "error.jsp" %>--%>
<%   Connection conn = null;
    try {
        String userName = "admin";
        String password = "password";

        String url = "jdbc:mysql://localhost:3306/shopping_cart";
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(url, userName, password);
        //commenatare la linea sotto a fine progetto
        //out.println("Database connection established<br>");

    } catch (Exception e) {
        out.println("Cannot connect to database server<br>");
    }
    Statement stmt = null;
    stmt = conn.createStatement();
%>