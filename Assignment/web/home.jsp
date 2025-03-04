<%-- 
    Document   : home
    Created on : Mar 1, 2025, 8:14:26 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shop Mô Hình</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="style.css" rel="stylesheet">
        <style>
           /* Banner styles */
           .banner {
               background-color: #f8f9fa;
               padding: 120px 0;
               text-align: center;
               margin-bottom: 50px;
               background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)), url('https://via.placeholder.com/1920x600');
               background-size: cover;
               background-position: center;
               background-attachment: fixed;
               position: relative;
           }

           .banner::before {
               content: '';
               position: absolute;
               bottom: 0;
               left: 0;
               right: 0;
               height: 100px;
               background: linear-gradient(to top, #fff, transparent);
           }

           .banner h1 {
               font-size: 3.5rem;
               margin-bottom: 25px;
               color: #fff;
               font-weight: 800;
               text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
               letter-spacing: 1px;
           }

           .banner p {
               font-size: 1.4rem;
               color: #f8f9fa;
               margin-bottom: 30px;
               font-weight: 300;
               text-shadow: 1px 1px 2px rgba(0,0,0,0.2);
           }

           /* Product card styles */
           .card {
               transition: all 0.4s ease;
               border: none;
               border-radius: 15px;
               overflow: hidden;
               background: #fff;
               box-shadow: 0 5px 15px rgba(0,0,0,0.05);
           }

           .card:hover {
               transform: translateY(-10px);
               box-shadow: 0 15px 30px rgba(0,0,0,0.1);
           }

           .card-img-top {
               height: 250px;
               object-fit: cover;
               transition: transform 0.6s;
           }

           .card:hover .card-img-top {
               transform: scale(1.08);
           }

           .card-body {
               padding: 1.5rem;
               background-color: #fff;
               border-top: 1px solid rgba(0,0,0,0.05);
           }

           .card-title {
               font-size: 1.2rem;
               font-weight: 700;
               margin-bottom: 1rem;
               color: #2c3e50;
               letter-spacing: 0.5px;
           }

           .card-text {
               color: #2ecc71;
               font-weight: 700;
               font-size: 1.1rem;
               margin-bottom: 1.2rem;
               display: flex;
               align-items: center;
               justify-content: space-between;
           }

           .btn-primary {
               background: linear-gradient(45deg, #2980b9, #3498db);
               border: none;
               padding: 0.8rem 1.5rem;
               border-radius: 8px;
               transition: all 0.3s ease;
               text-transform: uppercase;
               font-weight: 600;
               letter-spacing: 0.5px;
               width: 100%;
           }

           .btn-primary:hover {
               background: linear-gradient(45deg, #3498db, #2980b9);
               transform: translateY(-2px);
               box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
           }

           /* Products section styles */
           .container.my-5 h2 {
               font-size: 2.5rem;
               color: #2c3e50;
               position: relative;
               padding-bottom: 20px;
               margin-bottom: 50px;
               text-align: center;
               font-weight: 800;
           }

           .container.my-5 h2::after {
               content: '';
               position: absolute;
               bottom: 0;
               left: 50%;
               transform: translateX(-50%);
               width: 80px;
               height: 4px;
               background: linear-gradient(45deg, #2980b9, #3498db);
               border-radius: 2px;
           }

           .container.my-5 h2::before {
               content: '';
               position: absolute;
               bottom: -2px;
               left: 50%;
               transform: translateX(-50%);
               width: 150px;
               height: 1px;
               background-color: #e0e0e0;
           }

           /* Responsive adjustments */
           @media (max-width: 768px) {
               .banner {
                   padding: 80px 0;
               }
               
               .banner h1 {
                   font-size: 2.5rem;
               }
               
               .banner p {
                   font-size: 1.1rem;
               }
               
               .col-md-3 {
                   margin-bottom: 25px;
               }
               
               .container.my-5 h2 {
                   font-size: 2rem;
               }
           }

           /* Animation for cards */
           @keyframes fadeInUp {
               from {
                   opacity: 0;
                   transform: translateY(20px);
               }
               to {
                   opacity: 1;
                   transform: translateY(0);
               }
           }

           .col-md-3 {
               animation: fadeInUp 0.6s ease-out forwards;
           }

           .col-md-3:nth-child(2) { animation-delay: 0.2s; }
           .col-md-3:nth-child(3) { animation-delay: 0.4s; }
           .col-md-3:nth-child(4) { animation-delay: 0.6s; }

           /* Product Category List styles */
           .category-list {
               margin-bottom: 40px;
               padding: 20px 0;
               background: #f8f9fa;
               border-radius: 15px;
           }

           .category-list ul {
               display: flex;
               justify-content: center;
               flex-wrap: wrap;
               gap: 15px;
               list-style: none;
               padding: 0;
               margin: 0;
           }

           .category-list li {
               margin: 5px;
           }

           .category-list a {
               display: inline-block;
               padding: 10px 20px;
               background: white;
               color: #2c3e50;
               text-decoration: none;
               border-radius: 25px;
               font-weight: 600;
               transition: all 0.3s ease;
               box-shadow: 0 2px 5px rgba(0,0,0,0.05);
           }

           .category-list a:hover {
               background: linear-gradient(45deg, #2980b9, #3498db);
               color: white;
               transform: translateY(-2px);
               box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
           }

           .category-list a.active {
               background: linear-gradient(45deg, #2980b9, #3498db);
               color: white;
           }

           /* Responsive adjustments for category list */
           @media (max-width: 768px) {
               .category-list {
                   padding: 15px 10px;
               }
               
               .category-list a {
                   padding: 8px 15px;
                   font-size: 0.9rem;
               }
           }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Banner -->
        <div class="banner">
            <div class="container">
                <h1>Chào mừng đến với Figure Shop</h1>
                <p>Khám phá bộ sưu tập mô hình độc đáo của chúng tôi</p>
            </div>
        </div>

        <!-- Category List -->
        <div class="container">
            <div class="category-list">
                <ul>
                    <li><a href="#" class="active">Tất cả</a></li>
                    <li><a href="#">Anime</a></li>
                    <li><a href="#">Game</a></li>
                    <li><a href="#">Marvel</a></li>
                    <li><a href="#">DC Comics</a></li>
                    <li><a href="#">Gundam</a></li>
                </ul>
            </div>
        </div>

        <!-- Products Section -->
        <div class="container my-5">
            <h2 class="text-center mb-4">Sản phẩm nổi bật</h2>
            <div class="row">
                <!-- Product Card 1 -->
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Mô hình 1">
                        <div class="card-body">
                            <h5 class="card-title">Mô hình 1</h5>
                            <p class="card-text">Giá: 500.000đ</p>
                            <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
                <!-- Product Card 2 -->
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Mô hình 2">
                        <div class="card-body">
                            <h5 class="card-title">Mô hình 2</h5>
                            <p class="card-text">Giá: 600.000đ</p>
                            <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
                <!-- Product Card 3 -->
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Mô hình 3">
                        <div class="card-body">
                            <h5 class="card-title">Mô hình 3</h5>
                            <p class="card-text">Giá: 700.000đ</p>
                            <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
                <!-- Product Card 4 -->
                <div class="col-md-3 mb-4">
                    <div class="card">
                        <img src="https://via.placeholder.com/300" class="card-img-top" alt="Mô hình 4">
                        <div class="card-body">
                            <h5 class="card-title">Mô hình 4</h5>
                            <p class="card-text">Giá: 800.000đ</p>
                            <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />
        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
