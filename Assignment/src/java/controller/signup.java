/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAO;
import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.PasswordUtils;
import utils.EmailUtils;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "signup", urlPatterns = {"/signup"})
public class signup extends HttpServlet {

    /**
     * Kiểm tra email có hợp lệ không bằng regex
     */
    private boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }
        // Regex cho email hợp lệ
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        return email.matches(emailRegex);
    }

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
        ProductDAO product = new ProductDAO();
        UserDAO user1 = new UserDAO();
        // Kiểm tra email hợp lệ
        if (!isValidEmail(email)) {
            errorMessage = "Email không hợp lệ! Vui lòng nhập đúng định dạng email.";
            request.setAttribute("SIGNUP_ERROR", errorMessage);
            request.setAttribute("SHOW_SIGNUP", true);
            request.setAttribute("savedUsername", user);
            request.setAttribute("savedFullname", fullname);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Kiểm tra email đã tồn tại
        UserDTO existingEmail = user1.findByEmail(email);
        if (existingEmail != null) {
            errorMessage = "Email này đã được sử dụng! Vui lòng sử dụng email khác.";
            request.setAttribute("SIGNUP_ERROR", errorMessage);
            request.setAttribute("SHOW_SIGNUP", true);
            request.setAttribute("savedUsername", user);
            request.setAttribute("savedFullname", fullname);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if (!password.equals(confirm)) {
            errorMessage = "Mật khẩu xác nhận không khớp!";
            request.setAttribute("SIGNUP_ERROR", errorMessage);
            request.setAttribute("SHOW_SIGNUP", true);
            request.setAttribute("savedUsername", user);
            request.setAttribute("savedFullname", fullname);
            request.setAttribute("savedEmail", email);
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            UserDTO existingUser = product.checkUser(user);
            if (existingUser == null) {
                String hashedPassword = PasswordUtils.hashPassword(password);
                if (hashedPassword != null) {
                    // Đăng ký user mới
                    product.signup(user, hashedPassword, fullname, email);

                    // Thử gửi email chào mừng
                    StringBuilder successMessage = new StringBuilder();
                    successMessage.append("Đăng ký thành công! ");

                    try {
                        boolean emailSent = EmailUtils.sendRegistrationEmail(email, fullname, user);
                        if (emailSent) {
                            successMessage.append("Email chào mừng đã được gửi đến ")
                                    .append(email)
                                    .append(". Vui lòng kiểm tra hộp thư của bạn (có thể nằm trong mục Spam).");
                        } else {
                            successMessage.append("Không thể gửi email chào mừng đến ")
                                    .append(email)
                                    .append(". Vui lòng kiểm tra lại địa chỉ email của bạn.");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        successMessage.append("Không thể gửi email chào mừng do lỗi hệ thống: ")
                                .append(e.getMessage());
                    }

                    successMessage.append(" Bạn có thể đăng nhập ngay bây giờ.");
                    request.setAttribute("SUCCESS_MESSAGE", successMessage.toString());
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
