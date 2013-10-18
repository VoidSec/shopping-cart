<%-- 
    Document   : register
    Created on : 28-nov-2011, 18.21.32
    Author     : Fallen Angel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="img/styles.css" rel="stylesheet" type="text/css">
        <title>Registrati</title>
        <script language="JavaScript" type="text/javascript">
            function validateForm()
            {
                var x1=document.forms["passForm"]["uname"].value;
                var x2=document.forms["passForm"]["pass"].value;
                var x3=document.forms["passForm"]["pass2"].value;
                var x4=document.forms["passForm"]["nome"].value;
                var x5=document.forms["passForm"]["cognome"].value;
                var x6=document.forms["passForm"]["cod"].value;
                var x7=document.forms["passForm"]["mail"].value;
                if (x1==null || x1=="" || x2==null || x2=="" || x3==null || x3=="" || x4==null || x4=="" || x5==null || x5=="" || x6==null || x6=="" || x7==null || x7=="" )
                {
                    document.getElementById("div2").style.visibility = "visible";
                    return false;
                }else{
                    if(x2!=x3){
                        document.getElementById("div1").style.visibility = "visible";
                        return false;  
                    }
                }
                return true;
            }
        </script>
    </head>
    <body>
        <br>
        <table border="0" bgcolor="#339999" cellspacing="5" cellpadding="3">
            <form name="passForm" action="insert.jsp" method="POST" onsubmit="return validateForm()">
                <tr>
                    <td>
                        <h2>Registrati</h2>
                    </td>
                </tr>
                <tr>
                    <td>
                        Username:<td><input type="text" name="uname" MAXLENGTH="10"/></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Password:<td><input type="password" name="pass" /></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Reinserisci Password:<td><input type="password" name="pass2" /></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nome:<td><input type="text" name="nome" /></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Cognome:<td><input type="text" name="cognome" /></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Codice Fiscale:<td><input type="text" name="cod" MAXLENGTH="16"/></td>
                    </td>
                </tr>
                <tr>
                    <td>
                        Mail:<td><input type="text" name="mail" /></td>
                    </td>
                </tr>
                <tr>
                    <td>                           
                <center><input name="login" type="image" src="img/register.png"  WIDTH="120" HEIGHT="40" alt="Registrati"> </center>
                </td>
                </tr>
            </form>
        </table>
        <br>
        <br>            
        Già registrato? <A HREF="login.jsp">Effettua il Login</A>
        <hr>
    <center>
        <div id="div1" class="divStyle" style="visibility: hidden">    
            <input type="text" disabled name="err" style="color: red; font-weight: bold; border:none" size="30" value="Le password non corrispondono"/>
        </div>
        <div id="div2" class="divStyle" style="visibility: hidden">    
            <input type="text" disabled name="err2" style="color: red; font-weight: bold; border:none" size="30" value="Dati mancanti, completa il form!"/>
        </div>
    </center>
</body>
</html>