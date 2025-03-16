/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import dto.ProductDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtils;

/**
 *
 * @author ADMIND
 */
public class ProductDAO implements IDAO<ProductDTO, String> {

    @Override
    public boolean create(ProductDTO entity) {
        return false;
    }

    @Override
    public List<ProductDTO> readAll() {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from [Products]";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    @Override
    public ProductDTO readById(String id) {
        return null;
    }

    @Override
    public boolean update(ProductDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<ProductDTO> search(String searchTerm) {
        return null;
    }

    public List<CategoryDTO> readCategory() {
        List<CategoryDTO> list = new ArrayList<>();
        String sql = "select * from Categories";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryDTO c = new CategoryDTO(
                        rs.getInt("category_id"),
                        rs.getString("name")
                );
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ProductDTO> getProductByCID(String category_id) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from Products"
                + " where category_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, category_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public ProductDTO getProductByPID(String id) {
        String sql = "select * from Products"
                + " where product_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"));

            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<ProductDTO> searchByName(String txtSearch) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from Products"
                + " where name like ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"));
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public UserDTO checkUser(String user) {
        String sql = "select * from Users\n"
                + " where [username] = ?\n";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return new UserDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signup(String user, String password, String fullname, String email) {
        String sql = "insert into Users\n"
                + " values (?,?,?,?,'user')";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, password);
            ps.setString(3, fullname);
            ps.setString(4, email);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

}
