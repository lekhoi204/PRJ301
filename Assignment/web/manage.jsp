<%-- 
    Document   : manage
    Created on : Mar 19, 2025, 1:58:22 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý sản phẩm</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <style>
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                min-width: 1000px;
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #299be4;
                color: #fff;
                padding: 16px 30px;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn {
                color: #566787;
                float: right;
                font-size: 13px;
                background: #fff;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn:hover {
                color: #2196F3;
                background: #f2f2f2;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            .product-image {
                width: 100px;
                height: 100px;
                object-fit: cover;
                border-radius: 5px;
            }
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
            .search-form .input-group {
                width: 100%;
            }

            .search-form .form-control {
                border-radius: 4px 0 0 4px;
                border-right: none;
                box-shadow: none;
            }

            .search-form .form-control:focus {
                border-color: #80bdff;
                box-shadow: 0 0 0 0.2rem rgba(0,123,255,.25);
            }

            .search-btn {
                border-radius: 0 4px 4px 0;
                padding: 8px 20px;
                font-weight: 500;
                background-color: #007bff;
                border-color: #007bff;
                color: white;
            }

            .search-btn:hover {
                background-color: #0056b3;
                border-color: #0056b3;
            }

            /* Hiệu ứng hover cho input */
            .search-form .form-control:hover {
                border-color: #80bdff;
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .search-form {
                    margin: 10px 0;
                }

                .search-btn {
                    padding: 8px 15px;
                }
            }
            .upload-container {
                margin: 15px 0;
            }

            .file-upload-wrapper {
                position: relative;
                margin-bottom: 10px;
            }

            .file-upload-input {
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
            }

            .file-info {
                margin: 10px 0;
                color: #666;
            }

            .progress-bar-container {
                margin: 10px 0;
            }

            .image-preview {
                margin-top: 15px;
                max-width: 300px;
            }

            .image-preview img {
                max-width: 100%;
                height: auto;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .preview-container {
                position: relative;
                display: inline-block;
            }

            .remove-image {
                position: absolute;
                top: 5px;
                right: 5px;
                background: rgba(255, 255, 255, 0.9);
                border-radius: 50%;
                padding: 5px;
                cursor: pointer;
                box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>
        <c:if test="${sessionScope.user.role eq 'admin'}">
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row align-items-center">
                                <div class="col-sm-4">
                                    <h2>Quản lý <b>Sản phẩm</b></h2>
                                </div>
                                <div class="col-sm-4">
                                    <form action="manage" method="POST" class="d-flex search-form">
                                        <div class="input-group">
                                            <input type="text" name="txtSearch" class="form-control" 
                                                   placeholder="Nhập tên sản phẩm..." value="${txtSearch}">
                                            <input type="hidden" name="action" value="search">
                                            <button type="submit" class="btn btn-primary search-btn">
                                                Tìm kiếm
                                            </button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-4 text-end">
                                    <a href="#addProductModal" class="btn btn-success" data-bs-toggle="modal">
                                        <i class="bi bi-plus-circle"></i> <span>Thêm sản phẩm</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Hình ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th>Mô tả</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Danh mục</th>
                                    <th>Thao tác</th>
                                </tr>
                            </thead>                       

                            <tbody>
                                <c:forEach items="${listP}" var="o">
                                    <c:set var="stt" value="${stt+1}"/>
                                    <tr>
                                        <td>${stt}</td>
                                        <td>
                                            <img src="${o.image_url}" alt="${o.name}" class="product-image">
                                        </td>
                                        <td>${o.name}</td>
                                        <td>${o.description}</td>
                                        <td>$${o.price}</td>
                                        <td>${o.quantity}</td>
                                        <td>
                                            <c:forEach items="${listC}" var="c">
                                                <c:if test="${c.category_id == o.category_id}">
                                                    ${c.name}
                                                </c:if>
                                            </c:forEach>
                                        </td>
                                        <td>
                                            <a href="#editProductModal" class="edit" data-bs-toggle="modal" 
                                               data-id="${o.product_id}"
                                               data-name="<c:out value="${o.name}"/>"
                                               data-description="<c:out value="${o.description}"/>"
                                               data-price="${o.price}"
                                               data-quantity="${o.quantity}"
                                               data-image="<c:out value="${o.image_url}"/>"
                                               data-category="${o.category_id}">
                                                <i class="fas fa-edit" title="Sửa"></i>
                                            </a>
                                            <a href="#deleteProductModal" class="delete" data-bs-toggle="modal" data-id="${o.product_id}">
                                                <i class="fas fa-trash" title="Xóa"></i>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Add Modal HTML -->
            <div id="addProductModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="manage" method="post">
                            <input type="hidden" name="action" value="add">
                            <div class="modal-header">
                                <h4 class="modal-title">Thêm sản phẩm</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group mb-3">
                                    <label>Danh mục</label>
                                    <select name="category" class="form-select" required>
                                        <c:forEach items="${listC}" var="c">
                                            <option value="${c.category_id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" name="name" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Giá</label>
                                    <input type="number" class="form-control" name="price" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Số lượng</label>
                                    <input type="number" class="form-control" name="quantity" required min="0">
                                </div>
                                <div class="form-group mb-3">
                                    <label>Mô tả</label>
                                    <textarea class="form-control" name="description" rows="3" required></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label>URL Hình ảnh</label>
                                    <input type="text" class="form-control" name="image" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Hủy">
                                <input type="submit" class="btn btn-success" value="Thêm">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Modal HTML -->
            <div id="editProductModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="manage" method="post">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="edit-id">
                            <div class="modal-header">
                                <h4 class="modal-title">Sửa sản phẩm</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group mb-3">
                                    <label>Danh mục</label>
                                    <select name="category" class="form-select" id="edit-category" required>
                                        <c:forEach items="${listC}" var="c">
                                            <option value="${c.category_id}">${c.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" name="name" id="edit-name" required>
                                </div>
                                <div class="form-group mb-3">
                                    <label>Giá</label>
                                    <input type="number" class="form-control" name="price" id="edit-price" required step="0.01">
                                </div>
                                <div class="form-group mb-3">
                                    <label>Số lượng</label>
                                    <input type="number" class="form-control" name="quantity" id="edit-quantity" required min="0">
                                </div>
                                <div class="form-group mb-3">
                                    <label>Mô tả</label>
                                    <textarea class="form-control" name="description" id="edit-description" rows="3" required></textarea>
                                </div>
                                <div class="form-group mb-3">
                                    <label>URL Hình ảnh</label>
                                    <input type="text" class="form-control" name="image" id="edit-image" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-bs-dismiss="modal">Hủy</button>
                                <button type="submit" class="btn btn-info">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Delete Modal HTML -->
            <div id="deleteProductModal" class="modal fade">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="manage" method="post">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" id="delete-id">
                            <div class="modal-header">
                                <h4 class="modal-title">Vô hiệu hóa sản phẩm</h4>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <p>Bạn có chắc chắn muốn vô hiệu hóa sản phẩm này không?</p>
                                <p class="text-warning"><small>Số lượng sản phẩm sẽ được đặt về 0.</small></p>
                            </div>
                            <div class="modal-footer">
                                <input type="button" class="btn btn-default" data-bs-dismiss="modal" value="Hủy">
                                <input type="submit" class="btn btn-danger" value="Vô hiệu hóa">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Thêm sau bảng sản phẩm -->
            <div class="d-flex justify-content-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                            <a class="page-link" href="manage?page=${currentPage - 1}" tabindex="-1">Trước</a>
                        </li>

                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <li class="page-item ${currentPage == i ? 'active' : ''}">
                                <a class="page-link" href="manage?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
                            <a class="page-link" href="manage?page=${currentPage + 1}">Sau</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:if>

        <!-- Bootstrap JS and dependencies -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Hàm để escape HTML characters
            function escapeHtml(unsafe) {
                return unsafe
                        .replace(/&/g, "&amp;")
                        .replace(/</g, "&lt;")
                        .replace(/>/g, "&gt;")
                        .replace(/"/g, "&quot;")
                        .replace(/'/g, "&#039;");
            }

            // Hàm để decode HTML entities
            function decodeHtml(html) {
                var txt = document.createElement("textarea");
                txt.innerHTML = html;
                return txt.value;
            }

            // Xử lý sự kiện click nút Edit
            document.querySelectorAll('.edit').forEach(item => {
                item.addEventListener('click', event => {
                    const button = event.currentTarget;

                    // Lấy dữ liệu từ data attributes và decode
                    const id = button.getAttribute('data-id');
                    const name = decodeHtml(button.getAttribute('data-name'));
                    const description = decodeHtml(button.getAttribute('data-description'));
                    const price = button.getAttribute('data-price');
                    const quantity = button.getAttribute('data-quantity');
                    const image = decodeHtml(button.getAttribute('data-image'));
                    const category = button.getAttribute('data-category');

                    // Set giá trị cho các trường trong form
                    document.getElementById('edit-id').value = id;
                    document.getElementById('edit-name').value = name;
                    document.getElementById('edit-description').value = description;
                    document.getElementById('edit-price').value = price;
                    document.getElementById('edit-quantity').value = quantity;
                    document.getElementById('edit-image').value = image;
                    document.getElementById('edit-category').value = category;
                });
            });

            // Xử lý sự kiện click nút Delete
            document.querySelectorAll('.delete').forEach(item => {
                item.addEventListener('click', event => {
                    const button = event.currentTarget;
                    document.getElementById('delete-id').value = button.getAttribute('data-id');
                });
            });
        </script>
    </body>
</html>

