<%-- 
    Document   : checkout
    Created on : Mar 21, 2025, 1:51:15 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
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
            
            .checkout-header {
                margin-bottom: 30px;
                border-bottom: 2px solid #e9ecef;
                padding-bottom: 15px;
            }
            
            .order-summary {
                background: #f8f9fa;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 30px;
            }
            
            .product-table {
                background: white;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                overflow: hidden;
                margin-bottom: 20px;
            }
            
            .product-table th {
                background: #f8f9fa;
                border: none;
            }
            
            .total-amount {
                font-size: 1.5em;
                color: #28a745;
                font-weight: bold;
                text-align: right;
                padding: 10px 20px;
            }
            
            .checkout-form {
                background: white;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                padding: 25px;
            }
            
            .form-label {
                font-weight: 500;
                color: #2c3e50;
            }
            
            .form-control {
                border-radius: 8px;
                border: 1px solid #ced4da;
                padding: 10px 15px;
            }
            
            .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }
            
            .submit-btn {
                background: linear-gradient(45deg, #2980b9, #3498db);
                border: none;
                color: white;
                padding: 12px 25px;
                border-radius: 8px;
                font-weight: 600;
                text-transform: uppercase;
                letter-spacing: 1px;
                transition: all 0.3s;
            }
            
            .submit-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
            }
            
            .back-link {
                color: #6c757d;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                margin-top: 20px;
            }
            
            .back-link:hover {
                color: #343a40;
            }
            
            .error-alert {
                background-color: #f8d7da;
                border-color: #f5c6cb;
                color: #721c24;
                padding: 12px;
                border-radius: 8px;
                margin-bottom: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="checkout-header">
                <h2><i class="fas fa-shopping-cart me-2"></i>Xác nhận đơn hàng</h2>
            </div>

            <c:if test="${not empty ERROR}">
                <div class="error-alert">
                    <i class="fas fa-exclamation-circle me-2"></i>${ERROR}
                </div>
            </c:if>

            <div class="row">
                <div class="col-md-8">
                    <div class="checkout-form">
                        <h4 class="mb-4">Thông tin giao hàng</h4>
                        <form action="checkout" method="POST">
                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-phone me-2"></i>Số điện thoại:
                                </label>
                                <input type="tel" name="phone" class="form-control" required 
                                       pattern="[0-9]{10}" 
                                       title="Vui lòng nhập số điện thoại 10 số"
                                       placeholder="Nhập số điện thoại của bạn">
                            </div>

                            <div class="mb-3">
                                <label class="form-label">
                                    <i class="fas fa-map-marker-alt me-2"></i>Địa chỉ giao hàng:
                                </label>
                                <textarea name="address" class="form-control" required rows="3"
                                          placeholder="Nhập địa chỉ giao hàng chi tiết"></textarea>
                            </div>

                            <div class="mb-4">
                                <label class="form-label">
                                    <i class="fas fa-sticky-note me-2"></i>Ghi chú:
                                </label>
                                <textarea name="note" class="form-control" rows="3"
                                          placeholder="Ghi chú thêm về đơn hàng (không bắt buộc)"></textarea>
                            </div>

                            <button type="submit" class="submit-btn">
                                <i class="fas fa-check me-2"></i>Xác nhận đặt hàng
                            </button>
                        </form>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="order-summary">
                        <h4 class="mb-4">Đơn hàng của bạn</h4>
                        <div class="product-table">
                            <table class="table table-hover mb-0">
                                <thead>
                                    <tr>
                                        <th>Sản phẩm</th>
                                        <th>Số lượng</th>
                                        <th class="text-end">Thành tiền</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.cart}" var="item">
                                        <tr>
                                            <td>${item.value.name}</td>
                                            <td>${item.value.quantity}</td>
                                            <td class="text-end">${item.value.price * item.value.quantity}đ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                         <c:set var="total" value="0"/>
                                    <c:forEach items="${cart.values()}" var="item">
                                        <c:set var="total" value="${total + (item.price * item.quantity)}"/>
                                    </c:forEach>
                        <div class="total-amount">
                            Tổng tiền: ${total}vnđ
                        </div>
                    </div>
                </div>
            </div>

            <a href="cart" class="back-link">
                <i class="fas fa-arrow-left me-2"></i>Quay lại giỏ hàng
            </a>
        </div>
    </body>
</html>
