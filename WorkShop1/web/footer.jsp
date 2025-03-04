<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        background-color: #1a237e;
        color: #fff;
        padding: 2rem 0;
        margin-top: 2rem;
    }

    .footer-container {
        max-width: 1200px;
        margin: 0 auto;
        padding: 0 1rem;
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 2rem;
    }

    .footer-section h3 {
        font-size: 1.2rem;
        margin-bottom: 1rem;
        color: #64ffda;
        font-weight: 600;
    }

    .footer-section p {
        margin-bottom: 0.8rem;
        font-size: 0.9rem;
        line-height: 1.6;
        color: #e8eaf6;
    }

    .footer-links {
        list-style: none;
    }

    .footer-links li {
        margin-bottom: 0.8rem;
    }

    .footer-links a {
        color: #e8eaf6;
        text-decoration: none;
        transition: color 0.3s ease;
        font-size: 0.9rem;
    }

    .footer-links a:hover {
        color: #64ffda;
    }

    .contact-info {
        display: flex;
        align-items: center;
        gap: 8px;
        margin-bottom: 0.8rem;
    }

    .contact-info i {
        color: #64ffda;
    }

    .copyright {
        text-align: center;
        padding-top: 2rem;
        margin-top: 2rem;
        border-top: 1px solid rgba(255,255,255,0.1);
        font-size: 0.9rem;
        color: #e8eaf6;
    }
</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>About StartupManager</h3>
            <p>A comprehensive project management system designed specifically for startups. We help teams track, manage, and succeed in their innovative projects.</p>
        </div>
        
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul class="footer-links">
                <li><a href="#">Dashboard</a></li>
                <li><a href="#">Projects</a></li>
                <li><a href="#">Reports</a></li>
                <li><a href="#">Documentation</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Contact Information</h3>
            <div class="contact-info">
                <i>📍</i>
                <p>FPT University, District 9, Ho Chi Minh City</p>
            </div>
            <div class="contact-info">
                <i>📧</i>
                <p>support@startupmanager.com</p>
            </div>
            <div class="contact-info">
                <i>📱</i>
                <p>(+84) 123-456-789</p>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>&copy; 2024 StartupManager. All rights reserved.</p>
    </div>
</footer>