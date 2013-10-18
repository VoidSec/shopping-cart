<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <link href="img/styles.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="content"> 
            <p></p>
            <center><font color="lightgreen"><h1>Shopping Cart Login</h1></font></center>
            <center>
                <br>
                <form action="logon.jsp" method="post" name="logForm" id="logForm" >
                    <div id="login">
                        <br>
                        <b>Username</b><br><input name="username" type="text" class="required" id="txtbox" size="13"><br>
                        <b>Password</b><br><input name="pwd" type="password" class="required password" id="txtbox" size="13"><br><br>
                        <center>
                            <a href="Reset" onclick="document.forms['logForm'].reset();return false;"><img src="img/cancel.png"/></a></button>
                            <input name="login" type="image" src="img/login.png" alt="Login"></center><br><br>                        
                        <br/>
                    </div>
                </form>
            </center>
            <pre>Non ancora registrato? <a href="register.jsp">Premi quì</a> per registrare un account.</pre>
    </body>
</html>