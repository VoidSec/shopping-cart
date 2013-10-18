<%-- 
    Document   : header
    Created on : 28-nov-2011, 19.14.06
    Author     : Fallen Angel
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="img/styles.css" rel="stylesheet" type="text/css">
<body>
    <div id="container">
        <div id="header">
        </div>
        <div id="navigation">
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="index.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/home.png"> Home</a></dt>
            </dl>
            <%
                if (session.getAttribute("isLoggedIn") != null) {
                    if (session.getAttribute("isLoggedIn").toString().equals("true")) {%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="buy.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/buy.png"><font color="red"> Compra</font></a></dt>
            </dl>
            <%}
                }%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="news.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/news.png"> News</a></dt>
            </dl>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="search.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/search.png"> Ricerca</a></dt>
            </dl>
            <%
                if (session.getAttribute("isLoggedIn") != null) {
                    if (session.getAttribute("isLoggedIn").toString().equals("true")) {%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="myset.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/account.png"> Profilo</a></dt>
            </dl>
            <%}
                }%>
            <%if (session.getAttribute("isLoggedIn") != null) {
                    if (session.getAttribute("rank").toString().equals("5")) {%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="logs.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/log.png"> Logs</a></dt>
            </dl>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="admin.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/admin.png"> AdminCP</a></dt>
            </dl>
            <%}
                }%>
            <%
                if (session.getAttribute("isLoggedIn") != null) {
                    if (session.getAttribute("isLoggedIn").toString().equals("true")) {%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="logout.jsp" onclick='return confirm("Vuoi veramente effettuare il logout?");' style="height: 18px; padding-top: 5px;"><img border=0 src="img/logout.png"> Logout</a></dt>
            </dl>
            <%}
            } else {%>
            <dl class="dropdown">
                <dt style="width: 85px" class="single"><a href="login.jsp" style="height: 18px; padding-top: 5px;"><img border=0 src="img/loginico.png"> Login</a></dt>
            </dl>
            <%}%>
        </div>
        <div id="main">
            <div id="left">
            </div>
            <div id="right">
                <%
                    if (session.getAttribute("isLoggedIn") != null) {
                        if (session.getAttribute("isLoggedIn").toString().equals("true")) {%>
                <div class="small-box"><h2>Benvenuto, <%=session.getAttribute("username")%> !</h2>
                    <div class="small-box-content">
                        <p>
                            <%if (session.getAttribute("nord") != null) {%>
                            N. ordini: <%=session.getAttribute("nord")%><br /><%}%>
                            <%if (session.getAttribute("ord_p") != null) {%>
                            N. ordini pagati: <%=session.getAttribute("ord_p")%><br /><%}%>
                            <%if (session.getAttribute("nord") != null && session.getAttribute("ord_p") != null) {%>
                            <font color="red"><b>N. ordini da pagare: <%=session.getAttribute("ord_np")%></b></font><br/><%}%>
                            <%if (session.getAttribute("tot") != null) {%>
                            Totale: <%=session.getAttribute("tot")%><br />
                            <%}%>
                            <%if (session.getAttribute("rank").equals("1")) {%><center><a href="buy.jsp">Carrello</a></center><%}%>
                        </p>
                    </div></div>
                    <%}
                        }%>
                <div class="small-box"><h2>Prodotti</h2>
                    <div class="small-box-content">
                        <p>
                        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="2">
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0001">Abiti Uomo</a></font></td>
                            </tr>
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0002">Abiti Donna</a></font></td>
                            </tr>
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0003">Accessori Uomo</a></font></td>
                            </tr>
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0004">Accessori Donna</a></font></td>
                            </tr>
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0005">Scarpe Uomo</a></font></td>
                            </tr>
                            <tr>
                                <td><font size="2"><a href="search.jsp?tipo=rep_cod&text=0006">Scarpe Donna</a></font></td>
                            </tr>
                            </font>
                        </table>
                        </p>
                    </div></div>
            </div>