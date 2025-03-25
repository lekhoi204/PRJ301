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
        <link rel="stylesheet" href="assets/css/login.css" />
        <style>
            body {
                margin: 0;
                padding: 0;
                /* Sửa đường dẫn background */
                background-image: url('assets/image/backgound.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed; /* Giữ background cố định khi scroll */
                min-height: 100vh;
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
                        <c:if test="${not empty ERROR}">
                            <div class="alert alert-danger" role="alert">
                                ${ERROR}
                            </div>
                        </c:if>
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
            window.onload = function () {
                // Xử lý thông báo đăng ký thành công
                const successMessage = "${requestScope.SUCCESS_MESSAGE}";
                if (successMessage) {
                    document.getElementById('login-error').textContent = successMessage;
                    document.getElementById('login-error').style.display = 'block';
                    document.getElementById('login-error').style.backgroundColor = '#dff0d8';
                    document.getElementById('login-error').style.color = '#3c763d';
                    document.getElementById('login-error').style.border = '1px solid #d6e9c6';
                }

                // Xử lý thông báo lỗi đăng nhập
                const loginMessage = "${requestScope.message}";
                if (loginMessage) {
                    document.getElementById('login-error').textContent = loginMessage;
                    document.getElementById('login-error').style.display = 'block';
                }

                // Xử lý thông báo lỗi đăng ký và hiển thị form đăng ký
                const signupError = "${requestScope.SIGNUP_ERROR}";
                const showSignup = "${requestScope.SHOW_SIGNUP}";

                if (showSignup === "true") {
                    toggleForm();

                    if (signupError) {
                        const errorDiv = document.getElementById('register-error');
                        errorDiv.textContent = signupError;
                        errorDiv.style.display = 'block';
                    }

                    // Điền lại các giá trị đã nhập
                    const savedUsername = "${requestScope.savedUsername}";
                    const savedFullname = "${requestScope.savedFullname}";
                    const savedEmail = "${requestScope.savedEmail}";

                    if (savedUsername)
                        document.getElementById('reg-username').value = savedUsername;
                    if (savedFullname)
                        document.getElementById('reg-fullname').value = savedFullname;
                    if (savedEmail)
                        document.getElementById('reg-email').value = savedEmail;
                }
            };

            function toggleForm() {
                const container = document.querySelector('.form-container');
                container.classList.toggle('slide-left');
            }

            // Kiểm tra form đăng ký trước khi submit
            document.querySelector('form[action="signup"]').onsubmit = function (e) {
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