<%-- 
    Document   : viewCart
    Created on : Aug 21, 2024, 3:31:19 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="Model.Product"%>
<%@page import="Model.Cart"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NguyenQuan Fashion</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/viewCart.css">
</head>
<body>
    <div class="container">
        <h1>Your Selected Products</h1>
        <c:if test="${sessionScope.CART != null}">
            <div class="table-container">
                <table class="table table-bordered table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Image</th>
                            <th>Brand</th>
                            <th>Remove</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="total" value="0"/>
                        <c:forEach var="product" varStatus="counter" items="${sessionScope.CART.getCart().values()}">
                            <c:set var="itemTotal" value="${product.getPrice() * product.getQuantity()}"/>
                            <c:set var="total" value="${total + itemTotal}"/>
                            <form action="MainController" method="POST">
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${product.getProductID()}</td>
                                    <td>${product.getName()}</td>
                                    <td>
                                        <input type="number" name="quantity" value="${product.getQuantity()}" class="form-control" required="" min="1"/>
                                    </td>
                                    <td><fmt:formatNumber value="${product.getPrice()}" type="currency" currencySymbol="$" maxFractionDigits="2"/></td>
                                    <td><fmt:formatNumber value="${itemTotal}" type="currency" currencySymbol="$" maxFractionDigits="2"/></td>
                                    <td><img src="${product.getPicture()}" alt="Product Image" width="100" height="100"></td>
                                    <td>${product.getBrand()}</td>
                                    <td>
                                        <a href="MainController?action=Remove&id=${product.getProductID()}" class="btn btn-danger">Remove</a>
                                    </td>
                                    <td>
                                        <input type="hidden" name="id" value="${product.getProductID()}"/>
                                        <button type="submit" name="action" value="Edit" class="btn btn-primary">Edit</button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                    </tbody>
                </table>
                <h2 class="text-right">Total: <fmt:formatNumber value="${total}" type="currency" currencySymbol="$" maxFractionDigits="2"/></h2>
            </div>
        </c:if>
        <div class="text-center mt-4">
            <a href="MainController?action=Shopping_Page" class="btn btn-success">Add more!</a>
            <a href="MainController?action=Checkout" class="btn btn-warning">Check out!</a>
        </div>
    </div>
  
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
       <%@include file="assets/footer.jsp" %>
</body>
</html>
