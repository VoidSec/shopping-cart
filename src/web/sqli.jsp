<%-- 
    Document   : sqli
    Created on : 25-mag-2012, 12.05.27
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="dbc.jsp" %>
<div class="box">
    <h2>Ricerca</h2>
    <div class="box-content">
        <form action="sqli.jsp" method="get" name="search" id="searchForm" >
            <div id="search">
                <br>
                <center>
                    Ricerca per: 
                    <select id="tipo" name="tipo">
                        <option value="nome">Nome</option>
                    </select>
                    <input name="text" type="text" id="text" size="13"> <input name="search" type="image" src="img/search.png" alt="Cerca"></center>                      
                <br>
            </div>
        </form>
    </div>
</div>
<br>
<%  String tipo = request.getParameter("tipo");
    String text = request.getParameter("text");
    if (tipo == null && text == null) {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> Non hai inserito termini sufficienti alla ricerca.</center>
    </div>
</div>
<%} else {
    int type = 1;
    String[] sql = new String[5];
    if (tipo.equals("nome")) {
        type = 1;
        sql[1] = "select * from tabella where campo='" + text + "'";
    }

    ResultSet rs = stmt.executeQuery(sql[type]);

    boolean b = rs.next();

    rs.previous();
    //system.
    if (type != 0 && b != false) {
%>
<div class="box">
    <h2>Prodotti</h2>
    <div class="box-content" id="tab">
        <table border="0" width="100%" cellpadding="1" cellspacing="2">
            <% String id,asd;
                while (rs.next()) {
                    id = rs.getString(1);
            %>
            <tr>
            <tr>
                <td><font color="blue"><strong>ID</strong></font></td>
            </tr>
            <td><%=id%></td>
            <tr/>
            <%}%>
        </table>
    </div>
</div>
<%} else {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> Nessun risultato corrisponde ai tuoi termini di ricerca.</center>
    </div>
</div>
<%}
    }%>
<%@ include file="footer.jsp" %>
