<%-- 
    Document   : Login
    Created on : Feb 29, 2024, 9:51:20 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iNotes - Login</title>
        <link rel="stylesheet" href="css/mycss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link href="https://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet">
    </head>
    <body class="body-background">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/759254fb16.js" crossorigin="anonymous"></script>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <form class="login-reg-form form-group text-center" method="post" action="Login">
                    <h3 class="login-reg-form-h3">Welcome to iNotes!</h3>
                    <input class="form-control" name="username" type="text" placeholder="Username">
                    <br/>
                    <input class="form-control" name="password" type="password" placeholder="Password">
                    <br/>
                    <c:if test="${loginErr!=null}">
                    <div class="alert alert-danger">
                        <strong>Error!</strong> ${loginErr}
                    </div>
                    </c:if>
                    <input class="btn btn-primary" type="submit" value="Login" 
                           style="font-weight: bold; padding: 5px 100px;">
                    <br/>
                    <div class="option-2">
                        <a href="Register" style="text-decoration: none">Don't have an account?</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
