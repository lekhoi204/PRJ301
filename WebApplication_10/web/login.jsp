<%-- 
    Document   : login
    Created on : Feb 13, 2025, 11:01:10 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
            body {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 150px;

                background-color: #f4f4f4;
                font-family: Arial, sans-serif;
            }
            .login-container {
                background: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                text-align: center;
                width: 300px;
            }
            .login-container h2 {
                margin-bottom: 20px;
            }
            .login-container input {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .login-container input[type="submit"] {
                background-color: #007bff;
                color: white;
                cursor: pointer;
                border: none;
            }
            .login-container input[type="submit"]:hover {
                background-color: #0056b3;
            }
        </style>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="login-container">
            <h2>Login</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login" />
                <input type="text" name="txtUserID" placeholder="User ID" required/><br/>
                <input type="password" name="txtPassword" placeholder="Password" required/><br/>
                <input type="submit" value="Login"/>
                 
                    <%
                        String message = request.getAttribute("message")+"";
                    %>
                    <div style="color: red"> <%=message.equals("null")?"":message%></div>
            </form>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>


