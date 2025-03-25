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
            <div class="row justify-content-around">
                <!-- Thông tin cửa hàng -->
                <div class="col-lg-5 col-md-5 mb-4">
                    <h5 class="footer-heading">Figure Shop</h5>
                    <p class="footer-text">Chuyên cung cấp các mô hình figure chính hãng từ Nhật Bản với chất lượng cao và giá cả hợp lý.</p>
                    
                </div>

                <!-- Liên hệ -->
                <div class="col-lg-5 col-md-5 mb-4">
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
                    <div class="col-md-12 text-center">
                        <p class="copyright">© 2024 Figure Shop. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>

<style>
    .footer-wrapper {
        width: 100%;
        background: #2c3e50;
        margin-top: 50px;
    }

    .footer {
        background: #2c3e50;
        color: #ecf0f1;
        padding: 60px 0 30px;
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

    @media (max-width: 768px) {
        .footer {
            padding: 40px 0 20px;
        }

        .footer .row > div {
            padding: 20px 15px;
        }

        .copyright {
            text-align: center;
        }
    }
</style>