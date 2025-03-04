/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.sun.org.glassfish.gmbal.Description;
import dao.ProjectDAO;
import dao.UserDAO;
import dto.ProjectDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javafx.animation.Animation.Status;
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

    private ProjectDAO projectDAO = new ProjectDAO();
    private static final String LOGIN_PAGE = "login.jsp";

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        String strUserID = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");
        if (AuthUtils.isValidLogin(strUserID, strPassword)) {
            url = "search.jsp";
            UserDTO user = AuthUtils.getUser(strUserID);
            request.getSession().setAttribute("user", user);

            // search
            processSearch(request, response);
        } else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url = "login.jsp";
        }
        //
        return url;
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            // search
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<ProjectDTO> projects = projectDAO.search(searchTerm);
            request.setAttribute("projects", projects);
            request.setAttribute("searchTerm", searchTerm);
            url = "search.jsp";
        }
        return url;

    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        //
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            request.getSession().invalidate(); // Hủy bỏ session
            url = "login.jsp";
        }
        //
        return url;
    }

    public String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                int project_id = 0;                
                String project_name = request.getParameter("txtProjectName");
                String Description = request.getParameter("txtDescription");
                String Status = request.getParameter("txtstatus");
                String estimatedLaunchStr = request.getParameter("txtEstimatedLaunch");
                Date estimated_launch = null;
                if (estimatedLaunchStr != null && !estimatedLaunchStr.isEmpty()) {
                    try {
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                        estimated_launch = (Date) dateFormat.parse(estimatedLaunchStr);
                    } catch (ParseException e) {
                        checkError = true;
                        request.setAttribute("txtEstimatedLaunch_error", "Invalid date format.");
                    }
                }

                String projectIdStr = request.getParameter("txtProjectID");
                try {

                    project_id = Integer.parseInt(projectIdStr.trim());
                } catch (NumberFormatException e) {
                    checkError = true;
                    request.setAttribute("txtProjectID_error", "Project ID must be a number!");
                }
                if (project_name == null || project_name.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("txtProjectName_error", "Project Name cannot be empty.");
                }
                if (Description == null || Description.trim().isEmpty()) {
                    checkError = true;
                    request.setAttribute("txtDescription_error", "Description cannot be empty.");
                }
                
                ProjectDTO project = new ProjectDTO(project_id, project_name, Description, Status, estimated_launch);

                if (!checkError) {
                    projectDAO.create(project);
                    // search
                    url = processSearch(request, response);
                } else {
                    url = "projectForm.jsp";
                    request.setAttribute("project", project);
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
        }
        return url;
    }

    private String processUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isAdmin(session)) {
            String id = request.getParameter("id");
            String newStatus = request.getParameter("txtstatus");

            if (projectDAO.updateStatus(id, newStatus)) {
                request.setAttribute("message", "Status updated successfully!");
            } else {
                request.setAttribute("message", "Failed to update status!");
            }

            // Redirect back to search page
            url = processSearch(request, response);
        }
        return url;
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
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                } else if (action.equals("update")) {
                    url = processUpdate(request, response);
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
