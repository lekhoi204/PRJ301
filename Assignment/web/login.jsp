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
        <title>JSP Page</title>
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
        </style>
    </head>
    <body>
      <jsp:include page="header.jsp" />

 <div class="login-container">
            <div class="login-form">
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
                    
                    <%
                        String message = request.getAttribute("message")+"";
                        if(!message.equals("null")) {
                    %>
                    <div class="error-message">
                        <%=message%>
                    </div>
                    <%
                        }
                    %>
                </form>
            </div>
        </div>
<!-- Include footer -->
<jsp:include page="footer.jsp" />
    </body>
</html>
