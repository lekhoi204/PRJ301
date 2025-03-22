<%-- 
    Document   : header
    Created on : Mar 1, 2025, 8:19:31 PM
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
            .header {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 1000;
                background-color: white;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                transition: all 0.3s ease;
            }

            .navbar {
                padding: 0.5rem 1rem;
            }

            .navbar-nav {
                align-items: center;
            }

            .user-section {
                display: flex;
                align-items: center;
                margin-left: 20px;
                color: white;
            }

            .welcome-text {
                margin-right: 15px;
                color: rgba(255, 255, 255, 0.85);
            }

            .user-name {
                font-weight: bold;
                color: white;
            }

            .logout-btn {
                background-color: #e74c3c;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 0.4rem 0.8rem;
                font-size: 0.85rem;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            .logout-btn:hover {
                background-color: #c0392b;
            }

            /* Điều chỉnh layout cho navbar */
            .navbar > .container {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            /* Điều chỉnh cho responsive */
            @media (max-width: 991.98px) {
                .user-section {
                    margin: 10px 0;
                    justify-content: center;
                }

                .navbar-collapse {
                    text-align: center;
                }
            }
        </style>
    </head>
    <body>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="MainController">Figure Store</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="MainController">Trang chủ</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="cart.jsp">Giỏ hàng</a>
                        </li>
                        
                        <!-- Chỉ hiển thị link Đơn Hàng khi đã đăng nhập -->
                        <c:if test="${not empty sessionScope.user}">
                            <li class="nav-item">
                                <a class="nav-link" href="order">Đơn Hàng</a>
                            </li>
                        </c:if>
                        
                        <!-- Chỉ hiển thị Quản Lý cho admin -->
                        <c:if test="${sessionScope.user.role eq 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="manage">Quản Lý</a>
                            </li>
                        </c:if>
                        
                        <c:choose>
                            <c:when test="${empty sessionScope.user}">
                                <li class="nav-item">
                                    <a class="nav-link" href="login.jsp">Đăng nhập</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="nav-item">
                                    <span class="welcome-text">Xin chào, <span class="user-name">${sessionScope.user.fullname}</span>!</span>
                                </li>
                                <li class="nav-item">
                                    <form action="login" method="post" style="margin: 0;">
                                        <input type="hidden" name="action" value="logout"/>
                                        <input type="submit" value="Đăng xuất" class="logout-btn"/>
                                    </form>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
