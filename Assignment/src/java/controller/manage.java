/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dto.CategoryDTO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "manage", urlPatterns = {"/manage"})
public class manage extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        String errorMessage = null;

        try {
            if (action == null) {
                // Hiển thị trang quản lý
                loadManagePage(request, response);
            } else {
                ProductDAO dao = new ProductDAO();
                switch (action) {
                    case "add":
                        errorMessage = handleAddProduct(request, dao);
                        break;
                    case "edit":
                        errorMessage = handleEditProduct(request, dao);
                        break;
                    case "delete":
                        errorMessage = handleDeleteProduct(request, dao);
                        break;
                    case "search":
                        handleSearch(request, response);
                        return; // Kết thúc xử lý ở đây vì đã forward trong handleSearch
                }

                if (errorMessage != null) {
                    // Nếu có lỗi, set attribute và load lại trang với thông báo lỗi
                    request.setAttribute("errorMessage", errorMessage);
                    loadManagePage(request, response);
                } else {
                    // Nếu thành công, redirect về trang manage
                    response.sendRedirect("manage");
                }
            }
        } catch (Exception e) {
            log("Error at ManageController: " + e.toString());
            request.setAttribute("errorMessage", "Đã xảy ra lỗi hệ thống!");
            loadManagePage(request, response);
        }
    }

    private String handleAddProduct(HttpServletRequest request, ProductDAO dao) {
        try {
            // Validate các trường input
            String name = request.getParameter("name");
            if (name == null || name.trim().isEmpty()) {
                return "Tên sản phẩm không được để trống!";
            }

            String categoryStr = request.getParameter("category");
            if (categoryStr == null || categoryStr.trim().isEmpty()) {
                return "Vui lòng chọn danh mục!";
            }

            String priceStr = request.getParameter("price");
            if (priceStr == null || priceStr.trim().isEmpty()) {
                return "Giá không được để trống!";
            }

            String quantityStr = request.getParameter("quantity");
            if (quantityStr == null || quantityStr.trim().isEmpty()) {
                return "Số lượng không được để trống!";
            }

            String image = request.getParameter("image");
            if (image == null || image.trim().isEmpty()) {
                return "URL hình ảnh không được để trống!";
            }

            // Parse và validate giá trị
            try {
                int category = Integer.parseInt(categoryStr);
                double price = Double.parseDouble(priceStr);
                int quantity = Integer.parseInt(quantityStr);

                if (price < 0) {
                    return "Giá không được âm!";
                }
                if (quantity < 0) {
                    return "Số lượng không được âm!";
                }

                // Tạo đối tượng ProductDTO
                ProductDTO newProduct = new ProductDTO();
                newProduct.setCategory_id(category);
                newProduct.setName(name.trim());
                newProduct.setPrice(price);
                newProduct.setQuantity(quantity);
                newProduct.setDescription(request.getParameter("description"));
                newProduct.setImage_url(image.trim());

                // Thêm sản phẩm
                boolean success = dao.create(newProduct);
                if (!success) {
                    return "Không thể thêm sản phẩm!";
                }

            } catch (NumberFormatException e) {
                return "Giá trị không hợp lệ cho giá hoặc số lượng!";
            }

        } catch (Exception e) {
            log("Error at ManageController-Add: " + e.toString());
            return "Lỗi khi thêm sản phẩm: " + e.getMessage();
        }
        return null; // null means no error
    }

    private String handleEditProduct(HttpServletRequest request, ProductDAO dao) {
        try {
            // Validate ID
            String idStr = request.getParameter("id");
            if (idStr == null || idStr.trim().isEmpty()) {
                return "ID sản phẩm không hợp lệ!";
            }

            // Validate các trường khác
            String name = request.getParameter("name");
            if (name == null || name.trim().isEmpty()) {
                return "Tên sản phẩm không được để trống!";
            }

            String categoryStr = request.getParameter("category");
            if (categoryStr == null || categoryStr.trim().isEmpty()) {
                return "Vui lòng chọn danh mục!";
            }

            String priceStr = request.getParameter("price");
            if (priceStr == null || priceStr.trim().isEmpty()) {
                return "Giá không được để trống!";
            }

            String quantityStr = request.getParameter("quantity");
            if (quantityStr == null || quantityStr.trim().isEmpty()) {
                return "Số lượng không được để trống!";
            }

            String image = request.getParameter("image");
            if (image == null || image.trim().isEmpty()) {
                return "URL hình ảnh không được để trống!";
            }

            try {
                int id = Integer.parseInt(idStr);
                int category = Integer.parseInt(categoryStr);
                double price = Double.parseDouble(priceStr);
                int quantity = Integer.parseInt(quantityStr);

                if (price < 0) {
                    return "Giá không được âm!";
                }
                if (quantity < 0) {
                    return "Số lượng không được âm!";
                }

                // Kiểm tra sản phẩm tồn tại
                ProductDTO existingProduct = dao.getProductByPID(String.valueOf(id));
                if (existingProduct == null) {
                    return "Không tìm thấy sản phẩm cần cập nhật!";
                }

                // Tạo đối tượng ProductDTO với thông tin cập nhật
                ProductDTO updatedProduct = new ProductDTO();
                updatedProduct.setProduct_id(id);
                updatedProduct.setCategory_id(category);
                updatedProduct.setName(name.trim());
                updatedProduct.setPrice(price);
                updatedProduct.setQuantity(quantity);
                updatedProduct.setDescription(request.getParameter("description"));
                updatedProduct.setImage_url(image.trim());

                // Cập nhật sản phẩm
                boolean success = dao.update(updatedProduct);
                if (!success) {
                    return "Không thể cập nhật sản phẩm!";
                }

            } catch (NumberFormatException e) {
                return "Giá trị không hợp lệ cho ID, giá hoặc số lượng!";
            }

        } catch (Exception e) {
            log("Error at ManageController-Edit: " + e.toString());
            return "Lỗi khi cập nhật sản phẩm: " + e.getMessage();
        }
        return null; // null means no error
    }

    private String handleDeleteProduct(HttpServletRequest request, ProductDAO dao) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean success = dao.delete(String.valueOf(id));
            if (!success) {
                return "Không thể vô hiệu hóa sản phẩm!";
            }
        } catch (NumberFormatException e) {
            return "ID sản phẩm không hợp lệ!";
        } catch (Exception e) {
            log("Error at ManageController-Delete: " + e.toString());
            return "Lỗi khi vô hiệu hóa sản phẩm: " + e.getMessage();
        }
        return null;
    }

    private void loadManagePage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ProductDAO product = new ProductDAO();
            int page = 1;
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
            }

            final int PRODUCTS_PER_PAGE = 12;
            int totalProducts = product.getTotalProductsForManage();
            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);

            List<ProductDTO> list = product.getProductsForManageWithPaging(page, PRODUCTS_PER_PAGE);

            List<CategoryDTO> listC = product.readCategory();
            request.setAttribute("listP", list);
            request.setAttribute("listC", listC);
            request.setAttribute("currentPage", page);
            request.setAttribute("totalPages", totalPages);
            request.getRequestDispatcher("manage.jsp").forward(request, response);
        } catch (Exception e) {
            log("Error loading manage page: " + e.toString());
            throw e;
        }
    }

    private void handleSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String txtSearch = request.getParameter("txtSearch");
            ProductDAO productDAO = new ProductDAO();

            if (txtSearch != null && !txtSearch.trim().isEmpty()) {
                // Thực hiện tìm kiếm
                List<ProductDTO> list = productDAO.searchByName(txtSearch.trim());
                List<CategoryDTO> listC = productDAO.readCategory();

                // Set các attribute
                request.setAttribute("listP", list);
                request.setAttribute("listC", listC);
                request.setAttribute("txtSearch", txtSearch); // Giữ lại giá trị tìm kiếm
            } else {
                // Nếu không có từ khóa, load tất cả sản phẩm
                List<ProductDTO> list = productDAO.readAll();
                List<CategoryDTO> listC = productDAO.readCategory();

                request.setAttribute("listP", list);
                request.setAttribute("listC", listC);
            }

            // Forward về trang manage.jsp
            request.getRequestDispatcher("manage.jsp").forward(request, response);

        } catch (Exception e) {
            log("Error at Search: " + e.toString());
            request.setAttribute("errorMessage", "Lỗi khi tìm kiếm!");
            loadManagePage(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
