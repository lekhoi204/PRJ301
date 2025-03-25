package utils;

import dto.OrderDTO;
import dto.OrderDetailDTO;
import java.util.List;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Thư viện: https://mvnrepository.com/artifact/com.sun.mail/javax.mail Tao mật
 * khẩu ứng dụng: https://myaccount.google.com/apppasswords
 */
public class EmailUtils {

    // Thông tin tài khoản email dùng để gửi (thay đổi thông tin này)
    private static final String EMAIL_USERNAME = "se183384lenguyenxuankhoi@gmail.com";
    private static final String EMAIL_PASSWORD = "wdwibloqkpfyaqct";

    // Cấu hình SMTP server
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    /**
     * Gửi email thông báo đăng ký thành công
     *
     * @param toEmail Địa chỉ email người nhận
     * @param fullName Tên đầy đủ của người dùng
     * @param userID ID người dùng
     * @return true nếu gửi email thành công, false nếu có lỗi
     */
    public static boolean sendRegistrationEmail(String toEmail, String fullName, String userID) {
        try {
            // Thiết lập các thuộc tính
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", SMTP_HOST);
            props.put("mail.smtp.port", SMTP_PORT);

            // Tạo phiên xác thực
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });

            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Welcome to Our Website - Registration Successful");

            // Xây dựng nội dung HTML email
            String htmlContent = createRegistrationEmailContent(fullName, userID);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xây dựng nội dung HTML cho email đăng ký thành công
     *
     * @param fullName Tên đầy đủ người dùng
     * @param userID ID người dùng
     * @return Chuỗi HTML hoàn chỉnh cho nội dung email
     */
    private static String createRegistrationEmailContent(String fullName, String userID) {
        return "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <title>Registration Successful</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            line-height: 1.6;\n"
                + "            color: #333;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "        }\n"
                + "        .container {\n"
                + "            max-width: 600px;\n"
                + "            margin: 0 auto;\n"
                + "            padding: 20px;\n"
                + "            background-color: #f9f9f9;\n"
                + "        }\n"
                + "        .header {\n"
                + "            background-color: #4a90e2;\n"
                + "            color: white;\n"
                + "            padding: 20px;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        .content {\n"
                + "            padding: 20px;\n"
                + "            background-color: white;\n"
                + "            border-radius: 5px;\n"
                + "        }\n"
                + "        .button {\n"
                + "            display: inline-block;\n"
                + "            padding: 10px 20px;\n"
                + "            background-color: #4a90e2;\n"
                + "            color: white;\n"
                + "            text-decoration: none;\n"
                + "            border-radius: 5px;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        .footer {\n"
                + "            text-align: center;\n"
                + "            margin-top: 20px;\n"
                + "            font-size: 12px;\n"
                + "            color: #666;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <div class=\"header\">\n"
                + "            <h1>Welcome to Our Website!</h1>\n"
                + "        </div>\n"
                + "        <div class=\"content\">\n"
                + "            <h2>Hello, " + fullName + "!</h2>\n"
                + "            <p>Thank you for registering with our website. Your account has been successfully created.</p>\n"
                + "            <p><strong>Your login information:</strong></p>\n"
                + "            <p>Username: <strong>" + userID + "</strong></p>\n"
                + "            <p>You can now login to your account and start exploring our services.</p>\n"
                + "            <a href=\"http://yourwebsite.com/login\" class=\"button\">Login to Your Account</a>\n"
                + "            <p>If you have any questions or need assistance, please don't hesitate to contact our support team.</p>\n"
                + "            <p>Best regards,<br>The Team</p>\n"
                + "        </div>\n"
                + "        <div class=\"footer\">\n"
                + "            <p>This is an automated message, please do not reply to this email.</p>\n"
                + "            <p>&copy; 2025 Your Company. All rights reserved.</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";
    }

    public static boolean sendOrderConfirmationEmail(String email, String fullname, OrderDTO order) {
        // Các thông tin email của bạn
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", SMTP_HOST);
        props.put("mail.smtp.port", SMTP_PORT);

        // Tạo phiên xác thực
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Xác nhận đơn hàng #" + order.getOrder_id());

            // Tạo nội dung HTML cho email
            StringBuilder htmlContent = new StringBuilder();
            htmlContent.append("<html><body>");
            htmlContent.append("<h2>Xin chào ").append(fullname).append("!</h2>");
            htmlContent.append("<p>Cảm ơn bạn đã đặt hàng tại Figure Store. Đơn hàng của bạn đã được xác nhận.</p>");
            htmlContent.append("<h3>Chi tiết đơn hàng #").append(order.getOrder_id()).append("</h3>");

            // Thông tin giao hàng
            htmlContent.append("<div style='margin-bottom: 20px;'>");
            htmlContent.append("<h4>Thông tin giao hàng:</h4>");
            htmlContent.append("<p>Địa chỉ: ").append(order.getAddress()).append("</p>");
            htmlContent.append("<p>Số điện thoại: ").append(order.getPhone()).append("</p>");
            if (order.getNote() != null && !order.getNote().trim().isEmpty()) {
                htmlContent.append("<p>Ghi chú: ").append(order.getNote()).append("</p>");
            }
            htmlContent.append("<p>Tổng tiền: <strong>$").append(String.format("%.2f", order.getTotal_amount())).append("</strong></p>");
            htmlContent.append("</div>");

            // Thông tin thêm
            htmlContent.append("<p>Chúng tôi sẽ thông báo cho bạn khi đơn hàng được gửi đi.</p>");
            htmlContent.append("<p>Nếu bạn có bất kỳ câu hỏi nào, vui lòng liên hệ với chúng tôi.</p>");
            htmlContent.append("<p>Trân trọng,<br>Figure Store</p>");
            htmlContent.append("</body></html>");

            message.setContent(htmlContent.toString(), "text/html; charset=UTF-8");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            System.out.println("Lỗi gửi email xác nhận đơn hàng: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}
