/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import javax.servlet.http.HttpSession;
import dto.ProductDTO;
import dto.UserDTO;
import dto.OrderDTO;
import dao.OrderDAO;
import dto.OrderDetailDTO;
import java.util.Map;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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

        HttpSession session = request.getSession();
        HashMap<Integer, ProductDTO> cart = (HashMap<Integer, ProductDTO>) session.getAttribute("cart");
        UserDTO user = (UserDTO) session.getAttribute("user");

        try {
            if (cart == null || cart.isEmpty()) {
                request.setAttribute("ERROR", "Giỏ hàng trống!");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                return;
            }

            if (user == null) {
                response.sendRedirect("login");
                return;
            }

            if ("POST".equals(request.getMethod())) {
                // Lấy thông tin từ form
                String phone = request.getParameter("phone");
                String address = request.getParameter("address");
                String note = request.getParameter("note");

                // Validate phone number
                if (phone == null || !phone.matches("[0-9]{10}")) {
                    request.setAttribute("ERROR", "Số điện thoại không hợp lệ!");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                    return;
                }

                // Validate address
                if (address == null || address.trim().isEmpty()) {
                    request.setAttribute("ERROR", "Vui lòng nhập địa chỉ giao hàng!");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                    return;
                }

                double totalAmount = 0;
                for (ProductDTO item : cart.values()) {
                    totalAmount += item.getPrice() * item.getQuantity();
                }

                OrderDTO order = new OrderDTO();
                order.setUser_id(user.getUser_id());
                order.setTotal_amount(totalAmount);
                order.setAddress(address);
                order.setPhone(phone);
                order.setNote(note != null ? note : "");

                OrderDAO orderDAO = new OrderDAO();
                int orderId = orderDAO.createOrder(order);

                if (orderId > 0) {
                    // Lưu chi tiết đơn hàng
                    for (Map.Entry<Integer, ProductDTO> entry : cart.entrySet()) {
                        ProductDTO product = entry.getValue();

                        OrderDetailDTO detail = new OrderDetailDTO();
                        detail.setOrder_id(orderId);
                        detail.setProduct_id(product.getProduct_id());
                        detail.setQuantity(product.getQuantity());
                        detail.setPrice(product.getPrice());

                        orderDAO.addOrderDetail(detail);
                    }

                    // Xóa giỏ hàng
                    session.removeAttribute("cart");
                    session.removeAttribute("total");

                    request.setAttribute("SUCCESS", "Đặt hàng thành công!");
                    response.sendRedirect("cart.jsp");
                } else {
                    request.setAttribute("ERROR", "Đặt hàng thất bại!");
                    request.getRequestDispatcher("checkout.jsp").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("checkout.jsp").forward(request, response);
            }

        } catch (Exception e) {
            log("Error at CheckoutServlet: " + e.toString());
            request.setAttribute("ERROR", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("checkout.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
