package dao;

import dto.OrderByShopDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

public class OrderByShopDAO {

    //select all
    public List<OrderByShopDTO> getOrderByShop(int orderId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<OrderByShopDTO> list = new ArrayList();
        OrderDetailDAO od = new OrderDetailDAO();
        PreparedStatement stm = conn.prepareStatement("SELECT order_by_shop_id, order_id, "
                + "email_seller, status, transaction_fee, transport_fee, shipper_date, ship_id "
                + "FROM order_by_shop WHERE order_id = ? ");
        stm.setInt(1, orderId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            UserDTO user = new UserDAO().findUser(rs.getString("email_seller"));
            list.add(new OrderByShopDTO(rs.getInt("order_by_shop_id"), rs.getInt("order_id"),
                    rs.getString("email_seller"), user.getFirstName() + " " + user.getLastName(),
                    rs.getString("status"), rs.getDouble("transaction_fee"),
                    rs.getDouble("transport_fee"), rs.getDate("shipper_date"), null,
                    od.getOrderDetail(rs.getInt("order_by_shop_id")),
                    rs.getString("ship_id"), totalOrderByShop(rs.getInt("order_by_shop_id"))));
        }
        return list;
    }

    //select a
    public OrderByShopDTO getAOrderByShop(int obsId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT order_by_shop_id, order_id, "
                + "email_seller, status, transaction_fee, transport_fee, shipper_date, ship_id "
                + "FROM order_by_shop WHERE order_by_shop_id = ? ");
        stm.setInt(1, obsId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            UserDTO user = new UserDAO().findUser(rs.getString("email_seller"));
            OrderByShopDTO obs = new OrderByShopDTO(rs.getInt("order_by_shop_id"), rs.getInt("order_id"),
                    rs.getString("email_seller"), user.getFirstName() + " " + user.getLastName(),
                    rs.getString("status"), rs.getDouble("transaction_fee"),
                    rs.getDouble("transport_fee"), rs.getDate("shipper_date"), null,
                    new OrderDetailDAO().getOrderDetail(rs.getInt("order_by_shop_id")),
                    rs.getString("ship_id"), totalOrderByShop(rs.getInt("order_by_shop_id")));
            return obs;
        }
        return null;
    }

    //total
    public int totalOrderByShop(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT ((SELECT (transaction_fee + transport_fee)"
                + "FROM order_by_shop WHERE order_by_shop_id = ? )  + SUM(od.price)) as total FROM\n"
                + "(SELECT order_by_shop_id FROM order_by_shop WHERE order_by_shop_id = ? ) os \n"
                + "LEFT JOIN order_detail od ON os.order_by_shop_id = od.order_by_shop_id");
        stm.setInt(1, orderByShopId);
        stm.setInt(2, orderByShopId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("total");
        }
        return -1;
    }

    //check OrderByShop when order_detail null
    public void checkOrderByShop(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [order_detail_id] "
                + "FROM [order_detail] WHERE order_by_shop_id = ? ");
        stm.setInt(1, orderByShopId);
        ResultSet rs = stm.executeQuery();
        System.out.println(rs.next());
        if (!rs.next()) {
            deleteOrderByShop(orderByShopId);
        }
    }

    //create order when order null
    public void createOrderByShop(int orderId, OrderByShopDTO obs) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [order_by_shop] "
                + "(order_id, email_seller, transaction_fee, transport_fee, ship_id) "
                + "VALUES (?, ?, ?, ?, ?)");
        stm.setInt(1, orderId);
        stm.setString(2, obs.getEmailSeller());
        stm.setDouble(3, obs.getTransactionFee());
        stm.setDouble(4, obs.getTransportFee());
        stm.setString(5, obs.getShipId());
        stm.executeUpdate();
        for (OrderDetailDTO od : obs.getOrderDetailList()) {
            new OrderDetailDAO().createOrderDetail(getMaxId(), od);
        }
    }

    public int getMaxId() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT MAX(order_by_shop_id) as id FROM [order_by_shop]");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt("id");
        }
        return -1;
    }

    //check null or not OrderByShop
//    public void addOrderByShop(int orderId, int productId) throws ClassNotFoundException, SQLException {
//        Connection conn = DBUtil.getConnection();
//        ProductDAO p = new ProductDAO();
//        String emailSeller = p.getSellerEmailByProductId(productId);
//        PreparedStatement stm = conn.prepareStatement("SELECT order_by_shop_id FROM order_by_shop "
//                + "WHERE order_id = ? AND email_seller = ?");
//        stm.setInt(1, orderId);
//        stm.setString(2, emailSeller);
//        ResultSet rs = stm.executeQuery();
//        if (!rs.next()) {
//            createOrderByShop(orderId, emailSeller);
//            addOrderByShop(orderId, productId);
//        } else {
//            OrderDetailDAO od = new OrderDetailDAO();
//            od.addOrderDetail(rs.getInt("order_by_shop_id"), productId);
//        }
//    }
    //delete orderByShop
    public void deleteOrderByShop(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("DELETE FROM order_by_shop"
                + " WHERE order_by_shop_id = ? ");
        stm.setInt(1, orderByShopId);
        stm.executeUpdate();
    }

    public String getCancellationRate(String emailSeller) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT CAST("
                + "(SELECT CAST((SELECT COUNT(status) FROM order_by_shop "
                + "WHERE email_seller = ? AND status = 1) AS float) / \n"
                + "CAST((SELECT COUNT(status) FROM order_by_shop "
                + "WHERE email_seller = ?) AS float)*100) AS DECIMAL(4, 1)) as cr");
        stm.setString(1, emailSeller);
        stm.setString(2, emailSeller);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getString("cr");
        }
        return null;
    }

    public float getTotalRating(String emailSeller) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT CAST("
                + "(SELECT SUM(r.rating)/COUNT(r.rating) FROM \n"
                + "(SELECT email FROM [user] WHERE email = ?) u\n"
                + "LEFT JOIN order_by_shop obs ON obs.email_seller = u.email\n"
                + "LEFT JOIN order_detail od ON od.order_by_shop_id = obs.order_by_shop_id\n"
                + "LEFT JOIN review r ON r.order_detail_id = od.order_detail_id) "
                + "AS DECIMAL(4, 1)) as rating");
        stm.setString(1, emailSeller);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getFloat("rating");
        }
        return -1;
    }

    public boolean cancelOrderByShop(int obsId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("UPDATE order_by_shop\n"
                + "SET [status] = 0 \n"
                + "WHERE order_by_shop_id = ? ");
        stm.setInt(1, obsId);
        return stm.executeUpdate() == 1;
    }

    public static void main(String[] args) {
        try {
            OrderByShopDAO obs = new OrderByShopDAO();
            System.out.println(obs.totalOrderByShop(15));
            ;
        } catch (Exception e) {
        }
    }
}
