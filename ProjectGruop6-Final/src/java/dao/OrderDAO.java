package dao;

import dto.AddressDTO;
import dto.OrderDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class OrderDAO {

    //check status of order
    //chua dung den
    public OrderDTO getCart(String emailBuyer) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [order_id], delivery_id, "
                + "payment_id, email_buyer, order_date, status, address, ward_id, district_id, "
                + "city_id FROM [order] WHERE email_buyer = ? AND [status] = 0");
        stm.setString(1, emailBuyer);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            AddressDAO adr = new AddressDAO();
            AddressDTO address = new AddressDTO(rs.getString("address"), adr.get(rs.getString("ward_id"), adr.WARD),
                    adr.get(rs.getString("district_id"), adr.DISTRICT), adr.get(rs.getString("city_id"), adr.CITY));
            OrderDTO order = new OrderDTO(rs.getInt("order_id"), rs.getInt("delivery_id"),
                    rs.getInt("payment_id"), rs.getString("email_buyer"),
                    rs.getDate("order_date"), rs.getBoolean("status"), address);
            return order;
        }
        return null;
    }

    //addCart
    public void addCart(String emailBuyer, int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT order_id FROM [order] "
                + "WHERE email_buyer = ? AND [status] = 0");
        stm.setString(1, emailBuyer);
        ResultSet rs = stm.executeQuery();
        if (!rs.next()) {
            createOrder(emailBuyer);
            addCart(emailBuyer, productId);
        } else {
            OrderByShopDAO obs = new OrderByShopDAO();
            obs.addOrderByShop(rs.getInt("order_id"), productId);
        }
    }

    //create order when order null
    public void createOrder(String emailBuyer) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [order] (email_buyer) VALUES (?)");
        stm.setString(1, emailBuyer);
        stm.executeUpdate();
    }

    //chua dung den
    public void updateOrder(String emailBuyer, int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT * FROM [order] o \n"
                + "LEFT JOIN [order_by_shop] os ON o.order_id = os.order_id\n"
                + "LEFT JOIN [order_detail] od ON od.order_by_shop_id = os.order_by_shop_id\n"
                + "WHERE email_buyer = ? AND [status] = 0 AND product_id = ?");
        stm.setString(1, emailBuyer);
        stm.setInt(2, productId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            //chay updateOrderDetail
        } else {
            OrderByShopDAO obs = new OrderByShopDAO();
            ProductDAO p = new ProductDAO();
            obs.createOrderByShop(productId, p.getSellerEmailByProductId(productId));
        }
    }

    public static void main(String[] args) {
        OrderDAO d = new OrderDAO();
        try {
            d.addCart("ThinhPQSE151077@fpt.edu.vn", 158);
        } catch (Exception e) {
        }
    }
}
