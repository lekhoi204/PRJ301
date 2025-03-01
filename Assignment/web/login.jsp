<%-- 
    Document   : login
    Created on : Mar 1, 2025, 8:14:19 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            /* Login styles */
.login-container {
    padding: 80px 0;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    min-height: calc(100vh - 200px);
}

.login-wrap {
    background: #fff;
    border-radius: 10px;
    padding: 40px;
    box-shadow: 0 15px 30px 0 rgba(0, 0, 0, 0.1);
}

.icon {
    width: 80px;
    height: 80px;
    background: #3b5d50;
    border-radius: 50%;
    font-size: 30px;
    margin: 0 auto 30px auto;
    color: #fff;
}

.login-wrap h3 {
    color: #333;
    font-weight: 600;
}

.form-control {
    height: 48px;
    background: #f8f9fa;
    border: 1px solid #e6e6e6;
    border-radius: 4px;
    padding-left: 15px;
    padding-right: 15px;
}

.form-control:focus {
    box-shadow: none;
    border-color: #3b5d50;
}

.field-icon {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #666;
}

.forgot-password {
    color: #3b5d50;
    text-decoration: none;
    font-size: 14px;
}

.forgot-password:hover {
    color: #2c4b3f;
    text-decoration: underline;
}

.btn-primary {
    background: #3b5d50;
    border: none;
    height: 48px;
    border-radius: 4px;
    font-weight: 600;
}

.btn-primary:hover {
    background: #2c4b3f;
}

.social-login p {
    color: #666;
    font-size: 14px;
}

.social-icons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 15px;
}

.social-icons a {
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    color: #fff;
    text-decoration: none;
    transition: all 0.3s ease;
}

.social-icons .facebook {
    background: #3b5998;
}

.social-icons .google {
    background: #dd4b39;
}

.social-icons a:hover {
    transform: translateY(-3px);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .login-wrap {
        padding: 20px;
        margin: 15px;
    }
    
    .icon {
        width: 60px;
        height: 60px;
        font-size: 24px;
    }
}
        </style>
    </head>
    <body>
      <jsp:include page="header.jsp" />

<div class="login-container">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-wrap">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <i class="fas fa-user"></i>
                    </div>
                    <h3 class="text-center mb-4">Đăng nhập</h3>
                    
                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger" role="alert">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>
                    
                    <form action="login" method="POST" class="login-form">
                        <div class="form-group mb-3">
                            <input type="text" 
                                   class="form-control" 
                                   name="username" 
                                   placeholder="Tên đăng nhập" 
                                   required>
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" 
                                   class="form-control" 
                                   name="password" 
                                   placeholder="Mật khẩu" 
                                   required>
                            <span toggle="#password-field" 
                                  class="fa fa-fw fa-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group d-flex justify-content-between align-items-center mb-3">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" name="remember"> Ghi nhớ đăng nhập
                                </label>
                            </div>
                            <div>
                                <a href="forgot-password.jsp" class="forgot-password">Quên mật khẩu?</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" 
                                    class="btn btn-primary w-100">
                                    Đăng nhập
                            </button>
                        </div>
                    </form>
                    <div class="text-center mt-4">
                        <p>Chưa có tài khoản? 
                            <a href="register.jsp">Đăng ký ngay</a>
                        </p>
                    </div>
                    
                    <div class="social-login text-center mt-4">
                        <p>Hoặc đăng nhập với:</p>
                        <div class="social-icons">
                            <a href="#" class="facebook">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="google">
                                <i class="fab fa-google"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Include footer -->
<jsp:include page="footer.jsp" />
    </body>
</html>
