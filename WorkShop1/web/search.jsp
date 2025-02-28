<%-- 
    Document   : search
    Created on : Feb 28, 2025, 8:09:24 PM
    Author     : ADMIND
--%>

<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
                String searchTerm = request.getAttribute("searchTerm")+"";
                searchTerm = searchTerm.equals("null") ? "" : searchTerm;
            %>
            <form action="MainController">
                <input type="hidden" name="action" value="search"/>
                Search Books: <input type="text" name="searchTerm" value="<%=searchTerm%>"/>
                <input type="submit" value="Search"/>
            </form>

           
            <%    
            } else { %>
            You do not have permission to access this content.
            <%}%>
        </div>
    </body>
</html>
