<%-- 
    Document   : checkout
    Created on : Aug 21, 2024, 3:37:52 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.OrderDetail"%>
<%@page import="java.util.List"%>
<%@page import="Model.Order"%>
<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout Page</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Include custom CSS -->
    <link rel="stylesheet" href="checkout.css"
   
</head>
<body>
    <div class="container checkout-container">
        <c:if test="${sessionScope.LOGIN_USER == null}">
            <c:redirect url="login.jsp"></c:redirect>
        </c:if>

        <c:if test="${requestScope.ORDER != null}">
            <div class="order-summary">
                <h1>Thank you for purchasing</h1>
                <h3>Order Details</h3>
                <p><strong>Order ID:</strong> ${requestScope.ORDER.getOrderID()}</p>
                <p><strong>User ID:</strong> ${requestScope.ORDER.getUserID()}</p>
                <p><strong>Total Amount:</strong> ${requestScope.ORDER.getTotal()}$</p>
                <p><strong>Checkout Date:</strong> ${requestScope.ORDER.getDate()}</p>

                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No</th>
                            <th>Order ID</th>
                            <th>Product ID</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="orderDetail" varStatus="counter" items="${requestScope.LIST_ORDER_DETAIL}">
                            <tr>
                                <td>${counter.count}</td>
                                <td>${orderDetail.getOrderID()}</td>
                                <td>${orderDetail.getProductID()}</td>
                                <td>${orderDetail.getPrice()}$</td>
                                <td>${orderDetail.getQuantity()}</td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>    
            </div>
        </c:if>

        <div class="error-message">
            <h5>${requestScope.ERROR_MESSAGE}</h5>
            <h5>${requestScope.ERROR_CART_MESSAGE}</h5>
        </div>
        
           <c:url var="ShopLink" value="MainController">
                    <c:param name="action" value="Shopping_Page"></c:param>
                  </c:url>
        
            <c:url var="CartLink" value="MainController">
                    <c:param name="action" value="View"></c:param>
                  </c:url>
        <div class="row">        
        <div class="col-md-2">
        </div>

        <div class="col-md-2">
                        <a class="btn btn-danger btn-block" href="${CartLink}">Cart</a>
        </div>
       <div class="col-md-2">
        </div>
          <div class="col-md-2">
        </div>
        <div class="col-md-2">
                        <a class="btn btn-danger btn-block" href="${ShopLink}">Shopping</a>
        </div>
        
          <div class="col-md-2">
        </div>
     
    </div>
        </div>
        <%@include file="assets/footer.jsp" %>
    <!-- Include Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
