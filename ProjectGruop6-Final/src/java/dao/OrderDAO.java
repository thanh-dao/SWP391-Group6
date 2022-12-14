package dao;

import dto.AddressDTO;
import dto.OrderByShopDTO;
import dto.OrderDTO;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.DBUtil;

public class OrderDAO {

    //check status of order
    //chua dung den
    public OrderDTO getOrder(String emailBuyer, int status) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [order_id], delivery_id, "
                + "payment_id, email_buyer, order_date, status, address, ward_id, district_id, "
                + "city_id FROM [order] WHERE email_buyer = ? AND [status] = ?");
        stm.setString(1, emailBuyer);
        stm.setInt(2, status);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            AddressDAO adr = new AddressDAO();
            OrderByShopDAO ob = new OrderByShopDAO();
            AddressDTO address = new AddressDTO(rs.getString("address"), adr.get(rs.getString("ward_id"), adr.WARD),
                    adr.get(rs.getString("district_id"), adr.DISTRICT), adr.get(rs.getString("city_id"), adr.CITY));
            OrderDTO order = new OrderDTO(rs.getInt("order_id"), rs.getInt("delivery_id"),
                    rs.getInt("payment_id"), rs.getString("email_buyer"), rs.getDate("order_date"),
                    address, ob.getOrderByShop(rs.getInt("order_id")), getTotal(rs.getString("email_buyer")));
            return order;
        }
        return null;
    }

    public float getTotal(String emailBuyer) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT SUM(p.price) as total FROM\n"
                + "(SELECT order_id FROM [order] WHERE email_buyer = ?) o \n"
                + "LEFT JOIN [order_by_shop] os ON o.order_id = os.order_id\n"
                + "LEFT JOIN [order_detail] od ON od.order_by_shop_id = os.order_by_shop_id\n"
                + "LEFT JOIN product p ON p.product_id = od.product_id");
        stm.setString(1, emailBuyer);
        ResultSet rs = stm.executeQuery();
        rs.next();
        return Float.parseFloat(String.format("%.0f", rs.getFloat("total")));
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

    //deleteAProduct
    public void deleteAProduct(String emailBuyer, int productId) throws ClassNotFoundException, SQLException {
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

    //check Order when order_detail null
    public void checkOrder(int orderId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [order_by_shop_id] "
                + "FROM [order] WHERE orde_id = ? ");
        stm.setInt(1, orderId);
        ResultSet rs = stm.executeQuery();
        System.out.println(rs.next());
        OrderByShopDAO obs = new OrderByShopDAO();
        while (rs.next()) {
            obs.checkOrderByShop(rs.getInt("order_by_shop_id"));
        }
    }

    public int getTotalIncome(int month) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT SUM(od.price) FROM \n"
                + "(SELECT order_id FROM [order] WHERE MONTH([order_date]) = ?) o \n"
                + "LEFT JOIN order_by_shop os ON o.order_id = os.order_id\n"
                + "LEFT JOIN order_detail od ON od.order_by_shop_id = os.order_by_shop_id");
        stm.setInt(1, month);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) % 3 / 100;
        }
        return -1;
    }

    public int getTotalIncome() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT SUM(od.price) FROM \n"
                + "(SELECT order_id FROM [order]) o\n"
                + "LEFT JOIN order_by_shop os ON o.order_id = os.order_id\n"
                + "LEFT JOIN order_detail od ON od.order_by_shop_id = os.order_by_shop_id");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1) * 3 / 100;
        }
        return -1;
    }

    public int countOrder() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT max([order_id])\n"
                + "  FROM [FEP_DB].[dbo].[order]\n"
                + "  where status = 1");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public int getTotalOrder(int month) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count(order_id) from dbo.[order]\n"
                + "where month(order_date) = ?");
        stm.setInt(1, month);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public ArrayList<Integer> getTotalOrderCurrentMonths(int monthNumber) throws ClassNotFoundException, SQLException {
        ArrayList<Integer> arr = new ArrayList<>();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        for (int i = currentMonth - 1; i >= currentMonth - monthNumber; i--) {
            arr.add(getTotalOrder(i));
        }
        return arr;
    }

    public ArrayList<Integer> getTotalIncomeCurrentMonths(int monthNumber) throws ClassNotFoundException, SQLException {
        ArrayList<Integer> arr = new ArrayList<>();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        for (int i = currentMonth - 1; i >= currentMonth - monthNumber; i--) {
            arr.add(getTotalIncome(i));
        }
        return arr;
    }

    public static void main(String[] args) {

        String currentPath;
        try {
            currentPath = new java.io.File(".").getCanonicalPath();
            System.out.println("Current dir:" + currentPath);
            String currentDir = System.getProperty("user.dir");
            System.out.println("Current dir using System:" + currentDir);
        } catch (IOException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
