/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
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
            Connection conn =  DBUtils.getConnection();
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
    public static void main(String[] args){
        ProductDAO  product = new ProductDAO();
        List<ProductDTO> list = product.readAll();
        for(ProductDTO o : list){
            System.out.println(o);
        }
    }
}
