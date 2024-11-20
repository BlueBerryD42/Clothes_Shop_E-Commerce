<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Minimal Navbar</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #333;
            padding: 0.75rem 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: white;
        }
        .navbar a, .navbar button {
            color: white;
            text-decoration: none;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 0.9rem;
            padding: 0;
            margin: 0 0.5rem;
        }
        .navbar .logo img {
            width: 35px;
            height: 35px;
        }
        .navbar form {
            display: flex;
            align-items: center;
            margin: 0;
        }
        .navbar input {
            padding: 0.5rem;
            border-radius: 2px;
            border: 1px solid #555;
            background-color: #444;
            color: white;
            font-size: 0.9rem;
            margin-right: 0.5rem;
        }
        .navbar .cart-badge {
            background-color: #e74c3c;
            border-radius: 50%;
            padding: 0.2rem 0.5rem;
            font-size: 0.75rem;
            position: relative;
            top: -8px;
            right: 8px;
        }
        .navbar .profile img {
            width: 30px;
            height: 30px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <!-- Logo -->
        <a class="logo" href="MainController?action=Shopping_Page">
            <img src="https://marketplace.canva.com/EAFX7rWJisY/1/0/1600w/canva-black-white-minimalist-clothes-store-logo-pRfkmnSCS2I.jpg" alt="Logo">
        </a>
        
        <!-- Search & Cart -->
        <form action="MainController" method="POST">
            <input type="text" name="searchProduct" placeholder="Search" value="">
            <button type="submit" name="action" value="Find">Search</button>
            <button type="submit" name="action" value="View" aria-label="View Cart">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                    <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5M3.102 4l1.313 7h8.17l1.313-7zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4m7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4m-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2m7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2"/>
                </svg>
                <c:if test="${sessionScope.CART != null}">
                    <c:set var="totalQuantity" value="0" />
                    <c:forEach var="product" items="${sessionScope.CART.getCart().values()}">
                        <c:set var="totalQuantity" value="${totalQuantity + product.getQuantity()}" />
                    </c:forEach>
                    <span class="cart-badge">${totalQuantity}</span>
                </c:if>
            </button>
        </form>

        <!-- Profile -->
        <c:if test="${sessionScope.LOGIN_USER != null}">
            <div class="profile">
                <img src="${sessionScope.LOGIN_USER.picture == null || sessionScope.LOGIN_USER.picture == '' ? 'assets/avatar.jpg' : sessionScope.LOGIN_USER.picture}" alt="Profile">
                <form action="MainController" method="POST">
                    <button type="submit" name="action" value="Logout">Log Out</button>
                </form>
            </div>
        </c:if>
    </div>
</body>
</html>
