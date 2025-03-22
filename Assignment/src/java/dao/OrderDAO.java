/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDTO;
import dto.OrderDetailDTO;
import utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIND
 */
public class OrderDAO {
    // Tạo đơn hàng mới và trả về order_id
    public int createOrder(OrderDTO order) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int orderId = -1;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Orders (user_id, order_date, total_amount, status, address, phone, note) "
                         + "VALUES (?, GETDATE(), ?, N'Đã đặt hàng', ?, ?, ?)";
                ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                ps.setInt(1, order.getUser_id());
                ps.setDouble(2, order.getTotal_amount());
                ps.setString(3, order.getAddress());
                ps.setString(4, order.getPhone());
                ps.setString(5, order.getNote());
                
                if (ps.executeUpdate() > 0) {
                    rs = ps.getGeneratedKeys();
                    if (rs.next()) {
                        orderId = rs.getInt(1);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orderId;
    }

    // Thêm chi tiết đơn hàng
    public boolean addOrderDetail(OrderDetailDTO detail) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO OrderDetails (order_id, product_id, quantity, price) "
                         + "VALUES (?, ?, ?, ?)";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, detail.getOrder_id());
                ps.setInt(2, detail.getProduct_id());
                ps.setInt(3, detail.getQuantity());
                ps.setDouble(4, detail.getPrice());
                
                success = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    // Lấy danh sách đơn hàng của user
    public List<OrderDTO> getOrdersByUser(int userId) {
        List<OrderDTO> orders = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Orders WHERE user_id = ? ORDER BY order_date DESC";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, userId);
                rs = ps.executeQuery();
                
                while (rs.next()) {
                    OrderDTO order = new OrderDTO();
                    order.setOrder_id(rs.getInt("order_id"));
                    order.setUser_id(rs.getInt("user_id"));
                    order.setOrder_date(rs.getString("order_date"));
                    order.setTotal_amount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setAddress(rs.getString("address"));
                    order.setPhone(rs.getString("phone"));
                    order.setNote(rs.getString("note"));
                    orders.add(order);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return orders;
    }

    // Lấy chi tiết của một đơn hàng
    public List<OrderDetailDTO> getOrderDetails(int orderId) {
        List<OrderDetailDTO> details = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM OrderDetails WHERE order_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, orderId);
                rs = ps.executeQuery();
                
                while (rs.next()) {
                    OrderDetailDTO detail = new OrderDetailDTO();
                    detail.setOrder_id(rs.getInt("order_id"));
                    detail.setProduct_id(rs.getInt("product_id"));
                    detail.setQuantity(rs.getInt("quantity"));
                    detail.setPrice(rs.getDouble("price"));
                    details.add(detail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return details;
    }

    // Cập nhật trạng thái đơn hàng
    public boolean updateOrderStatus(int orderId, String status) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Orders SET status = ? WHERE order_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, status);
                ps.setInt(2, orderId);
                
                success = ps.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }

    // Lấy một đơn hàng theo ID
    public OrderDTO getOrderById(int orderId) {
        OrderDTO order = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT * FROM Orders WHERE order_id = ?";
                ps = conn.prepareStatement(sql);
                ps.setInt(1, orderId);
                rs = ps.executeQuery();
                
                if (rs.next()) {
                    order = new OrderDTO();
                    order.setOrder_id(rs.getInt("order_id"));
                    order.setUser_id(rs.getInt("user_id"));
                    order.setOrder_date(rs.getString("order_date"));
                    order.setTotal_amount(rs.getDouble("total_amount"));
                    order.setStatus(rs.getString("status"));
                    order.setAddress(rs.getString("address"));
                    order.setPhone(rs.getString("phone"));
                    order.setNote(rs.getString("note"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return order;
    }
}
