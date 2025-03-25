/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import dto.OrderDTO;
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
    public boolean create(ProductDTO product) {
        String sql = "INSERT INTO Products (category_id, name, price, description, image_url,quantity) VALUES (?, ?, ?, ?, ?,?)";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, product.getCategory_id());
            ps.setString(2, product.getName());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImage_url());
            ps.setInt(6, product.getQuantity());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error at ProductDAO-create: " + e.toString());
            return false;
        }
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
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
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
    public boolean update(ProductDTO product) {
        String sql = "UPDATE Products SET category_id=?, name=?, price=?, description=?, image_url=?, quantity =? WHERE product_id=?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, product.getCategory_id());
            ps.setString(2, product.getName());
            ps.setDouble(3, product.getPrice());
            ps.setString(4, product.getDescription());
            ps.setString(5, product.getImage_url());
            ps.setInt(6, product.getQuantity());
            ps.setInt(7, product.getProduct_id());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (Exception e) {
            System.out.println("Error at ProductDAO-update: " + e.toString());
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        boolean result = false;
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Products SET quantity = 0 WHERE product_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, id);

                int rowsAffected = ps.executeUpdate();
                result = rowsAffected > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
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
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
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
                        rs.getString("image_url"),
                        rs.getInt("quantity"));

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
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
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

    public List<ProductDTO> readAllPActive() {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "select * from [Products] where quantity > 0";
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
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
                list.add(p);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public int getTotalProducts() {
        String query = "SELECT COUNT(*) FROM Products WHERE quantity > 0";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int getTotalProductsForManage() {
        String query = "SELECT COUNT(*) FROM Products";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public List<ProductDTO> getProductsWithPaging(int page, int productsPerPage) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "SELECT * FROM Products WHERE quantity > 0 ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, (page - 1) * productsPerPage);
            ps.setInt(2, productsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductDTO> getProductsForManageWithPaging(int page, int productsPerPage) {
        List<ProductDTO> list = new ArrayList<>();
        String query = "SELECT * FROM Products ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, (page - 1) * productsPerPage);
            ps.setInt(2, productsPerPage);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ProductDTO p = new ProductDTO(
                        rs.getInt("product_id"),
                        rs.getInt("category_id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getString("description"),
                        rs.getString("image_url"),
                        rs.getInt("quantity")
                );
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
 
}
