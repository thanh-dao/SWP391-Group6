package dao;

import dto.ProductDTO;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import utils.Constants;
import utils.DBUtil;

public class ProductDAO {

    public static final int SOLD_COUNT = 1;

    public static final int PRICE = 2;

    public static final int NAME = 3;

    public static final int APPROVE_AT = 4;

    public static final int CREATE_AT = 5;

    public static final boolean DESC = true;

    public static final boolean ASC = false;

    /**
     *
     * @return total number of products
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public int countProductByCateId(String cateId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count(product_id) from product where category_id = ?");
        stm.setString(1, cateId);
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return 0;
    }

    public boolean createProduct(String name, String cateId,
            String quantity, String price,
            String description, String houseNumber,
            String cityId, String districtId,
            String sellerEmail) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [dbo].[product]\n"
                + "           ([email_seller]\n"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[category_id]\n"
                + "           ,[quantity]\n"
                + "           ,[status]\n"
                + "           ,[create_at] \n"
                + ")\n"
                + "     VALUES "
                + " ( ?, ?, ?, ?, ?, ?, 0, ?) ");
        stm.setString(1, sellerEmail);
        stm.setString(2, name);
        stm.setString(3, price);
        stm.setString(4, description);
        stm.setString(5, cateId);
        stm.setString(6, quantity);
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        Date date = new Date();  
        stm.setString(7, formatter.format(date));
        return stm.executeUpdate() == 1;
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
            case 5: {
                orderBy = "create_at";
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
     * get the product list base on page number for ex: when user click page 2,
     * sort by name asc the params should be: pageNum: 2, option:
     * ProductDAO.NAME, trend: ProductDAO.ASC
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
     * return the product list base on page number and category id for ex: when
     * user click page 2, sort by name asc, categoryId 3 the params should be:
     * pageNum: 2, option: ProductDAO.NAME, trend: ProductDAO.ASC, cateID: 3
     * </pre>
     *
     * @param pageNum page number( for ex: 1, 2, 3, ...)
     * @param option use static int variables in ProductDAO class
     * @param trend use static boolean variables in ProductDAO class
     * @param cateID foreign key categoryID
     * @return
     * @throws ClassNotFoundException
     * @throws SQLException
     */
    public List<ProductDTO> getProductList(int pageNum, int option, boolean trend, int cateID) throws ClassNotFoundException, SQLException {
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
        stm.setInt(1, cateID);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();

        ////////
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

    public List<ProductDTO> getProductListByProductName(int pageNum, String productName) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList<>();
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
                + "      ,[approve_at]\n"
                + "      ,[sold_count]"
                + " from product "
                + " where name like ? "
                + " order by sold_count "
                + " offset 0 rows "
                + " fetch first ? rows only");
        stm.setString(1, "%" + productName + "%");
        int itemSkipped = (pageNum - 1) * Constants.ITEM_PER_PAGE;
        stm.setInt(2, itemSkipped);
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

    public int countProductListByProductName(String productName) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select count([product_id])\n"
                + " from product "
                + "where name like ? ");
        stm.setString(1, "%" + productName + "%");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public String getSellerEmailByProductId(int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select email_seller from product "
                + "where product_id = ?");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        String sellerEmail = "";
        if (rs.next()) {
            sellerEmail = rs.getString("email_seller");
        }
        return sellerEmail;
    }

    public List<ProductDTO> getProductList(int size, String productName) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList<>();
        PreparedStatement stm = conn.prepareStatement("select product_id, name from product "
                + "where name like ? "
                + "order by name "
                + " offset 0 rows "
                + "fetch first ? rows only");
        stm.setString(1, "%" + productName + "%");
        stm.setInt(2, size);
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setProductId(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            list.add(product);
        }
        return list;
    }

    //productDetail khi đã đc duyệt
    public ProductDTO getProductById(int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[sold_count] FROM product "
                + " WHERE product_id = ? AND email_admin is not null");
        stm.setInt(1, productId);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            ProductDTO product = new ProductDTO(
                    rs.getInt("product_id"),
                    rs.getString("email_seller"),
                    rs.getString("name"),
                    rs.getLong("price"),
                    rs.getString("description"),
                    rs.getInt("category_id"),
                    rs.getInt("quantity"),
                    rs.getInt("sold_count"),
                    imageDAO.findAll(rs.getInt("product_id"))
            );
            return product;
        }
        return null;
    }

    //botton productDetailPage
    public List<ProductDTO> getProductList(int pageNum, int item_per_page, int option,
            boolean trend, String emailSeller) throws ClassNotFoundException, SQLException {
        int itemSkipped = (pageNum - 1) * item_per_page;
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("SELECT product_id, name, "
                + "price, quantity, sold_count  FROM product "
                + "WHERE email_seller = ?  AND status = 1 AND quantity > 0"
                + getFilter(option, trend)
                + " OFFSET " + itemSkipped + " ROWS \n"
                + " FETCH NEXT " + item_per_page + " ROWS ONLY;");
        stm.setString(1, emailSeller);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            list.add(
                    new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getInt("quantity"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(rs.getInt("product_id"))
                    )
            );
        }
        return list;
    }

    public List<ProductDTO> getProductList(int pageNum, int item_per_page, int option, boolean trend, int cateID) throws ClassNotFoundException, SQLException {
        int itemSkipped = (pageNum - 1) * item_per_page;
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
                + " FETCH NEXT " + item_per_page + " ROWS ONLY;");
        stm.setInt(1, cateID);
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
//------------------------------------------------------------
    //product list cho admin duyet

    public List<ProductDTO> getProductAdmin(int option, boolean trend) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[create_at]\n"
                + "      FROM product "
                + " WHERE email_admin is null"
                + getFilter(option, trend));
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        while (rs.next()) {
            list.add(
                    new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("email_seller"),
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getString("description"),
                            rs.getInt("category_id"),
                            rs.getInt("quantity"),
                            rs.getDate("create_at"),
                            imageDAO.findAll(rs.getInt("product_id"))
                    )
            );

        }
        return list;

    }

    //--product detail admin
    public ProductDTO getProductByIdAd(int productId) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[sold_count] FROM product "
                + " WHERE product_id = ?");
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

    public boolean deleteProduct(String productId, String emailAdmin) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("UPDATE [dbo].[product]\n"
                + "set status = 0, email_admin = ? \n"
                + "WHERE product_id = ?");
        stm.setString(1, emailAdmin);
        stm.setString(2, emailAdmin);
        return stm.executeUpdate() == 1;
    }

    // xet duyet product
    public boolean approveProduct(String emailAdmin, int productId, String acction) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        boolean result = true;
        PreparedStatement stm = conn.prepareStatement(" UPDATE [dbo].[product]\n"
                + "SET email_admin =" + emailAdmin + ", approve_at = " + java.sql.Date.valueOf(LocalDate.now()) + " , status = ? \n"
                + "WHERE product_id = " + productId);

        if (acction.equalsIgnoreCase("Yes")) {
            stm.setInt(1, 1);
        } else {
            stm.setInt(1, 0);
        }
        int count = stm.executeUpdate();
        if (count == 0) {
            result = false;
        }
        return result;
    }

    //  list all product approved
    public List<ProductDTO> getProductApproved(int option, boolean trend) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("select [product_id], [email_seller], [name], [price], [description], [category_id], [quantity], [email_admin], [status], [create_at], [approve_at], [sold_count] \n"
                + "from product \n"
                + " WHERE status = 1"
                + getFilter(option, trend));
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

    public void getJson() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        String sql = "SELECT ARRAY_TO_JSON(ARRAY_AGG(ROW_TO_JSON(data)))::varchar resubrow FROM (SELECT * FROM product)data;";
        Statement stm = conn.createStatement();
        ResultSet rs = stm.executeQuery(sql);
        String resubrow = "";

        if (rs.next()) {
            System.out.println(rs.getString("resubrow"));
            resubrow = rs.getString("resubrow");
        }

    }

    public static void main(String[] args) {
        ProductDAO proDAO = new ProductDAO();
        try {
            System.out.println(proDAO.createProduct("Con ga con", "1", "10", "800000", "hoholalahooh", "862", "79", "764", "thanhddse151068@fpt.edu.vn"));
        } catch (Exception e) {
//            e.fillInStackTrace();
            e.printStackTrace();
        }
    }
}
