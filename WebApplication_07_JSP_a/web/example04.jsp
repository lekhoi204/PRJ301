<%-- 
    Document   : example04
    Created on : Feb 10, 2025, 10:31:20 AM
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
            for (int a = 2; a <= 10; a++) {
        %>
        <b> Bảng Cửu Chương <%=a%></b><br/>   

        <%
            for (int b = 1; b <= 10; b++) {
        %>
        <%=a%> x  <%=b%>  = <span style="color: red"><%=a * b%></span> <br/>           
        <%
            }
        %>
        <%
            }
        %>
    </body>
</html>
