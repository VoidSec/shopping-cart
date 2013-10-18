<%-- 
    Document   : search
    Created on : 7-dic-2011, 14.50.59
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="header.jsp" %>
<%@ include file="dbc.jsp" %>
<div class="box">
    <h2>Ricerca</h2>
    <div class="box-content">
        <form action="search.jsp" method="post" name="search" id="searchForm" >
            <div id="search">
                <br>
                <center>
                    Ricerca per: 
                    <select id="tipo" name="tipo">
                        <option value="nome">Nome</option>
                        <option value="costo">Costo</option>
                        <option value="prod_cod">Codice Prodotto</option>
                        <option value="rep_cod">Codice Reparto</option>
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
    int type = 0;
    String[] sql = new String[5];
    if (tipo.equals("nome")) {
        type = 1;
        sql[1] = "select * from prodotti where nome='" + text + "'";
    }
    if (tipo.equals("costo")) {
        type = 2;
        sql[2] = "select * from prodotti where prezzo='" + text + "'";
    }
    if (tipo.equals("prod_cod")) {
        type = 3;
        sql[3] = "select * from prodotti where cod_prod='" + text + "'";
    }
    if (tipo.equals("rep_cod")) {
        type = 4;
        sql[4] = "select * from prodotti where cod_rep='" + text + "'";
    }
    
    ResultSet rs = stmt.executeQuery(sql[type]);

    boolean b = rs.next();
    rs.previous();
    if (type != 0 && b != false) {
%>
<div class="box">
    <h2>Prodotti</h2>
    <div class="box-content" id="tab">
        <table border="0" width="100%" cellpadding="1" cellspacing="2">
            <% String id, nome, cod_rep, cod_prod, disp, img, prezzo, button;
                while (rs.next()) {
                    id = rs.getString(1);
                    nome = rs.getString(2);
                    cod_rep = rs.getString(3);
                    cod_prod = rs.getString(4);
                    disp = rs.getString(5);
                    img = rs.getString(6);
                    prezzo = rs.getString(7);
                    button = cod_rep + "&cod_prod=" + cod_prod;
            %>
            <tr>
            <tr>
                <td><font color="blue"><strong>ID</strong></font></td>
                <td><font color="blue"><strong>Immagine</strong></font></td>
                <td><font color="blue"><strong>Nome</strong></font></td>
                <td><font color="blue"><strong>Codice Reparto</strong></font></td>
                <td><font color="blue"><strong>Codice Prodotto</strong></font></td>
                <td><font color="blue"><strong>Disponibiltà</strong></font></td>
                <td><font color="blue"><strong>Prezzo</strong></font></td>
                <td><font color="blue"><strong>Compra</strong></font></td>
            </tr>
            <td><%=id%></td>
            <td><img src="img/prod/<%=img%>" width="75" height="75" id="prod"></td>
            <td><%=nome%></td>
            <td><%=cod_rep%></td>
            <td><%=cod_prod%></td>
            <td><%=disp%></td>
            <td><%=prezzo%> €</td>
            <td><form action="buy.jsp?cod_rep=<%=button%>" method="post" id="buy" ><input type="submit" value="Compra"></form></td>
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
