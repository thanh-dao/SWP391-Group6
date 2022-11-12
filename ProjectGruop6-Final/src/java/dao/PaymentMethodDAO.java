package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class PaymentMethodDAO {

    public String getName(int paymentId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [name] FROM payment_method WHERE payment_id = ?");
        stm.setInt(1, paymentId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getString("name");
        }
        return null;
    }
}
