<%-- 
    Document   : upload
    Created on : 24-mag-2012, 11.27.27
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" %>
<%@ include file="isadmin.jsp" %>
<link href="img/styles.css" rel="stylesheet" type="text/css">
<br>
<center>
    <h1>Img Uploader</h1><br>
    <form action="uploader.jsp" method="POST" enctype="multipart/form-data">
        <input type="file" name="theFile"><br>
        <input type="submit" value="Upload">
    </form>
</center>