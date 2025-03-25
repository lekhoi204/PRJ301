<%-- 
    Document   : orderDetail
    Created on : Mar 21, 2025, 2:18:02 AM
    Author     : ADMIND
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết đơn hàng</title>
        <jsp:include page="header.jsp"/>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link rel="stylesheet" href="assets/css/orderDetail.css" />
    </head>
    <body>
        <div class="container">
            <div class="order-detail-header">
                <h2>
                    <i class="fas fa-file-invoice me-2"></i>
                    Chi tiết đơn hàng #${order.order_id}
                </h2>
            </div>

            <div class="order-info">
                <div class="order-info-item">
                    <i class="far fa-calendar-alt"></i>
                    <strong>Ngày đặt:</strong> ${order.order_date}
                </div>
                <div class="order-info-item">
                    <i class="fas fa-info-circle"></i>
                    <strong>Trạng thái:</strong> 
                    <span class="badge ${order.status == 'Đã đặt hàng' ? 'bg-warning' : 'bg-success'}">
                        ${order.status}
                    </span>
                </div>
                <div class="order-info-item">
                    <i class="fas fa-map-marker-alt"></i>
                    <strong>Địa chỉ:</strong> ${order.address}
                </div>
            </div>

            <div class="product-table">
                <table class="table table-hover mb-0">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th class="text-end">Thành tiền</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${orderDetails}" var="detail">
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <img src="${detail.product.image_url}" class="product-img me-3" alt="${detail.product.name}">
                                        <div>
                                            <a href="detail?pid=${detail.product.product_id}" class="product-name">
                                                ${detail.product.name}
                                            </a>
                                        </div>
                                    </div>
                                </td>
                                <td>${detail.price}đ</td>
                                <td>${detail.quantity}</td>
                                <td class="text-end">${detail.price * detail.quantity}đ</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="total-section text-end">
                <span class="total-amount">Tổng tiền: ${order.total_amount}đ</span>
            </div>

            <div class="mt-4">
                <a href="order" class="btn btn-primary">
                    <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách đơn hàng
                </a>
            </div>
        </div>
    </body>
</html>
