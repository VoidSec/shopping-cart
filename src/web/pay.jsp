<%-- 
    Document   : pay
    Created on : 17-dic-2011, 13.59.31
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="checkuser.jsp" %>
<%@ include file="dbc.jsp" %>
<%@ include file="header.jsp" %>
<%String prod_cod = request.getParameter("prod_cod");
    if (prod_cod != null) {
        String sql = "select prezzo from prodotti where cod_prod='" + prod_cod + "'";
        ResultSet rs = stmt.executeQuery(sql);
        rs.next();
        String prezzo = rs.getString(1);
%>
<div class="box">
    <h2>Compra</h2>
    <div class="box-content">
        <center>
            <form action="https://www.paypal.com/cgi-bin/webscr" method="post">
                <input type="hidden" name="cmd" value="_xclick">
                <input type="hidden" name="business" value="paolo.stagno@mail.com">
                <input type="hidden" name="lc" value="IT">
                <input type="hidden" name="item_name" value="<%=prod_cod%>">
                <input type="hidden" name="amount" value="<%=prezzo%>">
                <input type="hidden" name="currency_code" value="EUR">
                <input type="hidden" name="button_subtype" value="services">
                <input type="hidden" name="no_note" value="0">
                <input type="hidden" name="shipping" value="5.00">
                <input type="hidden" name="bn" value="PP-BuyNowBF:btn_buynowCC_LG.gif:NonHostedGuest">
                <input type="image" src="https://www.paypalobjects.com/it_IT/IT/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - Il sistema di pagamento online più facile e sicuro!">
                <img alt="" border="0" src="https://www.paypalobjects.com/it_IT/i/scr/pixel.gif" width="1" height="1">
            </form>
        </center>
    </div>
</div>
<%}
%>
<%@ include file="footer.jsp" %>
