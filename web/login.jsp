<%-- 
    Document   : login
    Created on : Aug 20, 2024
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons (optional) -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1 class="text-center mt-5">Login</h1>
                    <!-- Login Form -->
                    <form action="MainController" method="POST" class="mt-4" onsubmit="return checkCaptcha()">
                        <div class="mb-3">
                            <label for="userid" class="form-label">User ID</label>
                            <input type="text" class="form-control" id="userid" name="userID" required placeholder="User ID">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required placeholder="Password">
                        </div>        
                        <div style="color:red" class="col-md-12 error-message">
                            ${requestScope.ERROR}
                        </div>
                        <div class="g-recaptcha mb-3" data-sitekey="6LevpQwqAAAAALyDJ5C4wXkL6p40tH7nU16ZSCa0"></div>
                        <div style="color:red" id="error"></div>
                        <button type="submit" name="action" value="Login" class="btn btn-primary w-100">Login</button>
                        <button type="reset" class="btn btn-secondary w-100 mt-2">Reset</button>
                    </form>
                    <!-- Additional Links -->
                    <p class="mt-3 text-center">
                        Don't have an account?
                        <c:url var="regisLink" value="create.jsp"></c:url>
                        <a href="${regisLink}">Register here</a>
                    </p>
            <div>
                         <a href="MainController?action=LastUser_Page">Last User</a>
                </div>
                    <p class="text-center">
                        Or quickly sign in by
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile%20openid&redirect_uri=http://localhost:8080/Final/LoginGoogleController&response_type=code&client_id=891138375259-l274o4b3tp4apoc86k4prbkrs6dtbgrq.apps.googleusercontent.com&approval_prompt=force" class="btn btn-danger text-white">
                            <i class="bi bi-google"></i> Google
                        </a>
                    </p>
                    <p class="text-center">
                        <a href="MainController?action=Shopping_Page">Continue to Shop</a>
                    </p>
                </div>
            </div>
        </div>
        <%@include file="assets/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Google reCAPTCHA -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script type="text/javascript">
                        function checkCaptcha() {
                            var error = document.getElementById("error");
                            var response = grecaptcha.getResponse();
                            if (response.length === 0) {
                                error.textContent = "Please verify that you are not a robot";
                                return false;
                            } else {
                                error.textContent = "";
                                return true;
                            }
                        }
        </script>
    </body>
</html>

