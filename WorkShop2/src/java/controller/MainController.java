/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamDAO;
import dto.CategoryDTO;
import dto.ExamDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Duration;
import java.util.List;
import javax.security.auth.Subject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author ADMIND
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUserID, strPassword)) {
            url = processGetALLExamAndCategory(request, response);
            UserDTO user = AuthUtils.getUser(strUserID);
            request.getSession().setAttribute("user", user);

        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url = "login.jsp";
        }
        //
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate();
            url = "login.jsp";
        }
        //
        return url;
    }

    private String processGetALLExamAndCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        ExamDAO exam = new ExamDAO();
        List<ExamDTO> list = exam.readAllExam();
        List<CategoryDTO> list1 = exam.readAllExamCategory();

        request.setAttribute("listC", list1);
        request.setAttribute("listE", list);
        //
        return url = "exam.jsp";
    }

    private String processGetExamByCID(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        ExamDAO exam = new ExamDAO();
        String cateID = request.getParameter("category_id");
        List<ExamDTO> list = exam.getExamByCID(cateID);
        List<CategoryDTO> list1 = exam.readAllExamCategory();

        request.setAttribute("listC", list1);
        request.setAttribute("listE", list);
        //
        return url = "exam.jsp";
    }

    private String processAddExam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();

        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                String exam_title = request.getParameter("txtTitle");
                String subject = request.getParameter("txtSubject");
                int category_id = Integer.parseInt(request.getParameter("txtCategoryId"));
                int total_marks = Integer.parseInt(request.getParameter("txtTotalMarks"));
                int duration = Integer.parseInt(request.getParameter("txtDuration"));

                if (exam_title == null || exam_title.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("titleError", "Title is required");
                } else {
                    ExamDAO examDAO = new ExamDAO();
                    if (examDAO.isExamTitleExists(exam_title.trim())) {
                        checkError = true;
                        request.setAttribute("titleError", "Exam title already exists");
                    }
                }

                if (subject == null || subject.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("subjectError", "Subject is required");
                }
                if (total_marks <= 0) {
                    checkError = true;
                    request.setAttribute("marksError", "Total marks must be greater than 0");
                }
                if (duration <= 0) {
                    checkError = true;
                    request.setAttribute("durationError", "Duration must be greater than 0");
                }

                ExamDTO exam = new ExamDTO();
                exam.setExam_title(exam_title);
                exam.setSubject(subject);
                exam.setCategory_id(category_id);
                exam.setTotal_marks(total_marks);
                exam.setDuration(duration);

                if (!checkError) {
                    boolean success = ExamDAO.createExam(exam);
                    if (success) {
                        url = processGetALLExamAndCategory(request, response);
                    } else {
                        request.setAttribute("errorMessage", "Failed to add new exam");
                        url = "ExamForm.jsp";
                    }
                } else {
                    request.setAttribute("exam", exam);
                    url = "ExamForm.jsp";
                }
            } catch (NumberFormatException e) {
                request.setAttribute("errorMessage", "Invalid number format");
                url = "ExamForm.jsp";
            } catch (Exception e) {
                request.setAttribute("errorMessage", "Error: " + e.getMessage());
                url = "ExamForm.jsp";
            }
        }
        return url;
    }
    private String processShowExamForm(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    ExamDAO exam = new ExamDAO();
    List<CategoryDTO> list1 = exam.readAllExamCategory();
    request.setAttribute("listC", list1);
    return "ExamForm.jsp";
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
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("category")) {
                    url = processGetExamByCID(request, response);
                } else if (action.equals("getAll")) {
                    url = processGetALLExamAndCategory(request, response);
                } else if (action.equals("add")) {
                    url = processAddExam(request, response);
                }else if (action.equals("showExamForm")) {
                    url = processShowExamForm(request, response);
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
