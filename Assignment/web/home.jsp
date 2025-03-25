<%-- 
    Document   : home
    Created on : Mar 1, 2025, 8:14:26 PM
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
        <link rel="stylesheet" href="assets/css/home.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <!-- Banner -->
        <div class="banner">
            <div class="container">
                <h1>Chào mừng đến với Figure Store</h1>
                <p>Khám phá bộ sưu tập mô hình độc đáo của chúng tôi</p>
                <!-- Thêm search box -->
                <div class="search-box">
                    <form action="search" method="POST" class="search-form">
                        <input value="${txtS}" type="text" name="txt" placeholder="Tìm kiếm mô hình..." class="search-input">
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i> Tìm kiếm
                        </button>
                    </form>
                </div>
            </div>
        </div>

        <!-- Category List -->
        <div class="container">
            <div class="category-list">
                <ul>

                    <li><a href="MainController" class="${empty tag ? 'active' : ''}">Tất cả</a></li>
                        <c:forEach items="${listC}" var="o">

                        <li><a href="category?category_id=${o.category_id}" 
                               class="${tag == o.category_id ? 'active' : ''}">${o.name}</a></li>
                        </c:forEach>
                </ul>
            </div>
        </div>

        <!-- Products Section -->
        <div class="container my-5">
            <h2 class="text-center mb-4">Sản phẩm nổi bật</h2>
            <div class="row">
                <!-- Product Card 1 -->
                <c:forEach items="${listP}" var ="o">
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <img src="${o.image_url}" 
                                 class="card-img-top" alt="${o.name}">
                            <div class="card-body">
                                <h5 class="card-title"><a href="detail?pid=${o.product_id}">${o.name}</a></h5>
                                <p class="card-text">${o.price}$</p>
                                <form action="cart" method="POST">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="pid" value="${o.product_id}">
                                    <input type="hidden" name="source" value="main">
                                    <input type="hidden" name="quantity" value="1">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fas fa-shopping-cart"></i> Thêm vào giỏ
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

            </div>
        </div>

        <!-- Thêm sau phần hiển thị sản phẩm -->
        <div class="container">
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                        <a class="page-link" href="MainController?page=${currentPage - 1}" tabindex="-1">Trước</a>
                    </li>
                    
                    <c:forEach begin="1" end="${totalPages}" var="i">
                        <li class="page-item ${currentPage == i ? 'active' : ''}">
                            <a class="page-link" href="MainController?page=${i}">${i}</a>
                        </li>
                    </c:forEach>
                    
                    <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="MainController?page=${currentPage + 1}">Sau</a>
                    </li>
                </ul>
            </nav>
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>
