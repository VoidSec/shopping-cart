<%-- 
    Document   : isadmin
    Created on : 7-dic-2011, 14.52.15
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<%String redirectURL = "redir.jsp?tipo=admin";
    if (session.getAttribute("isLoggedIn") != null) {
        if (session.getAttribute("isLoggedIn").toString().equals("true") && session.getAttribute("rank").toString().equals("5")) {
        } else {
            response.sendRedirect(redirectURL);
        }
    } else {
        response.sendRedirect(redirectURL);
    }
%>