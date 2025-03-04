<%-- 
    Document   : search
    Created on : Feb 28, 2025, 8:09:24 PM
    Author     : ADMIND
--%>

<%@page import="dto.ProjectDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        .project-table {
            width: 100%;
            border-collapse: collapse;
            margin: 25px 0;
            font-size: 14px;
            font-family: Arial, sans-serif;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .project-table thead th {
            background-color: #009879;
            color: #ffffff;
            text-align: left;
            font-weight: bold;
            padding: 12px 15px;
        }

        .project-table tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        .project-table tbody tr:nth-of-type(even) {
            background-color: #f3f3f3;
        }

        .project-table tbody tr:last-of-type {
            border-bottom: 2px solid #009879;
        }

        .project-table tbody td {
            padding: 12px 15px;
        }

        .project-table tbody tr:hover {
            background-color: #f5f5f5;
            transition: 0.3s ease;
        }
        .search-section {
            background-color: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
        }

        .search-section form {
            display: flex;
            align-items: center;
            flex-grow: 1;
        }

        .search-section label {
            margin-right: 10px;
            font-weight: bold;
            color: #333;
        }

        .search-input {
            flex-grow: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            margin-right: 10px;
            transition: border-color 0.3s;
        }

        .search-input:focus {
            border-color: #009879;
            outline: none;
            box-shadow: 0 0 0 2px rgba(0, 152, 121, 0.2);
        }

        .search-btn {
            background-color: #009879;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 15px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .search-btn:hover {
            background-color: #00806a;
        }
        .add-btn {
            display: inline-block;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            padding: 10px 15px;
            margin-bottom: 20px;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .add-btn:hover {
            background-color: #0069d9;
            text-decoration: none;
        }

        /* Add a nice icon to the add button */
        .add-btn::before {
            content: "+";
            margin-right: 5px;
            font-weight: bold;
        } 
        .status-select {
            padding: 5px 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: white;
            font-size: 14px;
            min-width: 120px;
        }

        /* Style cho nút update */
        .update-btn {
            background: none;
            border: none;
            cursor: pointer;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .update-btn:hover img {
            transform: scale(1.1);
            transition: transform 0.2s;
        }

        /* Style cho form trong td */
        td form {
            margin: 0;
            padding: 0;
        }

        /* Thông báo update */
        .update-message {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border-radius: 4px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
            animation: fadeInOut 5s forwards;
        }
        @keyframes fadeInOut {
            0% { opacity: 0; transform: translateY(-20px); }
            10% { opacity: 1; transform: translateY(0); }
            90% { opacity: 1; transform: translateY(0); }
            100% { opacity: 0; transform: translateY(-20px); }
        }

        /* Responsive design */
        @media screen and (max-width: 600px) {
            .project-table {
                font-size: 12px;
            }

            .project-table thead th,
            .project-table tbody td {
                padding: 8px 10px;
            }
        }
    </style>
    <body>
        <%@include file="header.jsp" %>
        <%                if (session.getAttribute("user") != null) {
                UserDTO user = AuthUtils.getUser(session);
        %>


        <br/>
        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>
        <div class="search-section">
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                <label for="searchInput">Search Books:</label>
                <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter book title, author or ID..."/>
                <input type="submit" value="Search" class="search-btn"/>
            </form>
        </div>
        <% if (AuthUtils.isAdmin(session)) {
        %>
        <a href="projectForm.jsp" class="add-btn">
            Add New Book    
        </a> 

        <%}%>
        <%
            if (request.getAttribute("projects") != null) {
                List<ProjectDTO> projects = (List<ProjectDTO>) request.getAttribute("projects");

        %>
        <table class="project-table">
            <thead>
                <tr>
                    <th>Project</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Estimated Launch</th>  
                        <%                         if (AuthUtils.isAdmin(session)) {
                        %>
                    <th>Update Status</th>
                        <%}%>
                </tr>
            </thead>
            <tbody>
                <%            for (ProjectDTO p : projects) {
                %>
                <tr>
                    <td><%=p.getProject_name()%></td> 
                    <td><%=p.getDescription()%></td>
                    <td><%=p.getStatus()%></td>
                    <td><%=p.getEstimated_launch()%></td>              
                    <% if (AuthUtils.isAdmin(session)) {%>
                    <td>
                        <form action="MainController" method="post" style="display: flex; align-items: center; gap: 10px;">
                            <select name="txtstatus" class="status-select">
                                <option value="Development" <%= p.getStatus().equals("Development") ? "selected" : ""%>>Development</option>
                                <option value="Ideation" <%= p.getStatus().equals("Ideation") ? "selected" : ""%>>Ideation</option>
                                <option value="Launch" <%= p.getStatus().equals("Launch") ? "selected" : ""%>>Launch</option>
                                <option value="Scaling" <%= p.getStatus().equals("Scaling") ? "selected" : ""%>>Scaling</option>
                            </select>
                            <input type="hidden" name="action" value="update"/>
                            <input type="hidden" name="id" value="<%=p.getProject_id()%>"/>
                            <button type="submit" class="update-btn">
                                <img src="assets/img/update.png" style="height: 25px"/>
                            </button>
                        </form>
                    </td>
                    <% } %>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% if (request.getAttribute("message") != null) {%>
        <div class="update-message">
            <%= request.getAttribute("message")%>
        </div>
        <% } %>
        <%    }
        } else { %>
        You do not have permission to access this content.
        <%}%>
    </div>
    <%@include file="footer.jsp" %>
</body>
</html>
