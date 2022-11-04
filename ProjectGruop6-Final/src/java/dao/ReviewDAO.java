package dao;

import com.google.gson.Gson;
import dto.ReviewDTO;
import dto.ReviewImageDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import utils.DBUtil;

public class ReviewDAO {

    public int getReviewId(int orderDetailId, int producId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select review_id from review r \n"
                + "inner join order_detail od on r.order_detail_id = od.order_detail_id\n"
                + "where r.order_detail_id = ? and od.product_id = ? ");
        stm.setInt(1, orderDetailId);
        stm.setInt(2, producId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public int getMaxReviewId() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select max(review_id) from review");
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public List<ReviewDTO> getReview(int productId) throws ClassNotFoundException, SQLException {
        List<ReviewDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT u.avatar, u.first_name, "
                + "u.last_name, r.comment, r.rating, r.date, r.review_id FROM [user] u\n"
                + "RIGHT JOIN [order] od ON u.email = od.email_buyer\n"
                + "RIGHT JOIN order_by_shop os ON od.order_id = os.order_id\n"
                + "RIGHT JOIN (SELECT order_detail_id, order_by_shop_id \n"
                + "FROM [order_detail] WHERE product_id = ?) o ON os.order_by_shop_id = o.order_by_shop_id \n"
                + "LEFT JOIN review r ON r.order_detail_id = o.order_detail_id\n"
                + "WHERE r.status = 1 ORDER BY r.review_id"
        );
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ReviewImageDAO ri = new ReviewImageDAO();
        while (rs.next()) {
            list.add(new ReviewDTO(
                    rs.getInt("review_id"),
                    rs.getString("avatar"),
                    rs.getString("first_name") + " "
                    + rs.getString("last_name"),
                    Double.parseDouble(String.format("%,.1f", rs.getDouble("rating"))),
                    rs.getString("comment"),
                    rs.getDate("date"),
                    ri.getReviewImage(rs.getInt("review_id"))
            ));
        }
        return list;
    }

    public double getAVGRatingOfProduct(int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT AVG(r.rating)\n"
                + "FROM [order_detail] o\n"
                + "LEFT JOIN review r \n"
                + "ON r.order_detail_id = o.order_detail_id\n"
                + "WHERE product_id = ? "
        );
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        rs.next();
        return Double.parseDouble(String.format("%,.1f", rs.getDouble(1)));
    }

    public List<ReviewDTO> getListReviewForCheck(int option, boolean existAdmin) throws ClassNotFoundException, SQLException {
        String o = "status ";
        if (option == 1 && existAdmin) {
            o += "= 1";
        } else if (option == 0 && existAdmin) {
            o += "= 0";
        } else if (option == -1 && !existAdmin) {
            o += "is null AND email_admin is null";
        } else {
            o = null;
        }
        List<ReviewDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT p.product_id, u.avatar, u.first_name, u.last_name, r.comment, r.rating, r.date, r.review_id, r.email_admin, r.status \n"
                + "FROM (SELECT * FROM review WHERE " + o + ") r\n"
                + "LEFT JOIN [order_detail] o ON r.order_detail_id = o.order_detail_id \n"
                + "LEFT JOIN order_by_shop os ON o.order_by_shop_id = os.order_by_shop_id\n"
                + "LEFT JOIN [order] od ON od.order_id = os.order_id\n"
                + "LEFT JOIN [user] u ON u.email = od.email_buyer\n"
                + "LEFT JOIN product p ON o.product_id = p.product_id\n"
                + "ORDER BY r.date"
        );
        ResultSet rs = stm.executeQuery();
        ReviewImageDAO ri = new ReviewImageDAO();
        ProductDAO p = new ProductDAO();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        while (rs.next()) {
            list.add(new ReviewDTO(
                    rs.getInt("review_id"),
                    rs.getString("avatar"),
                    rs.getString("first_name") + " "
                    + rs.getString("last_name"),
                    Double.parseDouble(String.format("%,.1f", rs.getDouble("rating"))),
                    rs.getString("comment"),
                    rs.getDate("date"),
                    rs.getString("email_admin"),
                    rs.getBoolean("status"),
                    ri.getReviewImage(rs.getInt("review_id")),
                    p.getProductById(rs.getInt("product_id"))
            ));
        }
        return list;
    }

    public int getTotalReview() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count(review.review_id) from review");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public int getCountRating(String emailSeller, int rating) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT COUNT(r.review_id) as [count] FROM\n"
                + "(SELECT product_id FROM product WHERE email_seller = ? ) u\n"
                + "LEFT JOIN order_detail od ON u.product_id = od.product_id\n"
                + "LEFT JOIN review r ON r.order_detail_id = od.order_detail_id\n"
                + "LEFT JOIN order_by_shop os ON os.order_by_shop_id = od.order_by_shop_id\n"
                + "LEFT JOIN [order] o ON o.order_id = os.order_id\n"
                + "WHERE r.rating >= ? AND r.rating < ? ");
        stm.setString(1, emailSeller);
        stm.setInt(2, rating);
        stm.setInt(3, rating + 1);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public ArrayList<Integer> getTotalReviewCurrentRating(String emailSeller, int monthNumber) throws ClassNotFoundException, SQLException {
        ArrayList<Integer> arr = new ArrayList<>();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        for (int i = 0; i >= currentMonth - monthNumber; i--) {
            arr.add(getCountRating(emailSeller, i));
        }
        return arr;
    }

    public int getTotalReview(int month) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count(review.review_id) from review where month([date])=  ?");
        stm.setInt(1, month);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public ArrayList<Integer> getTotalReviewCurrentMonths(int monthNumber) throws ClassNotFoundException, SQLException {
        ArrayList<Integer> arr = new ArrayList<>();
        int currentMonth = Calendar.getInstance().get(Calendar.MONTH) + 1;
        for (int i = currentMonth - 1; i >= currentMonth - monthNumber; i--) {
            arr.add(getTotalReview(i));
        }
        return arr;
    }

    public String getReviewJson(List<ReviewDTO> reviewList) throws ClassNotFoundException, SQLException {
        Gson gson = new Gson();
        HashMap<String, String> hashmap = new HashMap<>();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String a = "[";
        for (ReviewDTO r : reviewList) {
            hashmap.put("reviewId", String.valueOf(r.getReviewId()));
            hashmap.put("date", formatter.format(r.getDate()));
            hashmap.put("userName", r.getName());
            hashmap.put("productId", String.valueOf(r.getProduct().getProductId()));
            hashmap.put("productName", r.getProduct().getName());
            hashmap.put("productImage", r.getProduct().getMainImage().getUrl());
            hashmap.put("rating", String.valueOf(r.getRating()));
            hashmap.put("comment", r.getComment());
            for (int i = 0; i < 5; i++) {
                if (i < r.getImage().size()) {
                    hashmap.put("image" + i, r.getImage().get(i).getUrl());
                } else {
                    hashmap.put("image" + i, "");
                }
            }
            a += gson.toJson(hashmap) + ",";
        }
        return a + "]";
    }

    public boolean updateReview(String emailAdmin, int reviewId, boolean status) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("UPDATE review \n"
                + "SET email_admin = ?, status = ? \n"
                + "WHERE review_id = ?");
        stm.setString(1, emailAdmin);
        stm.setBoolean(2, status);
        stm.setInt(3, reviewId);
        return stm.executeUpdate() == 1;
    }

    public boolean createReview(ReviewDTO review) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [dbo].[review]\n"
                + "           ([order_detail_id]\n"
                + "           ,[rating]\n"
                + "           ,[comment]\n"
                + "           ,[email_admin]\n"
                + "           ,[status]\n"
                + "           ,[date])\n"
                + "values \n"
                + "(?, ?, ?, ?, ?, ?)");
        stm.setInt(1, review.getOrderDetailId());
        stm.setDouble(2, review.getRating());
        stm.setString(3, review.getComment());
        stm.setString(4, review.getEmailAdmin());
        stm.setBoolean(5, review.isStatus());
        stm.setDate(6, (java.sql.Date) review.getDate());
        return stm.executeUpdate() == 1;
    }

    public static void main(String[] args) {
        ReviewDAO r = new ReviewDAO();
        try {
            System.out.println(r.getReviewId(63, 149));
//            System.out.println(r.updateReview("ThinhPQSE151077@fpt.edu.vn", 25, true));
        } catch (Exception e) {
        }
    }
}
