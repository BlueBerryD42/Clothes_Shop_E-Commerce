<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Simple Footer Example</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }
        .content {
            flex: 1;
        }
        .footer {
            background-image: linear-gradient(to top, #9795f0 0%, #fbc8d4 100%);
            color: white;
            text-align: center;
            padding: 1rem;
        }
        .footer p, .footer a {
            margin: 0.5rem 0;
            color: white;
            text-decoration: none;
            font-size: 0.9rem;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
    <!-- Optional: Include Bootstrap and Font Awesome for additional styling -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <!-- Bootstrap Icons (optional for icons) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<body>
    <div class="content">
        <!-- Main content goes here -->
    </div>

<footer class="bg-dark text-white py-4">
  <div class="container">
    <div class="row">
      <!-- About Section -->
      <div class="col-md-4">
        <h5>About Us</h5>
        <p>We offer a wide range of products to meet your every need. Our goal is to provide top quality service and ensure customer satisfaction.</p>
      </div>

      <!-- Links Section -->
      <div class="col-md-4">
        <h5>Quick Links</h5>
        <ul class="list-unstyled">
          <li><a href="#" class="text-white">Home</a></li>
          <li><a href="#" class="text-white">Shop</a></li>
          <li><a href="#" class="text-white">Contact Us</a></li>
          <li><a href="#" class="text-white">FAQs</a></li>
          <li><a href="#" class="text-white">Terms & Conditions</a></li>
        </ul>
      </div>

      <!-- Contact Section -->
      <div class="col-md-4">
        <h5>Contact Us</h5>
        <p><i class="bi bi-geo-alt-fill"></i> Ho Chi Minh City, VietNam</p>
        <p><i class="bi bi-telephone-fill"></i> +123 456 7890</p>
        <p><i class="bi bi-envelope-fill"></i> info@yourshop.com</p>
      </div>
    </div>

    <div class="row mt-3">
      <div class="col text-center">
        <p>&copy; 2024 Your Shop. All Rights Reserved.</p>
      </div>
    </div>
  </div>
</footer>
</body>
</html>
