<%-- 
    Document   : MainPage
    Created on : Feb 29, 2024, 9:16:22 PM
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
        <title>iNote</title>
        <link rel="stylesheet" href="css/mycss.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
        <link href="https://fonts.cdnfonts.com/css/sf-pro-display" rel="stylesheet">
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
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Menu
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="Add"><i class="fa-solid fa-plus"></i> New note</a></li>
                                <c:if test="${user.role==1}">
                                <li>
                                    <a class="dropdown-item" href="Admin">
                                        <i class="fa-solid fa-user-cog"></i> Admin
                                    </a>
                                </li>
                                </c:if>
                            </ul>
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
        <br/>
        <br/>
        <div class="row justify-content-center">
            <table class="notes-table col-md-10">
                <tr class="notes-table-header">
                    <th class="col-md-2">Title</th>
                    <th class="col-md-3">Details</th>
                    <th class="col-md-1">Date added</th>
                    <th class="col-md-1">Due date</th>
                    <th class="col-md-2" colspan="2">Actions</th>
                </tr>
                <%for(Notes nt : DAO.INS.getNotesList()){%>
                <tr>
                    <input type="hidden" name="id" value="<%=nt.getId()%>">
                    <td><%=nt.getTitle()%></td>
                    <td><%=nt.getDetails()%></td>
                    <td><%=nt.getDateAdded()%></td>
                    <td><%=nt.getDueDate()%></td>
                    <td><a class="upd-button" href="Edit?id=<%=nt.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a></td>
                    <td><a class="del-button" href="Delete?id=<%=nt.getId()%>"><i class="fa-solid fa-trash"></i></a></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
