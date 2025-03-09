/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtils;

/**
 *
 * @author ADMIND
 */
public class UserDAO implements IDAO<UserDTO, String> {

    @Override
    public boolean create(UserDTO entity) {
       return false;
    }

    @Override
    public List<UserDTO> readAll() {
       return null;
    }

    @Override
    public UserDTO readById(String id) {
        String sql = "SELECT * FROM Users WHERE username= ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UserDTO user = new UserDTO(
                        rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("role")
                    );
                return user;
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
      return false;
    }

    @Override
    public boolean delete(String id) {
       return false;
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
       List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT [user_id], [username], [password], [email], [role] FROM [Users] "
                + "WHERE [user_id] LIKE ? "
                + "OR [username] LIKE ? "
                + "OR [role] LIKE ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            String searchPattern = "%" + searchTerm +"%";
            
            pstmt.setString(1, searchPattern);
            pstmt.setString(2, searchPattern);
            pstmt.setString(3, searchPattern);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    UserDTO user = new UserDTO(
                            rs.getInt("user_id"),
                            rs.getString("username"),
                            rs.getString("password"),
                            rs.getString("email"),
                            rs.getString("role")
                    );
                    list.add(user);
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    
}
