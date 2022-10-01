package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class OrderByShopDAO {
//create order when order null

    public void createOrderByShop(int orderId, String emailSeller) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [order_by_shop] "
                + "(order_id, email_seller) VALUES (?, ?)");
        stm.setInt(1, orderId);
        stm.setString(2, emailSeller);
        stm.executeUpdate();
    }

    //check null or not OrderByShop
    public void addOrderByShop(int orderId, int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        ProductDAO p = new ProductDAO();
        String emailSeller = p.getSellerEmailByProductId(productId);
        PreparedStatement stm = conn.prepareStatement("SELECT order_by_shop_id FROM order_by_shop "
                + "WHERE order_id = ? AND email_seller = ?");
        stm.setInt(1, orderId);
        stm.setString(2, emailSeller);
        ResultSet rs = stm.executeQuery();
        if (!rs.next()) {
            createOrderByShop(orderId, emailSeller);
            addOrderByShop(orderId, productId);
        } else {
            OrderDetailDAO od = new OrderDetailDAO();
            od.addOrderDetail(rs.getInt("order_by_shop_id"), productId);
        }
    }

    public static void main(String[] args) {
        try {
            OrderByShopDAO obs = new OrderByShopDAO();
            obs.addOrderByShop(16,  157);
        } catch (Exception e) {
        }
    }
}
