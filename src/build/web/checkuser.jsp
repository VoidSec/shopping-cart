<%-- 
    Document   : checkuser
    Created on : 7-dic-2011, 14.53.53
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page session="true" %>
<%String redirectURL = "redir.jsp?tipo=user";
    if (session.getAttribute("isLoggedIn") == null) {
        response.sendRedirect(redirectURL);
    } else {
    }
%>