<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 8:16:21 AM
    Author     : tungi
--%>
<%@page import="dto.ExamDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>

<%@page import="java.awt.print.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Book Management</title>
        <style>
            * {
                box-sizing: border-box;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            body {
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            .page-content {
                padding: 40px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: calc(100vh - 150px); /* Account for header and footer */
            }

            .form-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 30px;
                width: 100%;
                max-width: 600px;
                margin: 0 auto;
            }

            h1 {
                color: #2c3e50;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 600;
                color: #333;
            }

            input[type="text"],
            input[type="number"],
            textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 16px;
                transition: border-color 0.3s;
            }

            input[type="text"]:focus,
            input[type="number"]:focus,
            textarea:focus {
                border-color: #3498db;
                outline: none;
                box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
            }

            .error-message {
                color: #e74c3c;
                font-size: 14px;
                margin-top: 5px;
            }

            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 20px;
            }

            button, input[type="submit"], input[type="reset"] {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                font-weight: 600;
                cursor: pointer;
                transition: background-color 0.3s;
            }

            input[type="submit"] {
                background-color: #2ecc71;
                color: white;
                flex: 1;
                margin-right: 10px;
            }

            input[type="submit"]:hover {
                background-color: #27ae60;
            }

            input[type="reset"] {
                background-color: #e74c3c;
                color: white;
                flex: 1;
                margin-left: 10px;
            }

            input[type="reset"]:hover {
                background-color: #c0392b;
            }

            .error-container {
                background-color: #fff0f0;
                border-left: 4px solid #e74c3c;
                padding: 20px;
                border-radius: 4px;
                margin-bottom: 20px;
            }

            .error-container h1 {
                color: #e74c3c;
                margin-top: 0;
            }

            .back-link {
                display: block;
                text-align: center;
                margin-top: 20px;
                color: #3498db;
                text-decoration: none;
            }

            .back-link:hover {
                text-decoration: underline;
            }

            @media (max-width: 768px) {
                .form-container {
                    padding: 20px;
                }

                .button-group {
                    flex-direction: column;
                }

                input[type="submit"], input[type="reset"] {
                    margin: 5px 0;
                }
            }

            .image-preview {
                margin-top: 10px;
                max-width: 100%;
            }

            .image-preview img {
                max-width: 100%;
                max-height: 200px;
                border: 1px solid #ddd;
                border-radius: 4px;
                padding: 5px;
            }

            .success-message {
                background-color: #d4edda;
                color: #155724;
                padding: 10px;
                border-radius: 4px;
                margin-bottom: 15px;
                border-left: 4px solid #28a745;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="page-content">
            <% if (AuthUtils.isAdmin(session)) { %>

            <div class="form-container">
                <h1>Book Information</h1>

                <!-- Hiển thị thông báo thành công nếu có -->
                <c:if test="${not empty requestScope.success}">
                    <div class="success-message">${requestScope.success}</div>
                </c:if>

                <!-- Hiển thị thông báo lỗi nếu có -->
                <c:if test="${not empty requestScope.error}">
                    <div class="error-container">
                        <p>${requestScope.error}</p>
                    </div>
                </c:if>

                <%
                    ExamDTO exam = new ExamDTO();
                    if (request.getAttribute("exam") == null) {
                        request.setAttribute("exam", new ExamDTO());
                        exam = new ExamDTO();
                    } else {
                        exam = (ExamDTO) request.getAttribute("exam");
                    }
                %>

                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="add"/>

                    <div class="form-group">
                        <label for="txtTitle">Exam Title:</label>
                        <input type="text" id="txtTitle" name="txtTitle" value="${exam.exam_title}"/>
                        <c:if test="${not empty requestScope.titleError}">
                            <div class="error-message">${requestScope.titleError}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtSubject">Subject:</label>
                        <input type="text" id="txtSubject" name="txtSubject" value="${exam.subject}"/>
                        <c:if test="${not empty requestScope.subjectError}">
                            <div class="error-message">${requestScope.subjectError}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtCategoryId">Category:</label>
                        <select class="form-select" id="txtCategoryId" name="txtCategoryId">
                            <c:forEach items="${listC}" var="category">
                                <option value="${category.category_id}">${category.category_name}</option>
                            </c:forEach>
                        </select>
                        <c:if test="${not empty requestScope.categoryError}">
                            <div class="error-message">${requestScope.categoryError}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtTotalMarks">Total Marks:</label>
                        <input type="number" id="txtTotalMarks" name="txtTotalMarks" value="${exam.total_marks}"/>
                        <c:if test="${not empty requestScope.marksError}">
                            <div class="error-message">${requestScope.marksError}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtDuration">Duration (minutes):</label>
                        <input type="number" id="txtDuration" name="txtDuration" value="${exam.duration}"/>
                        <c:if test="${not empty requestScope.durationError}">
                            <div class="error-message">${requestScope.durationError}</div>
                        </c:if>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>

                <a href="MainController?action=getAll" class="back-link">Go Back</a>
            </div>
            <% } else { %>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="login.jsp" class="back-link">Go Back</a>
            </div>
            <% }%>
        </div>

        <jsp:include page="footer.jsp"/>


    </body>
</html>