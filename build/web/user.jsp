<%-- 
    Document   : user
    Created on : Aug 21, 2024, 3:25:00 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Account" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!--<link rel="stylesheet" href="styles/user.css">-->
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="user.css">
    </head>
     <body>
        <div class="container mt-5">
            <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'US'}">
                <c:redirect url="login.html"></c:redirect>
            </c:if>
            <div class="card">
               <div class="card-header">
                        <h1 class="mb-0">USER INFORMATION</h1>
                    </div>
                <div class="card-body">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>UserID</th>
                            <td>${sessionScope.LOGIN_USER.userID}</td>
                        </tr>
                        <tr>
                            <th>FullName</th>
                            <td>${sessionScope.LOGIN_USER.fullName}</td>
                        </tr>
                        <tr>
                            <th>RoleID</th>
                            <td>${sessionScope.LOGIN_USER.roleID}</td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td>${sessionScope.LOGIN_USER.password}</td>
                        </tr>
                    </table>
                    <c:url var="ShopLink" value="MainController">
                        <c:param name="action" value="Shopping_Page"></c:param>
                    </c:url>
                    <c:url var="ViewLink" value="MainController">
                        <c:param name="action" value="View"></c:param>
                    </c:url>
                    
                    <div class="row mb-3 text-center">
                        <div class="col-md-6">    
                            <a class="btn btn-danger btn-block" href="${ViewLink}">Cart</a>
                        </div>
                        <div class="col-md-6">    
                            <a class="btn btn-danger btn-block" href="${ShopLink}">Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                            <%@include file="assets/footer.jsp" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>