<%-- 
    Document   : logout
    Created on : 7-dic-2011, 14.51.58
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%session.setAttribute("isLoggedIn", null);
    session.setAttribute("id", null);
    session.setAttribute("username", null);
    session.setAttribute("password", null);
    session.setAttribute("nome", null);
    session.setAttribute("cognome", null);
    session.setAttribute("cod", null);
    session.setAttribute("mail", null);
    session.setAttribute("rank", null);
    session.setAttribute("nord", null);
    session.setAttribute("ord_p", null);
    session.setAttribute("ord_np", null);
    session.setAttribute("tot", null);
    session.setAttribute("namefile", null);
    
    String redirectURL = "index.jsp";
    response.sendRedirect(redirectURL);
%>
