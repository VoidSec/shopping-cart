<%-- 
    Document   : error
    Created on : 2-dic-2011, 9.46.52
    Author     : Fallen Angel
--%>

<html>
    <body>
        <%@ page isErrorPage = "true" %>
        <div class="message">
            Siamo spiacenti, si è verificato un errore
            durante l'esecuzione:<br /><br />
            <%= exception.getMessage()%>
        </div>
    </body>
</html>
