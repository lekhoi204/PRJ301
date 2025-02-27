/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.MobileDTO;
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
public class MobileDAO implements IDAO<MobileDTO, String>{

    @Override
    public boolean create(MobileDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<MobileDTO> readAll() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public MobileDTO readById(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(MobileDTO entity) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<MobileDTO> search(String searchTerm) {
       String sql = "SELECT * FROM tbl_Mobile WHERE mobileId LIKE ? OR mobileName LIKE ?";
        List<MobileDTO> list = new ArrayList<MobileDTO>();
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+searchTerm+"%");
            ps.setString(2, "%"+searchTerm+"%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                MobileDTO m = new MobileDTO(
                        rs.getString("mobileId"), 
                        rs.getString("description"), 
                        rs.getFloat("price"), 
                        rs.getString("mobileName"), 
                        rs.getInt("yearOfProduction"), 
                        rs.getInt("quantity"),
                        rs.getBoolean("notSale")
                        );
                list.add(m);
            }
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        return list;
    }
    
}
