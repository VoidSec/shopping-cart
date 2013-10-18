<%-- 
    Document   : admin
    Created on : 7-dic-2011, 14.51.47
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="isadmin.jsp" %>
<%@ include file="dbc.jsp" %>
<%@ include file="header.jsp" %>
<%  String action = request.getParameter("action");
    if (action != null && action.equals("truncate_log")) {
        String sql = "truncate table logs";
        stmt.executeUpdate(sql);%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Log eliminati con successo!</center>
    </div>
</div>
<%}
    action = request.getParameter("action");
    String cod_prod = request.getParameter("prod");
    if (action != null && action.equals("mod") && cod_prod != null) {

%>
<div class="box">
    <h2>Modifica Prodotto</h2>
    <div class="box-content">
        <form action="mod.jsp" method="post">
            <table border="0" width="100%" cellspacing="4">
                <tr>
                    <td>Nome:</td>
                    <td><%=session.getAttribute("nome")%></td>
                </tr>
                <tr>
                    <td>Reparto:</td>
                    <td>
                        <%=session.getAttribute("rep_cod")%>
                    </td>
                </tr>
                <tr>
                    <td>Codice Prodotto:</td>
                    <td>
                        <%=session.getAttribute("prod_cod")%>
                    </td>
                </tr>
                <tr>
                    <td>Disponibilità:</td>
                    <td><input type="text" id="disp" name="disp" value="<%=session.getAttribute("disp")%>"></td>
                </tr>
                <tr>
                    <td>Nome Immagine:</td>
                    <td><%=session.getAttribute("img")%></td>
                </tr>
                <tr>
                    <td>Prezzo:</td>
                    <td><input type="text" id="prezzo" name="prezzo" value="<%=session.getAttribute("prezzo")%>"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Modifica Prodotto">
        </form>
        </p>
    </div>
</div>
<%}
    String nome = request.getParameter("nome");
    String rep_cod = request.getParameter("rep_cod");
    String prod_cod = request.getParameter("prod_cod");
    String disp = request.getParameter("disp");
    String img = request.getParameter("img");
    String prezzo = request.getParameter("prezzo");

    if (nome != null && rep_cod != null && prod_cod != null && disp != null && img != null && prezzo != null) {
        String sql = "select * from prodotti where cod_prod='" + prod_cod + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (!rs.next()) {
            sql = "INSERT INTO `prodotti`(`nome`, `cod_rep`, `cod_prod`, `disponibilita`, `img`, `prezzo`) VALUES ('" + nome + "','" + rep_cod + "','" + prod_cod + "','" + disp + "','" + img + "','" + prezzo + "')";
            stmt.executeUpdate(sql);
%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> Prodotto inserito correttamente!</center>
    </div>
</div>
<%} else {
    session.setAttribute("idp", rs.getString(1));
    session.setAttribute("nome", rs.getString(2));
    session.setAttribute("rep_cod", rs.getString(3));
    session.setAttribute("prod_cod", rs.getString(4));
    session.setAttribute("disp", rs.getString(5));
    session.setAttribute("img", rs.getString(6));
    session.setAttribute("prezzo", rs.getString(7));
%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> E' già presente un prodotto con lo stesso codice! <a href="admin.jsp?action=mod&prod=<%=prod_cod%>">Modificarlo?</a></center>
    </div>
</div>    
<%}
    }
%>
<div class="box">
    <h2>Amministrazione</h2>
    <div class="box-content">
        <p>
            <a href="admin.jsp?action=truncate_log">Elimina Log</a>
        </p>
        <p>
            <a href="add_news.jsp">Aggiungi News</a>
        </p>
        <p><br><hr><br>
        <font color="blue"><b>Aggiungi prodotto:</b></font><br>
        <form action="admin.jsp" method="post">
            <table border="0" width="100%" cellspacing="4">
                <tr>
                    <td>Nome:</td>
                    <td><input type="text" id="nome" name="nome"></td>
                </tr>
                <tr>
                    <td>Reparto:</td>
                    <td>
                        <select id="rep_cod" name="rep_cod">
                            <option value="0001">Abiti Uomini</option>
                            <option value="0002">Abiti Donna</option>
                            <option value="0003">Accessori Uomo</option>
                            <option value="0004">Accessori Donna</option>
                            <option value="0005">Scarpe Uomo</option>
                            <option value="0006">Scarpe Donna</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Codice Prodotto:</td>
                    <td><input type="text" id="prod_cod" maxlength="4" name="prod_cod"></td>
                    <td>Composto da quattro cifre ex. 1234</td>
                </tr>
                <tr>
                    <td>Disponibilità:</td>
                    <td><input type="text" id="disp" name="disp"></td>
                    <td>0-n</td>
                </tr>
                <tr>
                    <td>Nome Immagine:</td>
                    <td><input type="text" id="img" name="img" value="<%=session.getAttribute("namefile")%>"></td>
                    <td>L'upload deve essere effettuato separatamente <a href="upload.jsp">Qui</a></td>
                </tr>
                <tr>
                    <td>Prezzo:</td>
                    <td><input type="text" id="prezzo" name="prezzo"></td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Aggiungi Prodotto">
        </form>
        </p>
    </div>
</div>
<%@ include file="footer.jsp" %>