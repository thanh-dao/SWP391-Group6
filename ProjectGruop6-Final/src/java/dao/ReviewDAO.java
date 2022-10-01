package dao;

import dto.ReviewDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

public class ReviewDAO {

    public List<ReviewDTO> getReview(int productId) throws ClassNotFoundException, SQLException {
        List<ReviewDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT u.avatar, u.first_name, "
                + "u.last_name, r.comment, r.rating, r.review_id FROM [user] u\n"
                + "RIGHT JOIN [order] od ON u.email = od.email_buyer\n"
                + "RIGHT JOIN order_by_shop os ON od.order_id = os.order_id\n"
                + "RIGHT JOIN (SELECT order_detail_id, order_by_shop_id \n"
                + "FROM [order_detail] WHERE product_id = ?) o ON os.order_by_shop_id = o.order_by_shop_id \n"
                + "LEFT JOIN review r ON r.order_detail_id = o.order_detail_id\n"
                + "ORDER BY r.review_id"
        );
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ReviewImageDAO ri = new ReviewImageDAO();
        while (rs.next()) {
            list.add(new ReviewDTO(
                    rs.getString("avatar"),
                    rs.getString("first_name") + " "
                    + rs.getString("last_name"),
                    rs.getDouble("rating"),
                    rs.getString("comment"),
                    ri.getReviewImage(rs.getInt("review_id"))
            ));
        }
        return list;
    }

    public double getAVGRatingOfProduct(int productId) throws ClassNotFoundException, SQLException {
        List<ReviewDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT AVG(r.rating)\n"
                + "FROM [order_detail] o\n"
                + "LEFT JOIN review r \n"
                + "ON r.order_detail_id = o.order_detail_id\n"
                + "WHERE product_id = ? "
        );
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ReviewImageDAO ri = new ReviewImageDAO();
        while (rs.next()) {
            return rs.getDouble(1);
        }
        return 0;
    }

    public static void main(String[] args) {
        ReviewDAO r = new ReviewDAO();
        try {
//            System.out.println(r.getReview(149));
            System.out.println(r.getAVGRatingOfProduct(162));
        } catch (Exception e) {
        }
    }
}
