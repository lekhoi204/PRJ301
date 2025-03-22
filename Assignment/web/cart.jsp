<%-- 
    Document   : cart
    Created on : Mar 19, 2025, 5:43:51 PM
    Author     : ADMIND
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="header.jsp" %>

        <div class="container mt-4">
            <h2>Giỏ hàng</h2>

            <c:if test="${not empty ERROR}">
                <div class="alert alert-danger">${ERROR}</div>
            </c:if>

            <c:if test="${not empty SUCCESS}">
                <div class="alert alert-success">${SUCCESS}</div>
            </c:if>

            <c:if test="${empty cart}">
                <div class="alert alert-info">
                    Giỏ hàng trống! <a href="MainController">Tiếp tục mua sắm</a>
                </div>
            </c:if>

            <c:if test="${not empty cart}">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Tổng</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${cart.values()}" var="item">
                            <tr>
                                <td>
                                    <img src="${item.image_url}" style="width: 50px; height: 50px; object-fit: cover;">
                                    ${item.name}
                                </td>
                                <td><fmt:formatNumber value="${item.price}" type="currency"/></td>
                                <td>
                                    <form action="cart" method="post" style="display: inline;">
                                        <input type="hidden" name="action" value="update">
                                        <input type="hidden" name="productId" value="${item.product_id}">
                                        <input type="number" name="quantity" value="${item.quantity}" 
                                               min="1" style="width: 60px;" onchange="this.form.submit()">
                                    </form>
                                </td>
                                <td><fmt:formatNumber value="${item.price * item.quantity}" type="currency"/></td>
                                <td>
                                    <form action="cart" method="post" style="display: inline;">
                                        <input type="hidden" name="action" value="remove">
                                        <input type="hidden" name="productId" value="${item.product_id}">
                                        <button type="submit" class="btn btn-danger btn-sm">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="3" class="text-end"><strong>Tổng cộng:</strong></td>
                            <td colspan="2">
                                <strong>
                                    <c:set var="total" value="0"/>
                                    <c:forEach items="${cart.values()}" var="item">
                                        <c:set var="total" value="${total + (item.price * item.quantity)}"/>
                                    </c:forEach>

                                    <fmt:formatNumber value="${total}" type="currency"/>
                                </strong>
                            </td>
                        </tr>
                    </tfoot>
                </table>

                <div class="text-end mt-3">
                    <a href="MainController" class="btn btn-secondary">Tiếp tục mua sắm</a>
                     
                </div>
            </c:if>

            <div>
                <a href="checkout" class="btn btn-primary">Tiến hành đặt hàng</a>
            </div>

          
        </div>

        <%@include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
