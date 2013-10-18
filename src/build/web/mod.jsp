<%-- 
    Document   : mod
    Created on : 17-dic-2011, 13.29.15
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="isadmin.jsp" %>
<%@ include file="dbc.jsp" %>
<%@ include file="header.jsp" %>
<%  String disp = request.getParameter("disp");
    String prezzo = request.getParameter("prezzo");
    if (disp != null && prezzo != null) {
        String sql = "UPDATE prodotti SET disponibilita = '" + disp + "', prezzo = '" + prezzo + "' WHERE id ='" + session.getAttribute("idp") + "'";
        stmt.executeUpdate(sql);
%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Prodotto modificato correttamente! <a href="admin.jsp">Torna Indietro</a></center>
    </div>
</div>
<%} else {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> Parametri non sufficienti! <a href="admin.jsp">Torna Indietro</a></center>
    </div>
</div>        
<%}%>
<%@ include file="footer.jsp" %>
