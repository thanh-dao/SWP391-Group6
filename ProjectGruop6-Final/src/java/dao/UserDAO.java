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
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtil;

/**
 *
 * @author kanek
 */
public class UserDAO {

    /**
     * find a user in database
     *
     * @param email
     * @return UserDTO
     */
    public UserDTO findUser(String email) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select [email]\n"
                + "      ,[avatar]\n"
                + "      ,[first_name]\n"
                + "      ,[last_name]\n"
                + "      ,[phone]\n"
                + "      ,[yob]\n"
                + "      ,[address]\n"
                + "      ,[ward_id]\n"
                + "      ,[district_id]\n"
                + "      ,[city_id]\n"
                + "      ,[role_id]"
                + "  from FEP_user where email = ?");
        stm.setString(1, email);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            UserDTO user = new UserDTO(
                    rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4), rs.getString(5), rs.getDate(6), rs.getString(7),
                    rs.getString(8), rs.getString(9), rs.getString(10), rs.getInt(11)
            );
            return user;
        }

        return null;
    }

    /**
     * add user to database
     *
     * @param email
     * @param givenName
     * @param avatarLink
     * @return UserDTO
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public UserDTO addUser(String email, String givenName, String avatarLink) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        String[] splitedFullName = givenName.split(" ");
        String lastName = splitedFullName[0];
        String firstName = "";
        for (int i = 1; i < splitedFullName.length; i++) {
            firstName += splitedFullName[i];
            if (i != splitedFullName.length - 1) {
                firstName += " ";
            }
        }
        PreparedStatement stm = conn.prepareStatement("insert into FEP_user"
                + "(email, avatar, last_name, first_name, role_id)"
                + " values (?, ?, ?, ?, 0)");
        stm.setString(1, email);
        stm.setString(2, avatarLink);
        stm.setString(3, lastName);
        stm.setString(4, firstName);
        stm.executeUpdate();
        return new UserDTO(email, avatarLink, firstName, lastName);
    }

    public UserDTO getUserByProductId(int productId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT email, avatar, first_name, last_name, "
                + "phone, address, w.name, d.name, c.name FROM FEP_user u \n"
                + "LEFT JOIN ward w ON u.ward_id = w.ward_id\n"
                + "LEFT JOIN district d ON u.district_id = d.district_id\n"
                + "LEFT JOIN city c ON u.city_id = c.city_id\n"
                + "WHERE email = (SELECT email_seller FROM product WHERE product_id = ? )");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            UserDTO user = new UserDTO(
                    rs.getString(1), rs.getString(2), rs.getString(3),
                    rs.getString(4),  rs.getString(5), rs.getString(6),
                    rs.getString(7), rs.getString(8), rs.getString(9)
            );
            return user;
        }
        return null;
    }

    public static void main(String[] args) {
        UserDAO uDAO = new UserDAO();
        try {
            System.out.println(uDAO.getUserByProductId(149));
//            System.out.println(uDAO.addUser("thanhddse151068@fpt.edu.vn", "Dao Duc Thanh", "jajaaja"));
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
