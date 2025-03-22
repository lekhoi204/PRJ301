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
import javax.servlet.http.HttpSession;
import java.util.List;
import dto.UserDTO;
import dao.OrderDAO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dao.ProductDAO;
import dto.ProductDTO;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "orderDetail", urlPatterns = {"/orderDetail"})
public class orderDetail extends HttpServlet {

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

        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("user");

            if (user == null) {
                response.sendRedirect("login");
                return;
            }

            String orderIdStr = request.getParameter("orderId");
            System.out.println("OrderID received: " + orderIdStr); // Debug log

            if (orderIdStr == null || orderIdStr.trim().isEmpty()) {
                System.out.println("OrderID is null or empty"); // Debug log
                response.sendRedirect("order");
                return;
            }

            int orderId = Integer.parseInt(orderIdStr);
            OrderDAO orderDAO = new OrderDAO();
            ProductDAO productDAO = new ProductDAO();

            // Lấy thông tin đơn hàng
            OrderDTO order = orderDAO.getOrderById(orderId);
            System.out.println("Order found: " + (order != null)); // Debug log

            if (order == null || order.getUser_id() != user.getUser_id()) {
                System.out.println("Order not found or not belonging to user"); // Debug log
                response.sendRedirect("order");
                return;
            }

            // Lấy chi tiết đơn hàng và thông tin sản phẩm
            List<OrderDetailDTO> details = orderDAO.getOrderDetails(orderId);
            System.out.println("Number of order details: " + details.size()); // Debug log

            for (OrderDetailDTO detail : details) {
                ProductDTO product = productDAO.getProductByPID(String.valueOf(detail.getProduct_id()));
                if (product != null) {
                    detail.setProduct(product);
                } else {
                    System.out.println("Product not found for ID: " + detail.getProduct_id()); // Debug log
                }
            }

            request.setAttribute("order", order);
            request.setAttribute("orderDetails", details);
            request.getRequestDispatcher("orderDetail.jsp").forward(request, response);

        } catch (Exception e) {
            System.out.println("Error in orderDetail servlet: " + e.getMessage()); // Debug log
            e.printStackTrace();
            response.sendRedirect("order");
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
