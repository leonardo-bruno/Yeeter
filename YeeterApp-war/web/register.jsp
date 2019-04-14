<%-- 
    Document   : register
    Created on : 05-Apr-2019, 13:28:04
    Author     : alec
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%
    String fieldsThatFail = (String) request.getAttribute("fields");
    String userAlreadyExists = (String) request.getAttribute("userAlreadyExists");
    String userErrorMessage = (String) request.getAttribute("userError");
    boolean thereWasSomeError = true;
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Yeeter</title>
        <link rel="stylesheet" 
              href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" 
              crossorigin="anonymous">
         <link rel="stylesheet" href="loginstyle.css"/>
    </head>
    <body>
        <div class="container d-flex justify-content-center">
            <h1 class="mt-5 justify-content-center">Crear cuenta</h1>
        </div>
        <div class="body-container">
            <form method="post" action="Register">
                <div style="align-items: center;">
                    <%
                        if(userAlreadyExists != null) {
                    %>
                    <div class="alert alert-warning"> Usuario o correo ya en uso! </div>
                    <% 
                        }
                    %>
                    <%
                        if(userErrorMessage != null) {
                    %>
                    <div class="alert alert-warning">
                        <%=userErrorMessage%>
                    </div>
                    <%
                        }
                    %>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">username</span>
                        </div>
                        <input type="text" class="form-control <%=(fieldsThatFail != null && fieldsThatFail.contains("user") ? "is-invalid" : null)%>" placeholder="Username" 
                               aria-label="Username" aria-describedby="basic-addon1"
                               name="username" required="" autofocus="">
                    </div>
                    <%
                        if(fieldsThatFail != null && fieldsThatFail.contains("email")) {
                    %>
                        <div class="alert alert-warning">
                            El email ya está en uso!
                        </div>
                    <%
                        }
                    %>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span style="width: 38px; height: 38px; padding-right:3px; padding-top: 3px; display:inline-block;">
                                <img style="width: 35px; height: 35px" src="data:image/png;base64,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"></img>
                            </span>
                        </div>
                        <input type="email" class="form-control <%=userAlreadyExists%>" 
                               placeholder="e-mail" name="email" required=""
                               aria-label="Recipient's username" aria-describedby="basic-addon2">
                    </div>
                    <%
                        if(fieldsThatFail != null && fieldsThatFail.contains("pass")) {
                    %>
                    <div class="alert alert-warning">Las contraseñas no coinciden o tienen un tamaño menor que 6</div>
                    <% 
                        }
                    %>
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <div class="input-group-prepend">
                            <span style="width: 38px; height: 38px; padding-right:3px; padding-top: 3px; display:inline-block;">
                                <img style="width: 35px; height: 35px" src="https://www.sks.co.uk/media/catalog/category/Key_Cutting_Symbol_40.jpg"></img>
                            </span>
                        </div>
                        </div>
                        <input placeholder="Contraseña" required="" type="password" name="password1" class="form-control <%=(fieldsThatFail != null && fieldsThatFail.contains("pass")) ? "is-invalid" : null%>" id="basic-url" aria-describedby="basic-addon3">
                        <input placeholder="Repetir contraseña" required="" type="password" name="password2" class="form-control <%=(fieldsThatFail != null && fieldsThatFail.contains("pass")) ? "is-invalid" : null%>" id="basic-url" aria-describedby="basic-addon3">
                    </div>

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Nombre</span>
                        </div>
                    <input type="text" class="form-control" required="" name="name">
                    </div>
                    
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Apellidos</span>
                        </div>
                    <input type="text" class="form-control" required="" name="surname">
                    </div>
                    
                    <%
                        if(fieldsThatFail != null && fieldsThatFail.contains("birth")) {
                    %>
                    <div class="alert alert-warning">
                        La fecha no es correcta
                    </div>
                    <%
                        }
                    %>
                    
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Fecha de Nacimiento</span>
                        </div>
                    <input type="date" class="form-control <%=(fieldsThatFail != null && fieldsThatFail.contains("birth")) ? "is-invalid" : null%>" required="" name="birth">
                    </div>

                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text">Biografía</span>
                        </div>
                        <textarea class="form-control" aria-label="With textarea" name="bio"></textarea>
                    </div>
                    <button class="btn btn-lg btn-outline-info btn-block mt-5" type="submit">Registrarse</button>
                </div>
            </form>
        </div>
    </body>
</html>

