<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${product.name} - Chi tiết sản phẩm</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .product-detail {
            padding: 50px 0;
        }

        .product-image {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .product-image img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }

        .product-image:hover img {
            transform: scale(1.05);
        }

        .product-info {
            padding: 20px;
        }

        .product-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            color: #2c3e50;
        }

        .product-price {
            font-size: 1.8rem;
            color: #2ecc71;
            font-weight: 600;
            margin-bottom: 20px;
            padding: 10px 20px;
            background: rgba(46, 204, 113, 0.1);
            border-radius: 10px;
            display: inline-block;
        }

        .product-description {
            font-size: 1.1rem;
            line-height: 1.8;
            color: #666;
            margin-bottom: 30px;
        }

        .quantity-selector {
            display: flex;
            align-items: center;
            margin-bottom: 30px;
        }

        .quantity-btn {
            width: 40px;
            height: 40px;
            border: none;
            background: #f8f9fa;
            border-radius: 8px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .quantity-btn:hover {
            background: #e9ecef;
        }

        .quantity-input {
            width: 60px;
            height: 40px;
            text-align: center;
            margin: 0 10px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
        }

        .add-to-cart-btn {
            width: 100%;
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            border: none;
            border-radius: 10px;
            background: linear-gradient(45deg, #2980b9, #3498db);
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .add-to-cart-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.3);
        }

        .product-meta {
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid #eee;
        }

        .product-meta-item {
            margin-bottom: 10px;
            color: #666;
        }

        .product-meta-item i {
            width: 20px;
            color: #3498db;
        }

        /* Related Products */
        .related-products {
            padding: 50px 0;
            background: #f8f9fa;
        }

        .related-products h3 {
            font-size: 1.8rem;
            margin-bottom: 30px;
            text-align: center;
            color: #2c3e50;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .product-info {
                padding: 20px 0;
            }

            .product-title {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <!-- Product Detail Section -->
    <section class="product-detail">
        <div class="container">
            <div class="row">
                <!-- Product Image -->
                <div class="col-md-6">
                    <div class="product-image">
                        <img src="${detail.image_url}" alt="${detail.name}">
                    </div>
                </div>

                <!-- Product Info -->
                <div class="col-md-6">
                    <div class="product-info">
                        <h1 class="product-title">${detail.name}</h1>
                        <div class="product-price">$${detail.price}</div>
                        <p class="product-description">${detail.description}</p>

                        <!-- Quantity Selector -->
                        <div class="quantity-selector">
                            <button class="quantity-btn" onclick="decreaseQuantity()">-</button>
                            <input type="number" class="quantity-input" value="1" min="1" id="quantity">
                            <button class="quantity-btn" onclick="increaseQuantity()">+</button>
                        </div>

                        <!-- Add to Cart Button -->
                        <button class="add-to-cart-btn">
                            <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                        </button>

                        <!-- Product Meta -->
                        <div class="product-meta">
                            <div class="product-meta-item">
                                <i class="fas fa-box"></i> Danh mục: ${category.name}
                            </div>
                            <div class="product-meta-item">
                                <i class="fas fa-shield-alt"></i> Bảo hành chính hãng
                            </div>
                            <div class="product-meta-item">
                                <i class="fas fa-truck"></i> Giao hàng toàn quốc
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Related Products -->
    <section class="related-products">
        <div class="container">
            <h3>Sản phẩm liên quan</h3>
            <div class="row">
                <c:forEach items="${relatedProducts}" var="item">
                    <div class="col-md-3 mb-4">
                        <div class="card">
                            <img src="${item.image_url}" class="card-img-top" alt="${item.name}">
                            <div class="card-body">
                                <h5 class="card-title">${item.name}</h5>
                                <p class="card-text">$${item.price}</p>
                                <a href="product?id=${item.product_id}" class="btn btn-primary">Xem chi tiết</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </section>

    <jsp:include page="footer.jsp" />

    <!-- JavaScript -->
    <script>
        function increaseQuantity() {
            var input = document.getElementById('quantity');
            input.value = parseInt(input.value) + 1;
        }

        function decreaseQuantity() {
            var input = document.getElementById('quantity');
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
            }
        }
    </script>
</body>
</html>