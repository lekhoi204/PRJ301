/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import dto.ExamDTO;
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
public class ExamDAO {

    public List<ExamDTO> readAllExam() {
        List<ExamDTO> list = new ArrayList<>();
        String sql = "select * from [tblExams]";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamDTO e = new ExamDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6));
                list.add(e);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<CategoryDTO> readAllExamCategory() {
        List<CategoryDTO> list = new ArrayList<>();
        String sql = "select * from [tblExamCategories]";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CategoryDTO c = new CategoryDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<ExamDTO> getExamByCID(String category_id) {
        List<ExamDTO> list = new ArrayList<>();
        String sql = "select * from [tblExams]"
                + " where category_id = ?";
        try {
            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);            
            ps.setString(1, category_id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ExamDTO e = new ExamDTO(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getInt(6));
                list.add(e);
            }
        } catch (Exception e) {
        }
        return list;
    }
    public static boolean createExam(ExamDTO exam) {
    String sql = "INSERT INTO tblExams (exam_title, subject, category_id, total_marks, duration) "
               + "VALUES (?, ?, ?, ?, ?)";
    try {
        Connection conn = DBUtils.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, exam.getExam_title());
        ps.setString(2, exam.getSubject());
        ps.setInt(3, exam.getCategory_id());
        ps.setInt(4, exam.getTotal_marks());
        ps.setInt(5, exam.getDuration());
        
        int result = ps.executeUpdate();
        return result > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}

}
