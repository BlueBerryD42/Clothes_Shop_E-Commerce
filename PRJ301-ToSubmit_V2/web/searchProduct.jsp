<%-- 
    Document   : searchProduct
    Created on : Aug 21, 2024, 3:06:48 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Search Results</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            body {
                background-color: #fff;
                color: #000;
            }
            .card-img-top {
                width: 100%;
                height: 200px;
                object-fit: cover;
            }
            .container {
                margin-top: 30px;
            }
            .alert {
                margin-bottom: 20px;
            }
            .btn-custom {
                background-color: #ff0000; 
                color: #fff;
                border: 1px solid #ff0000; 
            }
            .btn-custom:focus, .btn-custom:active {
                background-color: #ff0000; 
                border-color: #ff0000;
                color: #fff; 
            }
            .shop-name {
                font-size: 48px; /* Increase the font size */
                font-weight: bold; /* Make it bold */
                color: #ffffff; /* White color for contrast */
                text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5); /* Add a shadow for depth */
                background: linear-gradient(45deg, #ff6f61, #de425b); /* Gradient background */
                padding: 10px 20px;
                border-radius: 10px;
                text-align: center;
                max-width: 100%;
                margin: 20px auto;
            }

        </style>
    </head>
    <body>
        <%@include file="assets/header.jsp" %>
        <div class="shop-name">
            NguyenQuan Fashion
        </div>

        <div class="container">
            <h6>Search Results</h6>
            <c:if test="${empty requestScope.PRODUCT_LIST2}">
                <div class="alert alert-danger" role="alert">
                    No products found.
                </div>
            </c:if>

            <div class="row">
                <c:forEach var="product" items="${requestScope.PRODUCT_LIST2}">
                    <div class="col-md-4 mb-3">
                        <div class="card">
                            <img src="${product.getPicture()}" class="card-img-top" alt="${product.getName()}">
                            <div class="card-body">
                                <h5 class="card-title">${product.getName()}</h5>
                                <p class="card-text">${product.getPrice()} VND</p>
                                <p class="card-text">${product.getBrand()}</p>
                                <form action="MainController" method="POST">
                                    <input type="hidden" name="cmbShoes" id="cmbShoes-${product.getProductID()}" value="${product.getProductID()}-${product.getName()}-${product.getPrice()}-1-${product.getPicture()}-${product.getBrand()}">
                                    <div class="form-group">
                                        <input type="number" class="form-control" id="quantity-${product.getProductID()}" value="1" min="1" onchange="updateQuantity('${product.getProductID()}')">
                                    </div>
                                    <button class="btn btn-custom btn-block" type="submit" name="action" value="Add">Add to Cart</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
                                            function updateQuantity(productId) {
                                                var quantity = document.getElementById('quantity-' + productId).value;
                                                var cmbShoes = document.getElementById('cmbShoes-' + productId);
                                                var values = cmbShoes.value.split('-');
                                                values[3] = quantity;
                                                cmbShoes.value = values.join('-');
                                            }
        </script>
        <%@include file="assets/footer.jsp" %>
    </body>
</html>


