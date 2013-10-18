<%-- 
    Document   : buy
    Created on : 7-dic-2011, 14.50.14
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="dbc.jsp" %>
<%@ include file="header.jsp" %>
<%String redirectURL = "redir.jsp?tipo=user";
    if (session.getAttribute("isLoggedIn") == null) {
        response.sendRedirect(redirectURL);
    } else {
        String cod_rep = request.getParameter("cod_rep");
        String cod_prod = request.getParameter("cod_prod");
        if (cod_rep != null && cod_prod != null) {

            String sql = "select * from prodotti where cod_prod='" + cod_prod + "' && cod_rep='" + cod_rep + "'";
            ResultSet rs = stmt.executeQuery(sql);
            rs.next();
            if (rs.getString(5) != null && !rs.getString(5).equals("0")) {
                int disp = rs.getInt(5);
                String prezzo = rs.getString(7);
                disp--;

                sql = "update prodotti set disponibilita='" + disp + "' where cod_prod='" + cod_prod + "' && cod_rep='" + cod_rep + "'";
                stmt.executeUpdate(sql);

                sql = "INSERT INTO `ordini`(`cliente`, `prodotto`, `costo`, `pagato`, `data`) VALUES ('" + session.getAttribute("username") + "','" + cod_prod + "','" + prezzo + "','0','2011/12/20')";
                stmt.executeUpdate(sql);

                sql = "select count(*) from ordini where cliente='" + session.getAttribute("username") + "'";
                rs = stmt.executeQuery(sql);
                rs.next();

                if (rs.getString(1) != "0") {
                    int n_ord = Integer.parseInt(rs.getString(1));
                    session.setAttribute("nord", n_ord);

                    //numero ordini pagati
                    sql = "select count(*) from ordini where cliente='" + session.getAttribute("username") + "' and pagato='1'";
                    rs = stmt.executeQuery(sql);
                    rs.next();
                    int n_ordp = Integer.parseInt(rs.getString(1));
                    session.setAttribute("ord_p", n_ordp);

                    //numero ordini non pagati
                    int n_ord_np = n_ord - n_ordp;
                    session.setAttribute("ord_np", n_ord_np);

                    //costo totale ordini da pagare
                    sql = "select sum(costo) from ordini where cliente='" + session.getAttribute("username") + "' and pagato='0'";
                    rs = stmt.executeQuery(sql);
                    rs.next();
                    double tot = Double.parseDouble(rs.getString("sum(costo)"));
                    session.setAttribute("tot", tot);
                }

                redirectURL = "buy.jsp";
                response.sendRedirect(redirectURL);
            } else {%>
<div class="box">
    <h2>Errore</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Errore:</font></strong> Impossibile completare l'ordine, disponibilità insufficiente! <a href="buy.jsp">Torna Indietro</a></center>
    </div>
</div>    
<%}
    }
%>
<div class="box">
    <h2>Compra</h2>
    <div class="box-content" id="tab">
        <table border="0" width="100%" cellpadding="1" cellspacing="2">
            <tr>
                <td><font color="blue"><strong>Prodotto</strong></font></td>
                <td><font color="blue"><strong>Costo</strong></font></td>
                <td><font color="blue"><strong>Data</strong></font></td>
                <td><font color="blue"><strong>Pagato/Non Pagato</strong></font></td>
                <td><font color="blue"><strong>Compra</strong></font></td>
            </tr>
            <%String sql = "select * from ordini where cliente='" + session.getAttribute("username") + "' and pagato=0";
                ResultSet rs = stmt.executeQuery(sql);
                String prodotto = "", data = "", p_n = "", prezzo = "";
                if (rs != null) {
                    while (rs.next()) {
                        prodotto = rs.getString(3);
                        prezzo = rs.getString(4);
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
                <td><%=prezzo%></td>
                <td><%=data%></td>
                <td><%=p_n%></td>
                <td><form action="pay.jsp?prod_cod=<%=prodotto%>" method="post"><input type="submit" value="Compra"></form></td>
            <tr/>
            <%}
                }%>
        </table>
    </div>
</div>
<br>
<%}%>
<%@ include file="footer.jsp" %>