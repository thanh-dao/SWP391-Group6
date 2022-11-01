/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.CategoryDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtil;

/**
 *
 * @author kanek
 */
public class CategoryDAO {
    
    
    /**
     * 
     * @return list of category
     * @throws ClassNotFoundException
     * @throws SQLException 
     */
    public List<CategoryDTO> findAll() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<CategoryDTO> list = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("select category_id, name, icon from category order by category_id asc");
        ResultSet rs = stm.executeQuery();
        while (rs.next()) 
            list.add(new CategoryDTO(rs.getInt(1), rs.getString(2), rs.getString(3)));
        return list;
    }
    
    public CategoryDTO find(int cateId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<CategoryDTO> list = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("select category_id, name, icon "
                + "from category "
                + "where category_id = ? ");
        stm.setInt(1, cateId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) 
            return new CategoryDTO(rs.getInt(1), rs.getString(2), rs.getString(3));
        return null;
    }
    public static void main(String[] args) {
        CategoryDAO cateDAO = new CategoryDAO();
        try {
            System.out.println(cateDAO.find(1));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
