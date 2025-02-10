<%-- 
    Document   : example01
    Created on : Feb 10, 2025, 9:59:24 AM
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
        <%! int a = 9; %>
        <%
            double b;
            b = Math.sqrt(a);
            %>
            KET QUA : sqrt(<%=a%>) =<span style="color: pink">  <%=b%> <span/>
    </body>
</html>
