<%-- 
    Document   : add_news
    Created on : 24-mag-2012, 14.46.10
    Author     : Fallen Angel
--%>

<%@ include file="isadmin.jsp" %>
<%@ include file="dbc.jsp" %>
<%@ include file="header.jsp" %>
<%  String data = request.getParameter("data");
    String testo = request.getParameter("testo");
    if (data != null && testo != null) {
        String sql = "INSERT INTO `news`(`data`, `testo`) VALUES ('" + data + "','" + testo + "')";
        stmt.executeUpdate(sql);%>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informazione:</font></strong> News inserita con successo!</center>
    </div>
</div>
<%}%>
<div class="box">
    <h2>Amministrazione News</h2>
    <div class="box-content">
        <font color="blue"><b>Aggiungi News:</b></font><br>
        <form action="add_news.jsp" method="get">
            <table border="0" width="100%" cellspacing="4">
                <tr>
                    <td>Data: (ex. aaaa-mm-gg)</td>
                    <td><input type="text" id="data" name="data" maxlength="10" size="10"></td>
                </tr>
                <tr>
                    <td>Testo:</td>
                    <td>
                        <textarea type="text" id="testo" name="testo" row="10" cols="40"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="Aggiungi News">
        </form>
        </p>
    </div>
</div>
<%@ include file="footer.jsp" %>