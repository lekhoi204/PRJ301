<%-- 
    Document   : output.jsp
    Created on : Feb 10, 2025, 11:06:15 AM
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
            <b> Bảng Cửu Chương <%=n%></b><br/>   

        <%
            for (int b = 1; b <= 10; b++) {
        %>
        <%=n%> x  <%=b%>  = <span style="color: red"><%=n * b%></span> <br/>           
        <%
            }
        %>
    </body>
</html>
