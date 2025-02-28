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
        <%                if (session.getAttribute("user") != null) {
                UserDTO user = (UserDTO) session.getAttribute("user");
        %>
        <h1> Welcome <%=user.getName()%> </h1>
        <form action="MainController">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="Logout"/>
        </form>

        <br/>
        <%
            String searchTerm = request.getAttribute("searchTerm") + "";
            searchTerm = searchTerm.equals("null") ? "" : searchTerm;
        %>
        <form action="MainController">
            <input type="hidden" name="action" value="search"/>
            Search Books: <input type="text" name="searchTerm" value="<%=searchTerm%>"/>
            <input type="submit" value="Search"/>
        </form>
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
                    <th>Action</th>
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
                    
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <%    }
            } else { %>
        You do not have permission to access this content.
        <%}%>
    </div>
</body>
</html>
