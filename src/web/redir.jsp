<%-- 
    Document   : redir
    Created on : 16-dic-2011, 9.44.42
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html><head><link href="img/styles.css" rel="stylesheet" type="text/css"></head>
    <%@ include file="dbc.jsp" %>
    <%String type = request.getParameter("tipo");
        String tipo = "Tentativo di accesso all area amministrativa";
        String sql = "INSERT INTO `logs`(`ip`, `host`, `tipo`) VALUES ('" + request.getRemoteAddr() + "','" + request.getRemoteHost() + "','" + tipo + "')";

        if (tipo != null && type.equals("user")) {%>
<center><h2><b><font color="red">Devi essere registrato per poter visualizzare questa pagina!</font></b></h2></center>
<A HREF="register.jsp">Registrati</A> oppure <A HREF="login.jsp">Effettua il login</A>
<%} else {
    if (tipo != null && type.equals("admin")) {
        stmt.executeUpdate(sql);
%>
<center><h2><b><font color="red">Accesso Negato!</font></b></h2></center><br>
Il tentativo di accesso ad un area amministrativa è stato memorizzato dal sistema!<br> IP: <%=request.getRemoteAddr()%> Host: <%=request.getRemoteHost()%><br><br>
<A HREF="login.jsp">Effettua il login</A>
<%}}%>