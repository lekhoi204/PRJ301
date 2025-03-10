<%-- 
    Document   : home
    Created on : Mar 1, 2025, 8:14:26 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                background-image: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.6)),
                    url('https://th.bing.com/th/id/OIP.N-PlaXXGuPHydumqBCAlEgHaEK?w=324&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7');
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
                box-shadow: 0 5px 15px rgba(0,0,0,0.08);
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 30px rgba(0,0,0,0.15);
            }

            .card-img-top {
                height: 300px;
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
                width: 100%;
                padding: 12px;
                border-radius: 25px;
                background: linear-gradient(45deg, #2980b9, #3498db);
                border: none;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 0.5px;
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
                background: white;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                margin-bottom: 40px;
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
                padding: 10px 25px;
                border-radius: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .category-list a:hover {
                background: linear-gradient(45deg, #2980b9, #3498db);
                color: white;
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

            .login-container {
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
                padding: 20px;
            }

            .login-form {
                background: white;
                padding: 40px;
                border-radius: 10px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                width: 100%;
                max-width: 400px;
            }

            .form-title {
                text-align: center;
                color: #333;
                margin-bottom: 30px;
                font-size: 28px;
                font-weight: 600;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 8px;
                color: #555;
                font-weight: 500;
            }

            .form-group input {
                width: 100%;
                padding: 12px 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                transition: border-color 0.3s ease;
            }

            .form-group input:focus {
                border-color: #4CAF50;
                outline: none;
                box-shadow: 0 0 5px rgba(76, 175, 80, 0.2);
            }

            .submit-btn {
                width: 100%;
                padding: 14px;
                background: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .submit-btn:hover {
                background: #45a049;
            }

            /* Thông báo lỗi */
            .error-message {
                color: #ff3333;
                text-align: center;
                margin-top: 15px;
                font-size: 14px;
            }

            /* Animation */
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .login-form {
                animation: fadeIn 0.5s ease-out;
            }

            /* Responsive */
            @media (max-width: 480px) {
                .login-form {
                    padding: 20px;
                }

                .form-title {
                    font-size: 24px;
                }

                .form-group input {
                    padding: 10px 12px;
                }

                .submit-btn {
                    padding: 12px;
                }
            }

            /* Hiệu ứng hover cho input */
            .form-group input:hover {
                border-color: #999;
            }

            /* Style cho placeholder */
            .form-group input::placeholder {
                color: #999;
            }

            /* Thêm icon cho input fields */
            .form-group {
                position: relative;
            }

            /* Hiệu ứng ripple cho button */
            .submit-btn {
                position: relative;
                overflow: hidden;
            }

            .submit-btn:after {
                content: '';
                position: absolute;
                top: 50%;
                left: 50%;
                width: 0;
                height: 0;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                transform: translate(-50%, -50%);
                transition: width 0.3s ease-out, height 0.3s ease-out;
            }

            .submit-btn:active:after {
                width: 200px;
                height: 200px;
            }

            /* Thêm shadow khi focus vào form */
            .login-form:focus-within {
                box-shadow: 0 0 25px rgba(0, 0, 0, 0.15);
            }

            /* Search box styles */
            .search-box {
                margin-top: 30px;
                max-width: 600px;
                margin-left: auto;
                margin-right: auto;
            }

            .search-form {
                display: flex;
                background: rgba(255, 255, 255, 0.95);
                border-radius: 50px;
                overflow: hidden;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                transition: all 0.3s ease;
            }

            .search-form:hover {
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            }

            .search-input {
                flex: 1;
                padding: 15px 25px;
                border: none;
                outline: none;
                font-size: 16px;
                background: transparent;
            }

            .search-button {
                padding: 15px 30px;
                border: none;
                background: linear-gradient(45deg, #2980b9, #3498db);
                color: white;
                font-weight: 600;
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .search-button:hover {
                background: linear-gradient(45deg, #3498db, #2980b9);
            }

            /* Price tag styling */
            .price-tag {
                background: #2ecc71;
                color: white;
                padding: 8px 15px;
                border-radius: 20px;
                font-weight: 600;
                display: inline-block;
                margin-bottom: 15px;
            }

            /* Thêm vào phần style trong home.jsp */
            .card-title a {
                text-decoration: none; /* Bỏ gạch chân mặc định */
                color: #2c3e50; /* Màu chữ mặc định */
                transition: all 0.3s ease; /* Hiệu ứng mượt khi hover */
            }

            .card-title a:hover {
                text-decoration: underline; /* Thêm gạch chân khi hover */
                color: #3498db; /* Đổi màu chữ khi hover */
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Banner -->
        <div class="banner">
            <div class="container">
                <h1>Chào mừng đến với Figure Store</h1>
                <p>Khám phá bộ sưu tập mô hình độc đáo của chúng tôi</p>
                <!-- Thêm search box -->
                <div class="search-box">
                    <form action="search" method="GET" class="search-form">
                        <input type="text" name="keyword" placeholder="Tìm kiếm mô hình..." class="search-input">
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i> Tìm kiếm
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Category List -->
        <div class="container">
            <div class="category-list">
                <ul>

                    <li><a href="MainController" class="${empty tag ? 'active' : ''}">Tất cả</a></li>
                        <c:forEach items="${listC}" var="o">

                        <li><a href="category?category_id=${o.category_id}" 
                               class="${tag == o.category_id ? 'active' : ''}">${o.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
        </div>

        <!-- Products Section -->
        <div class="container my-5">
            <h2 class="text-center mb-4">Sản phẩm nổi bật</h2>
            <div class="row">
                <!-- Product Card 1 -->
                <c:forEach items="${listP}" var ="o">
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <img src="${o.image_url}" 
                                 class="card-img-top" alt="${o.name}">
                            <div class="card-body">
                                <h5 class="card-title"><a href="detail?pid=${o.product_id}">${o.name}</a></h5>
                                <p class="card-text">${o.price}$</p>
                                <a href="#" class="btn btn-primary">Thêm vào giỏ</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>



        <jsp:include page="footer.jsp" />
    </body>
</html>
