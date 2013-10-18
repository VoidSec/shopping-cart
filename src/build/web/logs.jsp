<%-- 
    Document   : logs
    Created on : 7-dic-2011, 14.51.31
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file = "isadmin.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="dbc.jsp" %>
<div class="box">
    <h2>Informazione</h2>
    <div class="box-content">
        <strong><center><img src="img/info.png"> <font color="white">Informzione:</font></strong> I nuovi attacchi sono visualizzati nella parte superiore.</center>
    </div>
</div>
<%  String[] ip = new String[10];
    String[] host = new String[10];
    String[] text = new String[10];

    String sql = "select count(*) from logs";
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();

    //legge il numero di logs memorizzato nel db
    int count = Integer.parseInt(rs.getString(1));
    int tot = count;

    if (tot == 0) {%>
<div class="box">
    <h2>Nessun log disponibile</h2>
    <div class="box-content">
        <p>I log sono attualmente vuoti!</p>
    </div>
</div>
<%} else {%>
<div class="box">
    <h2>Attacchi Recenti</h2>
    <div class="box-content" id="tab">
        <table border="0" width="100%" cellpadding="1" cellspacing="2">
            <tr>
                <td><font color="blue"><strong>Host/IP</strong></font></td>
                <td><font color="blue"><strong>Attacco</strong></font></td>
            </tr>
            <%
                //stampa max 10 logs in ordine inverso
                for (int i = 0; i < tot; i++) {
                    if (i > 9) {
                        i = tot;
                    } else {
                        sql = "select * from logs where id=" + count;
                        rs = stmt.executeQuery(sql);
                        rs.next();
                        ip[i] = rs.getString(2);
                        host[i] = rs.getString(3);
                        text[i] = rs.getString(4);
                        count--;
            %>
            <tr><td><%=host[i]%> / <%=ip[i]%></td>
                <td><%=text[i]%></td>
            <tr/>
            <%
                    }
                }
            %>
        </table>
    </div>
</div>
<%}%>
<%@ include file="footer.jsp" %>