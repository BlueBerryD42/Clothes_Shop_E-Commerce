<!DOCTYPE html>
<html>
<head>
    <title>Product | Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Main CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="addProduct.css">
</head>
<body>
    <div class="container">
        <div class="col-md-12 text-danger">
            ${requestScope.ERROR}
        </div>
        <form action="MainController" method="POST" class="needs-validation" novalidate>
            <div class="card">
                <div class="card-header">
                    ADD NEW PRODUCT
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="productID">Product ID</label>
                        <input type="text" class="form-control" id="productID" name="productID" required>
                        <div class="invalid-feedback">Please enter a Product ID.</div>
                    </div>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                        <div class="invalid-feedback">Please enter the product name.</div>
                    </div>
                    <div class="form-group">
                        <label for="price">Price</label>
                        <input type="number" class="form-control" id="price" name="price" required>
                        <div class="invalid-feedback">Please enter the product price.</div>
                    </div>
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <input type="number" class="form-control" id="quantity" name="quantity" required>
                        <div class="invalid-feedback">Please enter the product quantity.</div>
                    </div>
                    <div class="form-group">
                        <label>Image</label>
                        <div id="myfileupload">
                            <input type="file" id="uploadfile" name="picture" onchange="readURL(this);" />
                        </div>
                        <div id="thumbbox">
                            <img id="thumbimage" alt="Thumb image" style="display: none;" />
                        </div>
<!--                        <button type="button" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Choose Image</button>-->
                    </div>
                    <div class="form-group">
                        <label for="brand">Brand</label>
                        <input type="text" class="form-control" id="brand" name="brand" required>
                        <div class="invalid-feedback">Please enter the brand name.</div>
                    </div>
                </div>
                <div class="card-footer text-right">
                    <button type="submit" class="btn btn-primary" name="action" value="AddProduct">Add Product</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </div>
        </form>
    </div>
            <%@include file="assets/footer.jsp" %>
    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $("#thumbimage").attr('src', e.target.result).show();
                }
                reader.readAsDataURL(input.files[0]);
            }
        }

        (function () {
            'use strict';
            window.addEventListener('load', function () {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
