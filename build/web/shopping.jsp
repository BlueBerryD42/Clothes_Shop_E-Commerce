<%-- 
    Document   : shopping
    Created on : Aug 21, 2024, 3:12:35 AM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>NguyenQuan Fashion</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="styles/shopping.css">
        <style>
            .fixed-size-img {
                width: 100%;
                height: 400px;
                object-fit: cover; /* Cắt ảnh để vừa với khung mà vẫn giữ tỉ lệ */
            }    
        </style>
    </head>
    <body>
        <%@include file="assets/header.jsp" %>

        <div id="carouselFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://img.freepik.com/free-vector/flat-design-minimal-boutique-sale-background_23-2149337460.jpg" class="d-block w-100" alt="Sale">
                </div>
                <div class="carousel-item">
                    <img src="https://c8.alamy.com/comp/G0TDCE/fashion-clothing-store-banner-with-shop-interior-clothing-on-hangers-G0TDCE.jpg" class="d-block w-100" alt="SaleBanner">
                </div>
                <div class="carousel-item">
                    <img src="https://static.vecteezy.com/system/resources/thumbnails/008/174/590/small_2x/fashion-advertising-web-banner-illustration-vector.jpg" class="d-block w-100" alt="SaleBanner1">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselFade" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselFade" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>

        <div class="shop-name">
            NguyenQuan Fashion
        </div>

        <div class="container my-5">
            <div class="row">
                <c:forEach var="product" items="${requestScope.LIST_PRODUCT}">
                    <div class="col-md-4 mb-4">
                        <div class="card">
                            <img src="${product.getPicture()}" class="card-img-top fixed-size-img" alt="${product.getName()}">
                            <div class="card-body text-center">
                                <h5 class="card-title">${product.getName()}</h5>
                                <p class="card-text text-muted">${product.getBrand()}</p>
                                <p class="card-text"><strong>${product.getPrice()} VND</strong></p>
                                <form action="MainController" method="POST" class="row">
                                    <input type="hidden" name="cmbShoes" id="cmbShoes-${product.getProductID()}" value="${product.getProductID()}-${product.getName()}-${product.getPrice()}-1-${product.getPicture()}-${product.getBrand()}-${product.getStatus()}">
                                    <div class="col-7">
                                        <input type="number" class="form-control" id="quantity-${product.getProductID()}" value="1" min="1" onchange="updateQuantity('${product.getProductID()}')">
                                    </div>
                                    <div class="col-5">
                                        <button class="btn btn-custom btn-block" type="submit" name="action" value="Add">Add to Cart</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>

        <%@include file="assets/footer.jsp" %>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            function updateQuantity(productId) {
                var quantity = document.getElementById('quantity-' + productId).value;
                var cmbShoes = document.getElementById('cmbShoes-' + productId);
                var values = cmbShoes.value.split('-');
                values[3] = quantity;
                cmbShoes.value = values.join('-');
            }
        </script>
    </body>
</html>