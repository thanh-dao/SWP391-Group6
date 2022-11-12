package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class DeliveryMethodDAO {
public String getName(int deliveryId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [name] FROM delivery_method WHERE delivery_id = ?");
        stm.setInt(1, deliveryId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getString("name");
        }
        return null;
    }
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        System.out.println(new DeliveryMethodDAO().getName(0));
    }
}

