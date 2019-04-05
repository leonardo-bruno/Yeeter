<%-- 
    Document   : login
    Created on : 05-Apr-2019, 12:25:15
    Author     : alec
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Yeeter</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="loginstyle.css"/>
    </head>
    <body class="text-center">
        <div class="container d-flex justify-content-center" style="align-items: center;">
            <div style="width: 250px;">
                <form class="form-signin">
                    <h1 class="h3 mb-3 font-weight-normal">Log In</h1>
                    <label for="inputEmail" class="sr-only">Email address</label>
                    <input type="email" id="inputEmail" class="form-control" 
                           placeholder="Email address" required="" autofocus="">
                    <label for="inputPassword" class="sr-only">Password</label>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required="">
                    <div class="checkbox mb-3 mt-3">
                        <a cass="text-muted" href="forgotpswrd.jsp">Contraseña Olvidada</a>
                    </div>
                    <div class="btn-group" role="group">
                        <button class="btn btn-lg btn-outline-info btn-block" type="submit">Entrar</button>
                        <a href="register.jsp" class="btn btn-lg btn-outline-secondary">
                            Registrarse</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
