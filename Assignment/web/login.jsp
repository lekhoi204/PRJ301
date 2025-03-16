<%-- 
    Document   : login
    Created on : Mar 1, 2025, 8:14:19 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập & Đăng ký</title>
        <style>
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
                position: relative;
                overflow: hidden;
            }

            .form-container {
                display: flex;
                width: 200%;
                transition: transform 0.6s ease-in-out;
                gap: 40px;
            }

            .login-signup {
                width: 50%;
                padding: 20px;
                box-sizing: border-box;
                transition: transform 0.6s ease-in-out, opacity 0.3s ease-in-out;
                opacity: 1;
            }

            .toggle-form {
                margin-top: 20px;
                text-align: center;
            }

            .toggle-btn {
                background: none;
                border: none;
                color: #4CAF50;
                cursor: pointer;
                font-size: 14px;
                text-decoration: underline;
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

            .error-message {
                color: #ff3333;
                text-align: center;
                margin-top: 15px;
                font-size: 14px;
                background-color: #ffe6e6;
                padding: 10px;
                border-radius: 5px;
                display: none;
            }

            /* Animation cho chuyển đổi form */
            .slide-left {
                transform: translateX(calc(-50% - 20px));
            }

            /* Responsive */
            @media (max-width: 480px) {
                .login-form {
                    padding: 20px;
                }

                .form-container {
                    gap: 20px;
                }

                .slide-left {
                    transform: translateX(calc(-50% - 10px));
                }
            }

            /* Hiệu ứng hover và focus */
            .form-group input:hover {
                border-color: #999;
            }

            .submit-btn:hover {
                background: #45a049;
            }

            .form-group input:focus {
                border-color: #4CAF50;
                outline: none;
                box-shadow: 0 0 5px rgba(76, 175, 80, 0.2);
            }

            /* Hiệu ứng mờ dần khi chuyển đổi */
            .form-container.slide-left .login-signup:first-child {
                opacity: 0;
            }

            .form-container:not(.slide-left) .login-signup:last-child {
                opacity: 0;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div class="login-container">
            <div class="login-form">
                <div class="form-container">
                    <!-- Form Đăng nhập -->
                    <div class="login-signup">
                        <h2 class="form-title">Đăng nhập</h2>
                        <form action="login" method="post">
                            <input type="hidden" name="action" value="login" />

                            <div class="form-group">
                                <label for="userId">Tên đăng nhập</label>
                                <input type="text" id="user_id" name="txtUserID" required 
                                       placeholder="Nhập tên đăng nhập"/>
                            </div>

                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" id="password" name="txtPassword" required 
                                       placeholder="Nhập mật khẩu"/>
                            </div>

                            <button type="submit" class="submit-btn">Đăng nhập</button>
                            
                            <div class="error-message" id="login-error">
                                ${requestScope.message==null?"":requestScope.message}
                            </div>

                            <div class="toggle-form">
                                <p>Chưa có tài khoản? 
                                    <button type="button" class="toggle-btn" onclick="toggleForm()">
                                        Đăng ký ngay
                                    </button>
                                </p>
                            </div>
                        </form>
                    </div>

                    <!-- Form Đăng ký -->
                    <div class="login-signup">
                        <h2 class="form-title">Đăng ký</h2>
                        <form action="signup" method="post">
                            <input type="hidden" name="action" value="signup" />

                            <div class="form-group">
                                <label for="reg-username">Tên đăng nhập</label>
                                <input type="text" id="reg-username" name="txtUsername" required 
                                       placeholder="Nhập tên đăng nhập"/>
                            </div>

                            <div class="form-group">
                                <label for="reg-password">Mật khẩu</label>
                                <input type="password" id="reg-password" name="txtPassword" required 
                                       placeholder="Nhập mật khẩu"/>
                            </div>

                            <div class="form-group">
                                <label for="reg-confirm">Xác nhận mật khẩu</label>
                                <input type="password" id="reg-confirm" name="txtConfirm" required 
                                       placeholder="Nhập lại mật khẩu"/>
                            </div>
                             <div class="form-group">
                                <label for="reg-fullname">Họ và Tên</label>
                                <input type="text" id="reg-fullname" name="txtFullName" required 
                                       placeholder="Nhập Họ và tên"/>
                            </div>

                            <div class="form-group">
                                <label for="reg-email">Email</label>
                                <input type="email" id="reg-email" name="txtEmail" required 
                                       placeholder="Nhập email"/>
                            </div>

                            <button type="submit" class="submit-btn">Đăng ký</button>

                            <div class="error-message" id="register-error"></div>

                            <div class="toggle-form">
                                <p>Đã có tài khoản? 
                                    <button type="button" class="toggle-btn" onclick="toggleForm()">
                                        Đăng nhập
                                    </button>
                                </p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="footer.jsp" />

        <script>
            window.onload = function() {
                const message = "${requestScope.message}";
                if (message) {
                    document.getElementById('login-error').style.display = 'block';
                }
            };

            function toggleForm() {
                const container = document.querySelector('.form-container');
                container.classList.toggle('slide-left');
            }

            document.querySelector('form[action="register"]').onsubmit = function(e) {
                const password = document.getElementById('reg-password').value;
                const confirm = document.getElementById('reg-confirm').value;
                const errorDiv = document.getElementById('register-error');

                if (password !== confirm) {
                    e.preventDefault();
                    errorDiv.textContent = 'Mật khẩu xác nhận không khớp!';
                    errorDiv.style.display = 'block';
                    return false;
                }
                return true;
            };
        </script>
    </body>
</html>