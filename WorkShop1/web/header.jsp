<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    .header {
        background-color: #1a237e;
        padding: 1rem 0;
        width: 100%;
        top: 0;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }

    .container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
    }

    .nav {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px;
    }

    .logo {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .logo-text {
        color: #fff;
        font-size: 1.8rem;
        font-weight: bold;
        text-decoration: none;
    }

    .logo-desc {
        color: #e8eaf6;
        font-size: 0.9rem;
    }

    /* User section styles */
    .user-section {
        display: flex;
        align-items: center;
        gap: 1.5rem;
        background-color: rgba(255, 255, 255, 0.1);
        padding: 8px 15px;
        border-radius: 8px;
    }

    .welcome-text {
        color: #fff;
        font-size: 0.95rem;
    }

    .user-name {
        color: #64ffda;
        font-weight: bold;
    }

    .logout-btn {
        background-color: #ff1744;
        color: white;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        font-size: 0.9rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .logout-btn:hover {
        background-color: #d50000;
        transform: translateY(-1px);
    }
</style>

<header class="header">
    <nav class="nav">
        <div class="logo">
            <div>
                <span class="logo-text">StartupManager</span>
                <div class="logo-desc">Project Management System</div>
            </div>
        </div>

        <%  if (AuthUtils.isLoggedIn(session)) {
                UserDTO userHeader = AuthUtils.getUser(session);
        %>
        <div class="user-section">
            <span class="welcome-text">Welcome, <span class="user-name"><%=userHeader.getName()%></span></span>
            <form action="MainController" method="post" style="margin: 0;">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout" class="logout-btn"/>
            </form>
        </div>
        <% } %>
    </nav>
</header>