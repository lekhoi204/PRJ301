/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIND
 */
public class AuthUtils {

    public static final String ADMIN_ROLE = "AD";
    public static final String USER_ROLE = "US";

    public static UserDTO getUser(String strUserID) {
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readByID(strUserID);
        return user;
    }

    public static boolean isValidLogin(String strUserID, String strPassword) {
        UserDTO user = getUser(strUserID);
        System.out.println(user);
//        System.out.println(user.getPassword());
        System.out.println(strPassword);
       return user != null && util.PasswordUtils.checkPassword(strPassword, user.getPassword());
    }

    public static UserDTO getUser(HttpSession session) {
//        if (session.getAttribute("user") != null) {
//            return (UserDTO) session.getAttribute("user");
//        } else {
//            return null;
//        }
        Object obj = session.getAttribute("user");
        return (obj != null) ? (UserDTO) obj : null;
    }

    public static boolean isLoggedIn(HttpSession session) {
        return session.getAttribute("user") != null;
    }

    public static boolean isAdmin(HttpSession session) {
        if (!isLoggedIn(session)) {
            return false;
        }
        UserDTO user = (UserDTO) session.getAttribute("user");
        return user.getRoleId().equals(ADMIN_ROLE);
    }

}
