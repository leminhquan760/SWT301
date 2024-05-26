<%-- 
    Document   : Login
    Created on : Feb 29, 2024, 9:51:20 PM
    Author     : Admin
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="Models.*"%>
<%@page import="dal.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>iNotes - Register</title>
        <link rel="stylesheet" href="css/mycss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link href="https://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet">
    </head>
    <body class="body-background">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/759254fb16.js" crossorigin="anonymous"></script>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <form class="login-reg-form form-group text-center" method="post" action="Register">
                    <h3 class="login-reg-form-h3">Create New Account</h3>
                    <input class="form-control" name="username" type="text" placeholder="Username">
                    <br/>
                    <input class="form-control" name="password" type="password" placeholder="Password">
                    <br/>
                    <input class="form-control" name="confirmPassword" type="password" placeholder="Confirm Password">
                    <br/>
                    <c:if test="${regErr!=null}">
                    <div class="alert alert-danger">
                        <strong>Error!</strong> ${regErr}
                    </div>
                    </c:if>
                    <input class="btn btn-dark" type="submit" value="Register" 
                           style="font-weight: bold; padding: 5px 100px;">
                    <br/>
                    <div class="option-2">
                        <a href="Login" style="text-decoration: none">Already have an account?</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>