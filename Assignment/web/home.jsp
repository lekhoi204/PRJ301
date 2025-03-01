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
            .banner {
                background-color: #f8f9fa;
                padding: 100px 0;
                text-align: center;
                margin-bottom: 30px;
            }

            .banner h1 {
                font-size: 2.5rem;
                margin-bottom: 20px;
            }

            /* Card styles */
            .card {
                transition: transform 0.3s;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .card-img-top {
                height: 200px;
                object-fit: cover;
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
