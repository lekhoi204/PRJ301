/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PasswordUtils;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class signup extends HttpServlet {

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
        String user = request.getParameter("txtUsername");
        String password = request.getParameter("txtPassword");
        String fullname = request.getParameter("txtFullName");
        String confirm = request.getParameter("txtConfirm");
        String email = request.getParameter("txtEmail");

        String errorMessage = "";

        if (!password.equals(confirm)) {
            errorMessage = "Mật khẩu xác nhận không khớp!";
            request.setAttribute("SIGNUP_ERROR", errorMessage);
            request.setAttribute("SHOW_SIGNUP", true);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            ProductDAO product = new ProductDAO();
            UserDTO a = product.checkUser(user);
            if (a == null) {
                String hashedPassword = PasswordUtils.hashPassword(password);
                if (hashedPassword != null) {
                    product.signup(user, hashedPassword, fullname, email);
                    request.setAttribute("SUCCESS_MESSAGE", "Đăng ký thành công! Vui lòng đăng nhập.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } else {
                    errorMessage = "Có lỗi xảy ra trong quá trình xử lý! Vui lòng thử lại.";
                    request.setAttribute("SIGNUP_ERROR", errorMessage);
                    request.setAttribute("SHOW_SIGNUP", true);
                    request.setAttribute("savedUsername", user);
                    request.setAttribute("savedFullname", fullname);
                    request.setAttribute("savedEmail", email);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                errorMessage = "Tên đăng nhập đã tồn tại!";
                request.setAttribute("SIGNUP_ERROR", errorMessage);
                request.setAttribute("SHOW_SIGNUP", true);
                request.setAttribute("savedUsername", user);
                request.setAttribute("savedFullname", fullname);
                request.setAttribute("savedEmail", email);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
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
