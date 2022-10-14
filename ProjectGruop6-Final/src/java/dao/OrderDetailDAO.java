package dao;

import dto.OrderDetailDTO;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

public class OrderDetailDAO {

    //select
    public List<OrderDetailDTO> getOrderDetail(int orderByShopId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<OrderDetailDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("SELECT order_detail_id, product_id, "
                + "quantity, price FROM order_detail WHERE order_by_shop_id = ? ");
        stm.setInt(1, orderByShopId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            ProductDAO p = new ProductDAO();
            ProductDTO product = p.getProductById(rs.getInt("product_id"));
            list.add(new OrderDetailDTO(rs.getInt("order_detail_id"), rs.getInt("product_id"),
                    rs.getInt("quantity"), p.getProductById(rs.getInt("product_id"))));
        }
        return list;
    }

//check status of order
    public void addOrderDetail(int orderByShopId, int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT quantity FROM [order_detail] "
                + "WHERE order_by_shop_id = ? AND product_id = ?");
        stm.setInt(1, orderByShopId);
        stm.setInt(2, productId);
        ResultSet rs = stm.executeQuery();
        if (!rs.next()) {
            createOrderDetail(orderByShopId, productId);
        } else {
            updateOrderDetail(orderByShopId, productId, rs.getInt("quantity") + 1, null);
        }
    }

    //create order when order null
    public void createOrderDetail(int orderByShopId, int productId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [order_detail] "
                + "(order_by_shop_id, product_id) VALUES (?, ?)");
        stm.setInt(1, orderByShopId);
        stm.setInt(2, productId);
        stm.executeUpdate();
    }

    //delete order
    public void deleteOrderDetail(int orderByShopId, int productId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("DELETE FROM [order_detail]"
                + " WHERE order_by_shop_id = ? AND product_id = ?");
        stm.setInt(1, orderByShopId);
        stm.setInt(2, productId);
        stm.executeUpdate();
    }

    //update quantity, price by orderByShopId, productId
    public void updateOrderDetail(int orderByShopId, int productId, int quantity, String price) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("UPDATE order_detail\n"
                + "SET quantity = ? , price = ?\n"
                + "WHERE order_by_shop_id = ? AND product_id = ?");
        stm.setInt(1, quantity);
        stm.setString(2, price);
        stm.setInt(3, orderByShopId);
        stm.setInt(4, productId);
        stm.executeUpdate();
    }

    public boolean checkQuantity(int orderByShopId, int productId) throws ClassNotFoundException, SQLException {
        Connection conn;
        conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT quantity FROM [order_detail] "
                + "WHERE order_by_shop_id = ? AND product_id = ?");
        stm.setInt(1, orderByShopId);
        stm.setInt(2, productId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            ProductDAO p = new ProductDAO();
            return rs.getInt("quantity") < p.getProductById(productId).getQuantity() ? true : false;
        }
        return false;
    }

    public static void main(String[] args) {
        OrderDetailDAO d = new OrderDetailDAO();
        try {
//            d.updateOrderDetail(14, 152, 3, null);
//            d.addOrderDetail(14, 150);
//            List<OrderDetailDTO> od = d.getOrderDetail(15);
//            System.out.println(od.get(0).getProduct().getMainImage().getUrl());
System.out.println(d.checkQuantity(14, 149));
        } catch (Exception e) {
        }
    }
}
