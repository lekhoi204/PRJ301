<%-- 
    Document   : oder
    Created on : Mar 21, 2025, 2:15:57 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn hàng của tôi</title>
        <jsp:include page="header.jsp"/>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .container {
                margin-top: 80px;
                padding: 20px;
            }
            
            .order-header {
                margin-bottom: 30px;
                border-bottom: 2px solid #e9ecef;
                padding-bottom: 15px;
            }
            
            .order-card {
                background: #fff;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
                transition: transform 0.2s;
            }
            
            .order-card:hover {
                transform: translateY(-5px);
            }
            
            .order-card .card-header {
                background: #f8f9fa;
                padding: 15px;
                border-radius: 10px 10px 0 0;
                border-bottom: 1px solid #e9ecef;
            }
            
            .order-id {
                color: #007bff;
                font-weight: bold;
            }
            
            .order-date {
                color: #6c757d;
                font-size: 0.9em;
            }
            
            .order-status {
                padding: 5px 10px;
                border-radius: 15px;
                font-size: 0.85em;
                font-weight: 500;
            }
            
            .status-pending {
                background: #fff3cd;
                color: #856404;
            }
            
            .status-completed {
                background: #d4edda;
                color: #155724;
            }
            
            .order-total {
                font-size: 1.1em;
                font-weight: bold;
                color: #28a745;
            }
            
            .detail-btn {
                background: #007bff;
                color: white;
                padding: 8px 15px;
                border-radius: 5px;
                text-decoration: none;
                transition: background 0.3s;
            }
            
            .detail-btn:hover {
                background: #0056b3;
                color: white;
            }
            
            .back-btn {
                margin-top: 20px;
                display: inline-block;
            }
        </style>
    </head>
    <body>
        <c:if test="${not empty sessionScope.user}">
        <div class="container">
            <div class="order-header">
                <h2><i class="fas fa-shopping-bag me-2"></i>Đơn hàng của tôi</h2>
            </div>

            <c:if test="${empty orderList}">
                <div class="alert alert-info" role="alert">
                    <i class="fas fa-info-circle me-2"></i>Bạn chưa có đơn hàng nào.
                </div>
            </c:if>

            <c:forEach items="${orderList}" var="order">
                <div class="order-card">
                    <div class="card-header d-flex justify-content-between align-items-center">
                        <div>
                            <span class="order-id">#${order.order_id}</span>
                            <span class="order-date ms-3">
                                <i class="far fa-calendar-alt me-1"></i>${order.order_date}
                            </span>
                        </div>
                        <span class="order-status ${order.status == 'Đã đặt hàng' ? 'status-pending' : 'status-completed'}">
                            ${order.status}
                        </span>
                    </div>
                    <div class="card-body">
                        <div class="row align-items-center">
                            <div class="col-md-4">
                                <p><i class="fas fa-map-marker-alt me-2"></i>${order.address}</p>
                            </div>
                            <div class="col-md-4">
                                <p class="order-total">
                                    <i class="fas fa-money-bill-wave me-2"></i>${order.total_amount}đ
                                </p>
                            </div>
                            <div class="col-md-4 text-end">
                                <a href="orderDetail?orderId=${order.order_id}" class="detail-btn">
                                    <i class="fas fa-eye me-1"></i>Xem chi tiết
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <a href="MainController" class="btn btn-primary back-btn">
                <i class="fas fa-arrow-left me-2"></i>Quay lại trang chủ
            </a>
            </c:if>
        </div>
    </body>
</html>
