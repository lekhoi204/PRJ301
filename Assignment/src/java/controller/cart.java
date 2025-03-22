/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "cart", urlPatterns = {"/cart"})
public class cart extends HttpServlet {

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
        String source = request.getParameter("source");
        HttpSession session = request.getSession();

        HashMap<Integer, ProductDTO> cart = (HashMap<Integer, ProductDTO>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
        }

        try {
            if (action == null || action.trim().isEmpty()) {
                // Hiển thị trang giỏ hàng
                request.getRequestDispatcher("cart.jsp").forward(request, response);
                return;
            }

            ProductDAO dao = new ProductDAO();

            switch (action) {
                case "add":
                    String pidStr = request.getParameter("pid");
                    String quantityStr = request.getParameter("quantity");

                    if (pidStr != null && !pidStr.trim().isEmpty()) {
                        int productId = Integer.parseInt(pidStr);
                        int quantity = 1;

                        if (quantityStr != null && !quantityStr.trim().isEmpty()) {
                            quantity = Integer.parseInt(quantityStr);
                        }

                        ProductDTO product = dao.getProductByPID(String.valueOf(productId));

                        if (product != null) {
                            if (cart.containsKey(productId)) {
                                ProductDTO cartItem = cart.get(productId);
                                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                            } else {
                                product.setQuantity(quantity);
                                cart.put(productId, product);
                            }

                            session.setAttribute("cart", cart);

                            if ("detail".equals(source)) {
                                response.sendRedirect("cart");
                            } else {
                                response.sendRedirect("MainController");
                            }
                            return;
                        }
                    }
                    break;

                case "update":
                    String updatePidStr = request.getParameter("productId");
                    String updateQuantityStr = request.getParameter("quantity");

                    if (updatePidStr != null && !updatePidStr.trim().isEmpty()
                            && updateQuantityStr != null && !updateQuantityStr.trim().isEmpty()) {
                        try {
                            int productId = Integer.parseInt(updatePidStr);
                            int quantity = Integer.parseInt(updateQuantityStr);

                            if (quantity > 0 && cart.containsKey(productId)) {
                                cart.get(productId).setQuantity(quantity);
                            } else if (quantity <= 0) {
                                cart.remove(productId);
                            }

                            session.setAttribute("cart", cart);
                        } catch (NumberFormatException e) {
                            request.setAttribute("ERROR", "Dữ liệu không hợp lệ!");
                        }
                    }
                    break;

                case "remove":
                    String removePidStr = request.getParameter("productId");
                    if (removePidStr != null && !removePidStr.trim().isEmpty()) {
                        try {
                            int productId = Integer.parseInt(removePidStr);
                            cart.remove(productId);
                            session.setAttribute("cart", cart);
                        } catch (NumberFormatException e) {
                            request.setAttribute("ERROR", "Mã sản phẩm không hợp lệ!");
                        }
                    }
                    break;
            }

            double total = 0;
            for (ProductDTO item : cart.values()) {
                total += item.getPrice() * item.getQuantity();
            }
            session.setAttribute("total", total);

            response.sendRedirect("cart");

        } catch (Exception e) {
            log("Error at CartServlet: " + e.toString());
            request.setAttribute("ERROR", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("cart.jsp").forward(request, response);
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
