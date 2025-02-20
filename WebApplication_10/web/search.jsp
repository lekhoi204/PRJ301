<%-- 
    Document   : search
    Created on : Feb 13, 2025, 11:27:20 AM
 
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
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 70px">
            <%               
                if(session.getAttribute("user")!=null){
                  UserDTO user = (UserDTO) session.getAttribute("user");
            %>
            <h1> Welcome <%=user.getFullName()%> </h1>
            <form action="MainController">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout"/>
            </form>
            
            <br/>
            
            <form action="#">
                Search Value: <input type="submit" name="searchTerm"/><br/>
                <input type="submit" name="Search"/>
            </form>
            
            <%} else { %>
                You do not have permission to access this content.
            <%}%>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>