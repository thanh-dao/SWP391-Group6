package dao;

import dto.BannerDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBUtil;

public class BannerDAO {

    public BannerDTO get(int bannerId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT banner_id, url, type_banner FROM banner "
                + "WHERE banner_id = ?");
        stm.setInt(1, bannerId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            BannerDTO b = new BannerDTO(rs.getInt("banner_id"),
                    rs.getString("url"), rs.getBoolean("type_banner"));
            return b;
        }
        return null;
    }
    public static void main(String[] args) {
        BannerDAO b = new BannerDAO();
        try {
            System.out.println(b.get(0));
        } catch (Exception e) {
        }
    }
}
