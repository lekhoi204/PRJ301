<%-- 
    Document   : exam
    Created on : Mar 12, 2025, 7:30:19 PM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exam Page</title>
        <style>
            .exam-table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
            }
            .exam-table th, .exam-table td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: left;
            }
            .exam-table th {
                background-color: #f2f2f2;
            }
            .category-section {
                margin: 20px 0;
            }
            .category-list {
                background: white;
                padding: 20px;
                border-radius: 15px;
                box-shadow: 0 5px 15px rgba(0,0,0,0.05);
                margin-bottom: 40px;
            }

            .category-list ul {
                display: flex;
                justify-content: center;
                flex-wrap: wrap;
                gap: 15px;
                list-style: none;
                padding: 0;
                margin: 0;
            }

            .category-list li {
                margin: 5px;
            }

            .category-list a {
                padding: 10px 25px;
                border-radius: 25px;
                font-weight: 600;
                transition: all 0.3s ease;
            }

            .category-list a:hover {
                background: linear-gradient(45deg, #2980b9, #3498db);
                color: white;
            }

            .category-list a.active {
                background: linear-gradient(45deg, #2980b9, #3498db);
                color: white;
            }

            /* Responsive adjustments for category list */
            @media (max-width: 768px) {
                .category-list {
                    padding: 15px 10px;
                }

                .category-list a {
                    padding: 8px 15px;
                    font-size: 0.9rem;
                }
            }

            /* Thêm style mới cho category tooltip */
            .category-item {
                position: relative;
                display: inline-block;
            }

            .category-tooltip {
                visibility: hidden;
                position: absolute;
                z-index: 1;
                bottom: 125%;
                left: 50%;
                transform: translateX(-50%);
                width: 250px;
                background-color: white;
                color: #333;
                text-align: left;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                opacity: 0;
                transition: opacity 0.3s, visibility 0.3s;
            }

            .category-tooltip::after {
                content: "";
                position: absolute;
                top: 100%;
                left: 50%;
                margin-left: -5px;
                border-width: 5px;
                border-style: solid;
                border-color: white transparent transparent transparent;
            }

            .category-item:hover .category-tooltip {
                visibility: visible;
                opacity: 1;
            }

            .tooltip-title {
                font-weight: bold;
                margin-bottom: 8px;
                color: #2980b9;
                border-bottom: 1px solid #eee;
                padding-bottom: 5px;
            }

            .tooltip-description {
                font-size: 0.9em;
                line-height: 1.4;
            }

            .tooltip-stats {
                display: flex;
                justify-content: space-between;
                margin-top: 10px;
                padding-top: 8px;
                border-top: 1px solid #eee;
            }

            .tooltip-stat {
                text-align: center;
            }

            .stat-value {
                font-weight: bold;
                color: #2980b9;
            }

            /* Thêm style cho nút Add New Exam */
            .add-exam-button {
                display: inline-block;
                padding: 12px 24px;
                background: linear-gradient(45deg, #2ecc71, #27ae60);
                color: white;
                text-decoration: none;
                border-radius: 25px;
                font-weight: 600;
                margin: 20px;
                transition: all 0.3s ease;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            }

            .add-exam-button:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 10px rgba(0,0,0,0.15);
                background: linear-gradient(45deg, #27ae60, #2ecc71);
            }

            .button-container {
                text-align: right;
                margin: 20px;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
        <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>
        <c:if test="${isLoggedIn}">
            <!-- Thêm nút Add New Exam -->
            <c:if test="${isAdmin}">
                <div class="button-container">
                    <a href="MainController?action=showExamForm" class="add-exam-button">
                        <i class="fas fa-plus"></i> Add New Exam
                    </a>
                </div>
            </c:if>
            <div class="container">
                <div class="category-list">
                    <ul>
                        <li class="category-item">
                            <a href="MainController?action=getAll">ALL</a>
                            <div class="category-tooltip">
                                <div class="tooltip-title">All Categories</div>
                                <div class="tooltip-description">
                                    View all available exams across all categories.
                                </div>

                            </div>
                        </li>
                        <c:forEach items="${listC}" var="o">
                            <li class="category-item">
                                <a href="MainController?action=category&category_id=${o.category_id}">${o.category_name}</a>
                                <div class="category-tooltip">
                                    <div class="tooltip-title">${o.category_name}</div>
                                    <div class="tooltip-description">
                                        ${o.description}
                                    </div>                                
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>

            <table class="exam-table">
                <thead>
                    <tr>
                        <th>Exam Title</th>
                        <th>Subject</th>
                        <th>Total Marks</th>
                        <th>Duration</th>
                    </tr>
                </thead>
                <c:forEach items="${listE}" var ="o">
                    <tbody>
                        <tr>
                            <td>${o.exam_title}</td>
                            <td>${o.subject}</td>
                            <td>${o.total_marks}</td>
                            <td>${o.duration}</td>
                        </tr>

                        <!-- Add more exam rows as needed -->
                    </tbody>
                </c:forEach>
            </table>
        </c:if>
        <c:if test="${!isLoggedIn}">
            You do not have permission to access this content.
        </c:if>
        <jsp:include page="footer.jsp" />
    </body>
</html>
