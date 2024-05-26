<%-- 
    Document   : AdminPage
    Created on : Mar 13, 2024, 3:04:05 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*"%>
<%@page import="Models.*"%>
<%@page import="dal.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/mycss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link href="https://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet">
        <title>iNotes - Admin</title>
    </head>
    <body>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://kit.fontawesome.com/759254fb16.js" crossorigin="anonymous"></script>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand">iNotes</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="MainPage">Home</a>
                        </li>
                        <li class="nav-item dropdown account-tab">
                            <a class="nav-link dropdown-toggle account-name" href="#" 
                               id="navbarDropdown" role="button" 
                               data-bs-toggle="dropdown" aria-expanded="false"
                               style="font-weight: bold">
                                <i class="fa-solid fa-user"></i>&nbsp;${user.username}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li>
                                    <a class="dropdown-item" href="Logout">
                                        <i class="fa-solid fa-right-from-bracket"></i> Log Out
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row justify-content-center text-center">
            <table class="member-list col-md-10">
                <h2 style="margin-top: 20px;" class="member-list-h2">Member Management</h2>
                <tr class="member-list-header">
                    <th class="col-md-2">User ID</th>
                    <th class="col-md-3">Username</th>
                    <th class="col-md-3">Role</th>
                    <th class="col-md-2" colspan="2">Actions</th>
                </tr>
                <%for(Users uA : DAO.INS.getUsersList()){%>
                <tr>
                    <td><%=uA.getUserId()%></td>
                    <td><%=uA.getUsername()%></td>
                    <td><%=uA.getRole()%></td>
                    <td>
                        <%if(uA.getRole()!=1){%>
                        <a class="del-button" href="DeleteUser?id=<%=uA.getUserId()%>">
                            <i class="fa-solid fa-trash"></i>&nbsp;Delete
                        </a>
                        <%}%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
