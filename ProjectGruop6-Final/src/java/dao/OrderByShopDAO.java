package dao;

import dto.OrderByShopDTO;
import dto.OrderDTO;
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
        PreparedStatement stm = conn.prepareStatement("SELECT order_by_shop_id,"
                + " email_seller, status, transaction_fee, transport_fee, shipper_date "
                + "FROM order_by_shop WHERE order_id = ? ");
        stm.setInt(1, orderId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            UserDAO u = new UserDAO();
            UserDTO user = u.findUser(rs.getString("email_seller"));
            list.add(new OrderByShopDTO(rs.getInt("order_by_shop_id"),
                    rs.getString("email_seller"), user.getFirstName() + " " + user.getLastName(),
                    rs.getString("status"), rs.getDouble("transaction_fee"),
                    rs.getDouble("transport_fee"), rs.getDate("shipper_date"), null,
                    od.getOrderDetail(rs.getInt("order_by_shop_id")), 
                    totalOrderByShop(rs.getInt("order_by_shop_id"))));
        }
        return list;
    }

    //total
    public int totalOrderByShop(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT SUM(od.price) as total FROM\n"
                + "(SELECT order_by_shop_id FROM order_by_shop WHERE order_by_shop_id = ? ) os\n"
                + "LEFT JOIN order_detail od ON os.order_by_shop_id = od.order_by_shop_id");
        stm.setInt(1, orderByShopId);
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

    //delete orderByShop
    public void deleteOrderByShop(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("DELETE FROM order_by_shop"
                + " WHERE order_by_shop_id = ? ");
        stm.setInt(1, orderByShopId);
        stm.executeUpdate();
    }

    public static void main(String[] args) {
        try {
            OrderByShopDAO obs = new OrderByShopDAO();
//            obs.addOrderByShop(16, 157);
//            for (OrderByShopDTO o : obs.getOrderByShop(19)) {
//                if (o.getEmailSeller().equalsIgnoreCase("HanNTGSS170622@fpt.edu.vn")) {
//                    System.out.println("OK");
//
//                }
//                System.out.println(o.getStatus());
//            }
System.out.println(obs.totalOrderByShop(15));
     
//            System.out.println(obs.getOrderByShop(16).get);

//            obs.checkOrderByShop();
        } catch (Exception e) {
        }
    }
}
