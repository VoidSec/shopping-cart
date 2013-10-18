<%-- 
    Document   : news
    Created on : 7-dic-2011, 14.50.41
    Author     : Fallen Angel
--%>

<%@ include file="header.jsp" %>
<%@ include file="dbc.jsp" %>
<%  String[] news = new String[5];
    String[] data = new String[5];

    String sql = "select count(*) from news";
    ResultSet rs = stmt.executeQuery(sql);
    rs.next();
    //legge il numero di news memorizzato nel db
    int count = Integer.parseInt(rs.getString(1));
    int tot = count;

    //legge max 5 news in ordine inverso
    for (int i = 0; i < tot; i++) {
        if (i > 4) {
            i = tot;
        } else {
            sql = "select * from news where id=" + count;
            rs = stmt.executeQuery(sql);
            rs.next();
            data[i] = rs.getString(2);
            news[i] = rs.getString(3);
            count--;
        }
%>
<div class="box">
    <h2>News, <%=data[i]%></h2>
    <div class="box-content">
        <p><%=news[i]%></p>
    </div>
</div>
<br>
<%}%>
<%@ include file="footer.jsp" %>