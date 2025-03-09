<%-- 
    Document   : footer
    Created on : Mar 1, 2025, 8:19:37 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            footer {
                margin-top: 50px;
            }

            footer a {
                text-decoration: none;
            }

            footer a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <footer class="bg-dark text-white py-4">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>Về chúng tôi</h5>
                        <p>Shop mô hình chuyên cung cấp các sản phẩm mô hình chất lượng cao</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Liên hệ</h5>
                        <p>Email: info@shopmohinh.com<br>
                            Điện thoại: 0123456789</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Theo dõi chúng tôi</h5>
                        <a href="#" class="text-white me-3">Facebook</a>
                        <a href="#" class="text-white me-3">Instagram</a>
                        <a href="#" class="text-white">Twitter</a>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>