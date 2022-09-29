package dao;

import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import utils.Constants;
import utils.DBUtil;

public class ProductDAO {

    public static final int SOLD_COUNT = 1;

    public static final int PRICE = 2;

    public static final int NAME = 3;

    public static final int APPROVE_AT = 4;

    public static final boolean DESC = true;

    public static final boolean ASC = false;

    /**
     *
     * @return total number of products
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public int countProduct() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count(product_id) from product");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    /**
     *
     * @param option use static int variables in ProductDAO class
     * @param trend use static boolean variables in ProductDAO class
     * @return SQL orderby string. For ex: "order by name desc"
     *
     */
    public String getFilter(int option, boolean trend) {
        String orderBy = "";
        String trendStr = "";
        switch (option) {
            case 1: {
                orderBy = "sold_count";
                break;
            }
            case 2: {
                orderBy = "price";
                break;
            }
            case 3: {
                orderBy = "name";
                break;
            }
            case 4: {
                orderBy = "approve_at";
            }
        }
        if (trend == DESC) {
            trendStr = "desc";
        } else {
            trendStr = "asc";
        }
        return "  order by " + orderBy + " " + trendStr;
    }

    /**
     * < pre>
     * get the product list base on page number
     * for ex: when user click page 2, sort by name asc
     * the params should be: pageNum: 2, option: ProductDAO.NAME,
     * trend: ProductDAO.ASC
     * </pre>
     *
     * @param pageNum page number( for ex: 1, 2, 3, ...)
     * @param option use static int variables in ProductDAO class
     * @param trend use static boolean variables in ProductDAO class
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public List<ProductDTO> getProductList(int pageNum, int option, boolean trend) throws ClassNotFoundException, SQLException {
        int itemSkipped = pageNum * Constants.ITEM_PER_PAGE;
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("select [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[email_admin]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at] "
                + "      ,[sold_count] from product "
                + getFilter(option, trend)
                + " OFFSET " + itemSkipped + " ROWS \n"
                + " FETCH NEXT " + Constants.ITEM_PER_PAGE + " ROWS ONLY;");
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            list.add(
                    new ProductDTO(
                            id,
                            rs.getString("email_seller"),
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getString("description"),
                            rs.getInt("category_id"),
                            rs.getInt("quantity"),
                            rs.getString("email_admin"),
                            rs.getInt("status") == 1,
                            rs.getDate("create_at"),
                            rs.getDate("approve_at"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(id)
                    )
            );
        }
        return list;
    }

    /**
     * < pre>
     * return the product list base on page number
     * and category id
     * for ex: when user click page 2, sort by name asc, categoryId 3
     * the params should be: pageNum: 2, option: ProductDAO.NAME,
     * trend: ProductDAO.ASC, cateId: 3
     * </pre>
     *
     * @param pageNum page number( for ex: 1, 2, 3, ...)
     * @param option use static int variables in ProductDAO class
     * @param trend use static boolean variables in ProductDAO class
     * @param cateId foreign key categoryID
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public List<ProductDTO> getProductList(int pageNum, int option, boolean trend, int cateId) throws ClassNotFoundException, SQLException {
        int itemSkipped = (pageNum - 1) * Constants.ITEM_PER_PAGE;
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("select [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[email_admin]\n"
                + "      ,[status]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at] "
                + "      ,[sold_count] from product "
                + " where category_ID = ?"
                + getFilter(option, trend)
                + " OFFSET " + itemSkipped + " ROWS \n"
                + " FETCH NEXT " + Constants.ITEM_PER_PAGE + " ROWS ONLY;");
        stm.setInt(1, cateId);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            list.add(
                    new ProductDTO(
                            id,
                            rs.getString("email_seller"),
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getString("description"),
                            rs.getInt("category_id"),
                            rs.getInt("quantity"),
                            rs.getString("email_admin"),
                            rs.getInt("status") == 1,
                            rs.getDate("create_at"),
                            rs.getDate("approve_at"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(id)
                    )
            );
        }
        return list;
    }

    //productDetail khi đã đc duyệt
    public ProductDTO getProductById(int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[sold_count] from product "
                + " where product_id = ? AND status = 1");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            ProductDTO product = new ProductDTO(
                    id,
                    rs.getString("email_seller"),
                    rs.getString("name"),
                    rs.getLong("price"),
                    rs.getString("description"),
                    rs.getInt("category_id"),
                    rs.getInt("quantity"),
                    rs.getInt("sold_count"),
                    imageDAO.findAll(id)
            );
            return product;
        }
        return null;
    }

    //botton productDetail
    public List<ProductDTO> getProductList(int pageNum, int option, boolean trend, String emailSeller) throws ClassNotFoundException, SQLException {
        int itemSkipped = (pageNum - 1) * Constants.ITEM_PER_PAGE;
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("SELECT product_id, name, "
                + "price, quantity, sold_count  FROM product "
                + "WHERE email_seller = ?  AND status = 1 AND quantity > 0"
                + getFilter(option, trend)
                + " OFFSET " + itemSkipped + " ROWS \n"
                + " FETCH NEXT " + Constants.ITEM_PER_PAGE_PRODUCT_DETAIL + " ROWS ONLY;");
        stm.setString(1, emailSeller);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            int id = rs.getInt("product_id");
            list.add(
                    new ProductDTO(
                            id,
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getInt("quantity"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(id)
                    )
            );
        }
        return list;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        try {
//                       p.getProductList(1, ProductDAO.NAME, ProductDAO.DESC, 3).forEach(i -> {
//                           System.out.println(i.getName());
//                       });
//            System.out.println(p.getProductById(384));
            System.out.println(p.getProductList(1, SOLD_COUNT, DESC, "doanhtqse140876@fpt.edu.vn").size());
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
