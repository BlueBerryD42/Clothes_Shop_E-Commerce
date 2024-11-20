<%-- 
    Document   : editProduct
    Created on : Aug 21, 2024, 2:43:35 AM
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
        <title>Edit Products</title>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <style>
            body {
                background-color: #fff;
                color: #000;
            }
            .container {
                margin-top: 30px;
            }
            .table th, .table td {
                vertical-align: middle;
            }
            .thead-dark th {
                background-color: #000;
                color: #fff;
            }
            .btn-custom {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <c:if test="${sessionScope.LOGIN_USER == null || sessionScope.LOGIN_USER.roleID ne 'AD'}">
                <c:redirect url="login.jsp"></c:redirect>
            </c:if>

            <h1>List Products</h1>

            <c:url var="BackLink" value="MainController">
                <c:param name="action" value="Admin_Page"></c:param>
            </c:url>

            <div class="row mb-3">
                <form action="MainController" method="POST" class="form-inline">
                    <label for="searchP" class="mr-2">Search:</label>
                    <input type="text" id="searchP" name="searchP" class="form-control mr-2" value="${param.searchP}">
                    <button type="submit" name="action" value="searchProduct" class="btn btn-primary">Search</button>
                </form>
                <a class="btn btn-dark ml-auto" href="${BackLink}">Return</a>
            </div>

            <c:if test="${requestScope.LIST_PRODUCT != null}">
                    <c:if test="${not empty requestScope.LIST_PRODUCT}">
                        <table class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <tr>
                                    <th>No</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Image</th>
                                    <th>Brand</th>
                                    <th>Edit</th>
                                  
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" varStatus="counter" items="${requestScope.LIST_PRODUCT}">
                                    <tr>
                                        <form action="EditProductController" method="POST">
                                            <td>${counter.count}</td>
                                            <td>
                                                <input type="text" class="form-control" name="productID" value="${product.getProductID()}" readonly=""/>
                                            </td>
                                            <td>
                                                <input type="text" class="form-control" name="name" value="${product.getName()}" required=""/>
                                            </td>
                                            <td>
                                                <input type="number" class="form-control" min="1" name="quantity" value="${product.getQuantity()}" required=""/>
                                            </td>
                                            <td>
                                                <input type="number" class="form-control" min="1" name="price" value="${product.getPrice()}" required=""/>
                                            </td>
                                            <td>
                                                <div class="form-group col-md-12">
                                                    <div id="myfileupload">
                                                        <input multiple type="file" id="uploadfile" name="picture" value="${product.getPicture()}" onchange="readURL(this);" />
                                                    </div>
                                                    <div id="thumbbox">
                                                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                                                        <a class="removeimg" href="javascript:"></a>
                                                    </div>
                                                </div>
                                            </td>  
                                            <td>
                                                <input type="text" class="form-control" name="brand" value="${product.getBrand()}" required=""/>
                                            </td>      
                                            <td>
                                                <button type="submit" class="btn btn-warning" name="action" value="EditProduct">Update</button>
                                                <input type="hidden" name="searchP" value="${param.searchP}">
                                            </td>
                                            <td>
                                                <c:url var="deleteLink" value="MainController">
                                                    <c:param name="action" value="DeleteProduct"></c:param>
                                                    <c:param name="productID" value="${product.getProductID()}"></c:param>
                                                    <c:param name="search" value="${param.search}"></c:param>
                                                </c:url>
                                              
                                            </td>
                                        </form>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                        ${requestScope.DELETE_ERROR}
                    </c:if>
                </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <%@include file="assets/footer.jsp" %>
    </body>
</html>