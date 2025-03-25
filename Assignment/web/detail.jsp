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
        <link rel="stylesheet" href="assets/css/detail.css" />
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
                            <div class="product-price">${detail.price}đ</div>
                            <p class="product-description">${detail.description}</p>

                            <!-- Form thêm vào giỏ đơn giản -->
                            <form action="cart" method="POST">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="pid" value="${detail.product_id}">
                                <input type="hidden" name="source" value="detail">
                                <div class="quantity-selector">
                                    <button type="button" class="quantity-btn" onclick="decreaseQuantity()">-</button>
                                    <input type="number" name="quantity" id="quantity" class="quantity-input" value="1" min="1">
                                    <button type="button" class="quantity-btn" onclick="increaseQuantity()">+</button>
                                </div>
                                <button type="submit" class="add-to-cart-btn">
                                    <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng
                                </button>
                            </form>

                            <!-- Product Meta -->
                            <div class="product-meta">

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


        <jsp:include page="footer.jsp" />

        <!-- JavaScript -->
        <script>
            function increaseQuantity() {
                var input = document.getElementById('quantity');
                var newValue = parseInt(input.value) + 1;
                input.value = newValue;
            }

            function decreaseQuantity() {
                var input = document.getElementById('quantity');
                if (parseInt(input.value) > 1) {
                    var newValue = parseInt(input.value) - 1;
                    input.value = newValue;
                }
            }

            // Cập nhật giá trị form khi người dùng nhập trực tiếp
            document.getElementById('quantity').addEventListener('change', function () {
                var value = parseInt(this.value);
                if (value < 1) {
                    value = 1;
                    this.value = 1;
                }
            });
        </script>
    </body>
</html>