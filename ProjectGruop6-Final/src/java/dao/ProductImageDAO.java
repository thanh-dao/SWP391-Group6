/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductImageDTO;
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
public class ProductImageDAO {

    /**
     *
     * @param productID
     * @return a list of product images
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public List<ProductImageDTO> findAll(int productID) throws SQLException, ClassNotFoundException {
        List<ProductImageDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select [image_id]\n"
                + "      ,[url]\n"
                + "      ,[is_main_img]"
                + " from image_product "
                + " where product_id = ? "
        );
        stm.setInt(1, productID);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            list.add(new ProductImageDTO(
                    rs.getInt("image_id"),
                    rs.getString("url"),
                    rs.getInt("is_main_img") == 1 ? true : false)
            );
        }
        return list;
    }

    public int countImage() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count([image_id])\n"
                + " from image_product "
        );
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }
    
    public int getMaxId() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select max(image_id) from image_product");
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public boolean addImage(String productId, String url, boolean isMainImage) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [dbo].[image_product]\n"
                + "           ([product_id]\n"
                + "           ,[url]\n"
                + "           ,[is_main_img] )\n"
                + " VALUES (? , ? , ?)");
        stm.setString(1, productId);
        stm.setString(2, url);
        stm.setString(3, isMainImage ? "1" : "0");
        return stm.executeUpdate() == 1;
    }

    public static void main(String[] args) {
        ProductImageDAO p = new ProductImageDAO();
        try {
            System.out.println(p.addImage("254", "https://salt.tikicdn.com/cache/w1200/ts/product/ac/65/00/9dfd638a9ac02b57d308672cdfbad506.jpg", true));
//            p.findAll(384).forEach(i -> {
//                System.out.println(i);
//            });
        } catch (SQLException ex) {
            Logger.getLogger(ProductImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductImageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
