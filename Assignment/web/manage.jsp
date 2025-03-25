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
        <link rel="stylesheet" href="assets/css/manage.css" />
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

