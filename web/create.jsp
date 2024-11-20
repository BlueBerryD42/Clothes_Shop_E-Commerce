<%-- 
    Document   : create
    Created on : Aug 21, 2024, 2:29:22 AM
    Author     : ASUS
--%>

<%@page import="Model.UserError"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<html>
    <head>
        <title>Register Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Bootstrap-->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="styles/create.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap-grid.min.css" type="text/css"/>
    </head>
</head>
<body>
    <div class="loginform">
        <div class="loginheader">
            <h1>REGISTER</h1>
        </div>

        <div class="error-message">
            ${requestScope.ERROR}
        </div>

        <form action="MainController" method="POST">
            <div class="input-group">
                <input class="form-control" type="text" name="userID" required placeholder="User ID" />
                <div class="error-message">${requestScope.USER_ERROR.userIDError}</div>
            </div>
            <div class="input-group">
                <input class="form-control" type="text" name="fullName" required placeholder="Full Name" />
                <div class="error-message">${requestScope.USER_ERROR.fullNameError}</div>
            </div>
            <div class="input-group">
                <input class="form-control" type="text" name="roleID" value="US" required readonly />
            </div>
            <div class="input-group">
                <input class="form-control" type="password" name="password" required placeholder="Password" />
            </div>
            <div class="input-group">
                <input class="form-control" type="password" name="confirm" required placeholder="Confirm Password" />
                <div class="error-message">${requestScope.USER_ERROR.confirmError}</div>
            </div>
            <div class="input-group">
                <input class="btn btn-dark" type="reset" value="Reset" />
            </div>
            <div class="input-group">
                <input class="btn btn-dark" type="submit" name="action" value="Create" />
            </div>
            <div class="error-message">
                ${requestScope.USER_ERROR.error}
                ${requestScope.USER_SUCCESS}
            </div>
        </form>
    </div>
    <%@include file="assets/footer.jsp" %>
</body>
</html>