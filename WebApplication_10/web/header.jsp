<%-- 
    Document   : header
    Created on : Feb 17, 2025, 10:54:59 AM
    Author     : ADMIND
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOP Figure</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .header {
            background-color: #0099FF;
            padding: 15px 0;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1000;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .logo {
            color: #fff;
            font-size: 1.8rem;
            font-weight: bold;
            text-decoration: none;
        }

        .menu {
            display: flex;
            list-style: none;
        }

        .menu-item {
            margin: 0 15px;
        }

        .menu-item a {
            color: #fff;
            text-decoration: none;
            font-size: 1rem;
            transition: 0.3s;
        }

        .menu-item a:hover {
            color: #f39c12;
        }

        .search-bar {
            display: flex;
            align-items: center;
            background: #fff;
            border-radius: 25px;
            padding: 5px 10px;
        }

        .search-input {
            border: none;
            outline: none;
            padding: 5px;
            width: 180px;
        }

        .search-button {
            background: none;
            border: none;
            cursor: pointer;
            color: #1a252f;
            font-size: 1.2rem;
        }
    </style>
</head>
<body>
    <header class="header">
        <div class="container">
            <a href="#" class="logo">SHOP Figure</a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang chủ</a></li>
                <li class="menu-item"><a href="#">Sản phẩm</a></li>
                <li class="menu-item"><a href="#">Giỏ hàng</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="search-bar">
                <input type="text" class="search-input" placeholder="Tìm kiếm...">
                <button class="search-button">🔍</button>
            </div>
        </div>
    </header>
</body>
</html>