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

    public boolean existUser(String email) {
        Connection conn;
        try {
            conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("select [email]"
                    + "  from FEP_user where email = ?");
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                if (rs.getString(1) != null) {
                    return true;
                } else {
                    return false;
                }
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public UserDTO findUser(String email) {
        Connection conn;
        try {
            conn = DBUtil.getConnection();
            PreparedStatement stm = conn.prepareStatement("select [email]\n"
                    + "      ,[avatar]\n"
                    + "      ,[full_name]"
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
                        rs.getString(4), rs.getDate(5), rs.getString(6), 
                        rs.getInt(7), rs.getInt(8), rs.getInt(8), rs.getInt(9)
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
        PreparedStatement stm = conn.prepareStatement("insert into FEB_user "
                + "(email, avatar, full_name, role_id)"
                + " values (?, ?, ?, 0)");
        stm.setString(1, email);
        stm.setString(2, avatarLink);
        stm.setString(3, givenName);
        stm.executeUpdate();
        return new UserDTO(email, avatarLink, givenName);
    }

    public static void main(String[] args) {
        UserDAO uDAO = new UserDAO();
        System.out.println(uDAO.findUser("AnhNTSS170758@fpt.edu.vn"));
    }
}
