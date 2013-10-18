<%-- 
    Document   : logon
    Created on : 28-nov-2011, 19.14.06
    Author     : Fallen Angel
--%>

<%@include file="dbc.jsp" %>
<%@page session="true" %>
<%@page import="java.security.MessageDigest" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <%  String uname = request.getParameter("username");
            String pass = request.getParameter("pwd");
            String md5pass = "";
            //cripta la password inserita in md5 per il successivo confronto
            MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
            mdAlgorithm.update(pass.getBytes());

            byte[] digest = mdAlgorithm.digest();
            StringBuffer hexString = new StringBuffer();

            for (int i = 0; i < digest.length; i++) {
                pass = Integer.toHexString(0xFF & digest[i]);

                if (pass.length() < 2) {
                    pass = "0" + pass;
                }

                hexString.append(pass);
            }
            md5pass = hexString.toString();

            //recupero dati dal db per il confronto
            String sql = "select * from user where username='" + uname + "' and password='" + md5pass + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next() == true) {
                //dati utente
                session.setAttribute("isLoggedIn", "true");
                session.setAttribute("id", rs.getString(1));
                session.setAttribute("username", rs.getString(2));
                session.setAttribute("password", rs.getString(3));
                session.setAttribute("nome", rs.getString(4));
                session.setAttribute("cognome", rs.getString(5));
                session.setAttribute("cod", rs.getString(6));
                session.setAttribute("mail", rs.getString(7));
                session.setAttribute("rank", rs.getString(8));

                if (session.getAttribute("rank").equals("1")) {
                    //numero ordini totali
                    sql = "select * from ordini where cliente='" + uname + "'";
                    rs = stmt.executeQuery(sql);
                    
                    if (rs.next()) {
                        sql = "select count(*) from ordini where cliente='" + uname + "'";
                        rs = stmt.executeQuery(sql);
                        rs.next();
                        int n_ord = Integer.parseInt(rs.getString(1));
                        session.setAttribute("nord", n_ord);

                        //numero ordini pagati
                        sql = "select count(*) from ordini where cliente='" + uname + "' and pagato='1'";
                        rs = stmt.executeQuery(sql);
                        rs.next();
                        int n_ordp = Integer.parseInt(rs.getString(1));
                        session.setAttribute("ord_p", n_ordp);

                        //numero ordini non pagati
                        int n_ord_np = n_ord - n_ordp;
                        session.setAttribute("ord_np", n_ord_np);

                        //costo totale ordini da pagare
                        sql = "select sum(costo) from ordini where cliente='" + uname + "' and pagato='0'";
                        rs = stmt.executeQuery(sql);
                        rs.next();
                        double tot = Double.parseDouble(rs.getString("sum(costo)"));
                        session.setAttribute("tot", tot);
                    }
                }
                String redirectURL = "index.jsp";
                response.sendRedirect(redirectURL);
        %>    
    <center><h2><b><font color="lightgreen">Login effettuato con successo!</font></b></h2></center>
    <A HREF="index.jsp">Prosegui</A> o attendi il reindirizzamento...

    <%
    } else {
        //dopo 3 login falliti scrive i log
        int try_login;
        if (session.getAttribute("try_login") == null || session.getAttribute("try_login").toString().equals("0")) {
            session.setAttribute("try_login", "1");
            try_login = 1;
        } else {
            try_login = Integer.parseInt(session.getAttribute("try_login").toString());
        }
        if (try_login >= 3) {
            String tipo = "Login multipli falliti per username " + uname + "";
            sql = "INSERT INTO `logs`(`ip`, `host`, `tipo`) VALUES ('" + request.getRemoteAddr() + "','" + request.getRemoteHost() + "','" + tipo + "')";
            stmt.executeUpdate(sql);
            try_login = 0;
            session.setAttribute("try_login", "0");
    %>
    <center><h2><b><font color="red">Accesso Negato!</font></b></h2></center><br>
    I tentativi di login multilpli per l'username: <%=uname%> sono stati memorizzati dal sistema!<br> IP: <%=request.getRemoteAddr()%> Host: <%=request.getRemoteHost()%><br><br>
    <A HREF="login.jsp">Effettua il login</A>
    <%
        } else {
            try_login += 1;
            session.setAttribute("try_login", try_login + "");
        }
    %>
    <center><h2><b><font color="red">Login non corretto!</font></b></h2></center>
    <A HREF="login.jsp">Torna indietro</A>
    <%        }
    %>
</body>
</html>
