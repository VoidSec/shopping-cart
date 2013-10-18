<%-- 
    Document   : myset
    Created on : 7-dic-2011, 14.51.15
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="checkuser.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="dbc.jsp" %>
<div class="box">
    <h2>Riepilogo Dati Utente</h2>
    <div class="box-content">
        <p><b>Username:</b> <%=session.getAttribute("username")%></p>
        <p><b>Nome:</b> <%=session.getAttribute("nome")%></p>
        <p><b>Cognome:</b> <%=session.getAttribute("cognome")%></p>
        <p><b>Codice Fiscale:</b> <%=session.getAttribute("cod")%></p>
        <p><b>Mail:</b> <%=session.getAttribute("mail")%></p>
        <br><hr><br>
        <form action="myset.jsp" method="post" name="newmail" id="newmail" >
            Indirizzo mail: <input name="mail" type="text" id="mail"> <input type="submit" value="Cambia">
        </form>
    </div>    
</div>
<div class="box">
    <h2>Ordini</h2>
    <div class="box-content">
        <p>Ordini totali: <%=session.getAttribute("nord")%></p>
        <p>Ordini pagati: <%=session.getAttribute("ord_p")%></p>
        <b><font color="red"><p>Ordini da pagare: <%=session.getAttribute("ord_np")%></p>
            <p>Totale €: <%=session.getAttribute("tot")%></p></font></b>
        <br><hr><br>
        <a href="myset.jsp?list=all"> Visualizza storico ordini</a><br>
        <a href="myset.jsp?list=pay">Visualizza solo gli ordini pagati</a><br>
        <a href="myset.jsp?list=npay">Visualizza solo gli ordini da pagare</a><br>
    </div>    
</div>
<br>
<%  String mail = request.getParameter("mail");
    if (mail != null) {
        boolean c1 = mail.contains("@");
        boolean c2 = mail.contains(".");
        if (c1 == true && c2 == true) {
            String sql = "select * from user where mail='" + mail + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() != true) {

                sql = "UPDATE user SET mail='" + mail + "' WHERE id=" + session.getAttribute("id") + ";";
                stmt.executeUpdate(sql);
                session.setAttribute("mail", mail);
%><div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Mail cambiata con successo!</center>
    </div>
</div>

<%
} else {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> La mail non è già presente nel sistema.</center>
    </div>
</div>
<%}
} else {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> La mail non è in formato corretto.</center>
    </div>
</div>
<%}
    }%>
<%  String list = request.getParameter("list");
    if (list != null) {
        int type = 0;
        String[] sql = new String[4];
        if (list.equals("all")) {
            type = 1;
            sql[1] = "select * from ordini where cliente='" + session.getAttribute("username") + "'";
        }
        if (list.equals("pay")) {
            type = 2;
            sql[2] = "select * from ordini where cliente='" + session.getAttribute("username") + "' and pagato=1";
        }
        if (list.equals("npay")) {
            type = 3;
            sql[3] = "select * from ordini where cliente='" + session.getAttribute("username") + "' and pagato=0";
        }
        if ((list.equals("all") || list.equals("pay") || list.equals("npay")) && type != 0) {
            ResultSet rs = stmt.executeQuery(sql[type]);
            String prodotto = "", costo = "", data = "", p_n = "";
%>
<div class="box">
    <h2>Ordini</h2>
    <div class="box-content" id="tab">
        <table border="0" width="100%" cellpadding="1" cellspacing="2">
            <tr>
                <td><font color="blue"><strong>Prodotto</strong></font></td>
                <td><font color="blue"><strong>Costo</strong></font></td>
                <td><font color="blue"><strong>Data</strong></font></td>
                <td><font color="blue"><strong>Pagato/Non Pagato</strong></font></td>
                <td><font color="blue"><strong>Compra</strong></font></td>
            </tr>
            <%
                while (rs.next()) {
                    prodotto = rs.getString(3);
                    costo = rs.getString(4);
                    p_n = rs.getString(5);
                    if (p_n.equals("0")) {
                        p_n = "non pagato";
                    } else {
                        p_n = "pagato";
                    }
                    data = rs.getString(6);
            %>
            <tr>
                <td><%=prodotto%></td>
                <td><%=costo%></td>
                <td><%=data%></td>
                <td><%=p_n%></td>
                <%if (p_n.equals("non pagato")) {%>
                <td><form action="buy.jsp" method="post"><input type="submit" value="Compra"></form></td>
                        <%}%>
            <tr/>
            <%}%>
        </table>
    </div>
</div>
<%} else {%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Nessuna selezione da mostrare.</center>
    </div>
</div>
<%}
} else {%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Nessuna selezione da mostrare.</center>
    </div>
</div>
<%}%>    

<%@ include file="footer.jsp" %>
