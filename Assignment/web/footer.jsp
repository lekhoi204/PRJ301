<%-- 
    Document   : footer
    Created on : Mar 1, 2025, 8:19:37 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Footer -->
<div class="footer-wrapper">
    <footer class="footer">
        <div class="container">
            <div class="row">
                <!-- Thông tin cửa hàng -->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                    <h5 class="footer-heading">Figure Shop</h5>
                    <p class="footer-text">Chuyên cung cấp các mô hình figure chính hãng từ Nhật Bản với chất lượng cao và giá cả hợp lý.</p>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-youtube"></i></a>
                    </div>
                </div>

                <!-- Danh mục sản phẩm -->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                    <h5 class="footer-heading">Danh mục</h5>
                    <ul class="footer-links">
                        <li><a href="#">Anime Figures</a></li>
                        <li><a href="#">Game Figures</a></li>
                        <li><a href="#">Marvel Figures</a></li>
                        <li><a href="#">DC Comics Figures</a></li>
                        <li><a href="#">Gundam Models</a></li>
                    </ul>
                </div>

                <!-- Hỗ trợ khách hàng -->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                    <h5 class="footer-heading">Hỗ trợ khách hàng</h5>
                    <ul class="footer-links">
                        <li><a href="#">Hướng dẫn mua hàng</a></li>
                        <li><a href="#">Chính sách đổi trả</a></li>
                        <li><a href="#">Chính sách bảo hành</a></li>
                        <li><a href="#">Phương thức thanh toán</a></li>
                        <li><a href="#">FAQ</a></li>
                    </ul>
                </div>

                <!-- Liên hệ -->
                <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                    <h5 class="footer-heading">Liên hệ</h5>
                    <ul class="footer-contact">
                        <li><i class="fas fa-map-marker-alt"></i> 123 Đường ABC, Quận XYZ, TP.HCM</li>
                        <li><i class="fas fa-phone"></i> (84) 123-456-789</li>
                        <li><i class="fas fa-envelope"></i> info@figureshop.com</li>
                        <li><i class="fas fa-clock"></i> Thứ 2 - Chủ nhật: 9:00 - 21:00</li>
                    </ul>
                </div>
            </div>

            <!-- Copyright -->
            <div class="footer-bottom">
                <div class="row">
                    <div class="col-md-6">
                        <p class="copyright">© 2024 Figure Shop. All rights reserved.</p>
                    </div>
                    <div class="col-md-6">
                        <ul class="footer-bottom-links">
                            <li><a href="#">Điều khoản sử dụng</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

<style>
    .footer-wrapper {
        width: 100vw;
        position: relative;
        left: 50%;
        right: 50%;
        margin-left: -50vw;
        margin-right: -50vw;
        background: #2c3e50;
    }

    .footer {
        background: #2c3e50;
        color: #ecf0f1;
        padding: 60px 0 30px;
        width: 100%;
        margin: 0;
    }

    /* Reset margin và padding cho footer */
    .footer {
        background: #2c3e50;
        color: #ecf0f1;
        padding: 60px 0 30px;
        margin: 50px 0 0 0; /* Bỏ margin bên phải và trái */
        width: 100%; /* Chiếm toàn bộ chiều rộng */
        position: relative;
    }

    /* Container trong footer */
    .footer .container {
        max-width: 1200px; /* hoặc width tùy theo thiết kế của bạn */
        margin: 0 auto;
        padding: 0 15px;
    }

    /* Thêm style cho wrapper nếu cần */
    .footer-wrapper {
        width: 100%;
        background: #2c3e50;
    }

    .footer::before {
        content: '';
        position: absolute;
        top: -10px;
        left: 0;
        right: 0;
        height: 2px;
        background: linear-gradient(90deg, 
            transparent 0%, 
            #3498db 20%, 
            #3498db 80%, 
            transparent 100%
        );
    }

    .footer .row > div {
        border-right: 1px solid rgba(255, 255, 255, 0.1);
        padding: 20px 30px;
    }

    .footer .row > div:last-child {
        border-right: none;
    }

    .footer-heading {
        color: #fff;
        font-size: 18px;
        font-weight: 600;
        margin-bottom: 25px;
        position: relative;
        padding-bottom: 15px;
        border-bottom: 2px solid #3498db;
    }

    .footer-text {
        color: #bdc3c7;
        line-height: 1.6;
        margin-bottom: 20px;
    }

    .social-links {
        display: flex;
        gap: 15px;
    }

    .social-link {
        width: 35px;
        height: 35px;
        background: rgba(255, 255, 255, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        color: #fff;
        transition: all 0.3s ease;
    }

    .social-link:hover {
        background: #3498db;
        color: #fff;
        transform: translateY(-3px);
    }

    .footer-links {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-links li {
        margin-bottom: 12px;
        padding-bottom: 12px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    }

    .footer-links li:last-child {
        border-bottom: none;
    }

    .footer-links a {
        color: #bdc3c7;
        text-decoration: none;
        transition: all 0.3s ease;
        display: block;
        padding: 5px 0;
    }

    .footer-links a:hover {
        color: #3498db;
        padding-left: 10px;
    }

    .footer-contact {
        list-style: none;
        padding: 0;
        margin: 0;
    }

    .footer-contact li {
        color: #bdc3c7;
        margin-bottom: 15px;
        padding-bottom: 15px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .footer-contact li:last-child {
        border-bottom: none;
    }

    .footer-contact i {
        color: #3498db;
        width: 20px;
        text-align: center;
    }

    .footer-bottom {
        margin-top: 40px;
        padding-top: 20px;
        border-top: 2px solid rgba(255, 255, 255, 0.1);
    }

    .copyright {
        color: #bdc3c7;
        margin: 0;
    }

    .footer-bottom-links {
        list-style: none;
        padding: 0;
        margin: 0;
        display: flex;
        justify-content: flex-end;
        gap: 20px;
    }

    .footer-bottom-links li {
        position: relative;
    }

    .footer-bottom-links li:not(:last-child)::after {
        content: '|';
        position: absolute;
        right: -10px;
        color: rgba(255, 255, 255, 0.2);
    }

    .footer-bottom-links a {
        color: #bdc3c7;
        text-decoration: none;
        transition: all 0.3s ease;
    }

    .footer-bottom-links a:hover {
        color: #3498db;
    }

    @media (max-width: 768px) {
        .footer {
            padding: 40px 0 20px;
        }

        .footer .row > div {
            border-right: none;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 20px 15px;
        }

        .footer .row > div:last-child {
            border-bottom: none;
        }

        .footer-bottom-links {
            justify-content: center;
            margin-top: 15px;
        }

        .copyright {
            text-align: center;
        }
    }
</style>