<%-- 
    Document   : insert
    Created on : 28-nov-2011, 19.15.21
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbc.jsp" %>
<%@page import="java.security.MessageDigest" %>
<%@page import="sun.net.smtp.SmtpClient, java.io.*" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/styles.css" rel="stylesheet" type="text/css">
        <title>Utente Registrato</title>
    </head>
    <body>
        <%  String uname = request.getParameter("uname");
            String pass = request.getParameter("pass");
            String repass = request.getParameter("pass2");
            String nome = request.getParameter("nome");
            String cognome = request.getParameter("cognome");
            String cod = request.getParameter("cod");
            String mail = request.getParameter("mail");
            String md5pass = "";


            if (pass.equals(repass)) {
            } else {
        %>
    <center><h2><b><font color="red">Le password non corrispondono!</font></b></h2></center>
    <A HREF="register.jsp">Indietro</A>
    <%            }
        String sql = "select * from user where username='" + uname + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if (rs.next() == true) {
    %>
    <center><h2><b><font color="red">Username già registrato!</font></b></h2></center>
    <A HREF="register.jsp">Torna indietro</A> oppure <A HREF="login.jsp">Effettua il login</A>
    <%        } else {

        //cripta le password in md5
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

        //iserisce gli utenti nel db
        sql = "INSERT INTO `user`(`username`, `password`, `nome`, `cognome`, `cod`, `mail`) VALUES ('" + uname + "','" + md5pass + "','" + nome + "','" + cognome + "','" + cod + "','" + mail + "')";
        stmt.executeUpdate(sql);

        //invio mail
        /*String from = "admin@shoppingcart.com";
        String to = mail;
        try {
        SmtpClient client = new SmtpClient("mail.shoppingcart.com");
        client.from(from);
        client.to(to);
        PrintStream message = client.startMessage();
        message.println("To: " + to);
        message.println("Subject:  Registrazione a Shopping Cart!");
        message.println("Hai effettuato con successo la registrazione al sito: Shopping Cart");
        message.println();
        message.println("Dati di accesso:");
        message.println();
        message.println("Username: "+uname);
        message.println();
        message.println("Password: "+pass);
        client.closeServer();
        } catch (IOException e) {
        System.out.println("errore nell'invio della mail:" + e);
        }*/
    %>
    <center><h2><b><font color="lightgreen">Registrazione completata con successo</font></b></h2></center><br>
                <%
                    out.println("Ti sei registrato con i seguenti dati: <br>");
                    out.println("Username: <b>" + uname+"</b><br>");
                    out.println("Password: <b>" + repass + "</b><br>");
                    out.println("Una mail di conferma ti è stata inviata a: <b>" + mail+"</b>");
                %>
    <br><br><A HREF="login.jsp">Effettua il login</A>
    <%        }
    %>
</body>
</html>