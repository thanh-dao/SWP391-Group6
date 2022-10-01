package dao;

import dto.ReviewDTO;
import dto.ReviewImageDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DBUtil;

public class ReviewImageDAO {
    public List<ReviewImageDTO> getReviewImage (int reviewId) throws ClassNotFoundException, SQLException {
        List<ReviewImageDTO> list = new ArrayList<>();
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT url "
                + "FROM image_review "
                + "WHERE review_id = ? "
                + "ORDER BY image_id"
        );
        stm.setInt(1, reviewId);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            list.add(new ReviewImageDTO(rs.getString("url")));
        }
        return list;
    }
    
    public static void main(String[] args) {
        ReviewImageDAO ri = new ReviewImageDAO();
        try {
            System.out.println(ri.getReviewImage(8));
        } catch (Exception e) {
        }
    }
}
