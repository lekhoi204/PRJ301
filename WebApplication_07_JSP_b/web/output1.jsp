<%-- 
    Document   : output1
    Created on : Feb 10, 2025, 11:16:33 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
            int n = (int)request.getAttribute("n");
            %>
            <%
            if (n % 2 == 0) {
        %>
        <%=n%>Là số chẵn
        <%
        } else {
        %>
        <%=n%> Là số lẻ
        <%
            }
        %>
    </body>
</html>
