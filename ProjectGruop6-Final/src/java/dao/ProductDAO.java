package dao;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import dto.ProductDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
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

    public List<ProductDTO> getTop10ProductByShop(String sellerEmail, int month, boolean trend)
            throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        String query = "SELECT TOP 10 od.product_id, p.name, SUM(od.quantity) as sold_count FROM\n"
                + "(SELECT email FROM [user] WHERE email = ? ) u\n"
                + "LEFT JOIN product p ON p.email_seller = u.email\n"
                + "LEFT JOIN order_detail od ON od.product_id = p.product_id\n"
                + "LEFT JOIN order_by_shop os ON os.order_by_shop_id = od.order_by_shop_id\n"
                + "LEFT JOIN [order] o ON o.order_id = os.order_id\n"
                + "WHERE MONTH([order_date]) = ?\n"
                + "GROUP BY od.product_id, p.name";
        if (trend == ASC) {
            query += "\n order by sum(od.quantity)";
        } else {
            query += "\n order by sum(od.quantity) desc";
        }
        PreparedStatement stm = conn.prepareStatement(query);
        stm.setString(1, sellerEmail);
        stm.setInt(2, month);
        List<ProductDTO> list = new ArrayList();
        ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setProductId(rs.getInt("product_id"));
            product.setName(rs.getString("name"));
            product.setSoldCount(rs.getInt("sold_count"));
            list.add(product);
        }
        return list;
    }

    public ProductDTO getProductBySellerAndName(String sellerEmail, String productName) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[email_admin]\n"
                + "      ,[authen]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[sold_count]\n"
                + "  FROM [FEP_DB].[dbo].[product]\n"
                + "  where name = ? and email_seller = ? ");
        stm.setString(1, productName);
        stm.setString(2, sellerEmail);
        ResultSet rs = stm.executeQuery();
        ProductDTO product = null;
        if (rs.next()) {
            product = new ProductDTO();
            product.setProductId(rs.getInt("product_id"));
            product.setEmailSeller(rs.getString("email_seller"));
            product.setName(rs.getString("name"));
            product.setPrice(rs.getInt("price"));
            product.setDescription(rs.getString("description"));
            product.setCateId(rs.getInt("category_id"));
            product.setQuantity(rs.getInt("quantity"));
            product.setEmailAdmin(rs.getString("email_admin"));
            product.setAvalable(rs.getInt("authen") == 1);
            product.setApproveAt(rs.getDate("approve_at"));
            product.setCreateAt(rs.getDate("create_at"));
            product.setSoldCount(rs.getInt("sold_count"));
        }
        return product;
    }

    public int getMaxId() throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("select max(product_id) from product");
        ResultSet rs = stm.executeQuery();
        if (rs.next()) {
            return rs.getInt(1);
        }
        return -1;
    }

    public boolean createProduct(
            String name, String cateId,
            String quantity, String price,
            String description, String sellerEmail
    ) throws SQLException, ClassNotFoundException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("INSERT INTO [dbo].[product]\n"
                + "           ([email_seller]\n"
                + "           ,[name]\n"
                + "           ,[price]\n"
                + "           ,[description]\n"
                + "           ,[category_id]\n"
                + "           ,[quantity]\n"
                + "           ,[authen]\n"
                + "           ,[create_at]\n"
                + ")\n"
                + "     VALUES "
                + " ( ?, ?, ?, ?, ?, ?, 0, ?) ");
        stm.setString(1, sellerEmail);
        stm.setString(2, name);
        stm.setString(3, price);
        stm.setString(4, description);
        stm.setString(5, cateId);
        stm.setString(6, quantity);
        stm.setDate(7, new java.sql.Date(new Date().getTime()));
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
                + "      ,[authen]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at] "
                + "      ,[sold_count] from product "
                + "where email_admin is not null  "
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
                            rs.getInt("authen") == 1,
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
                + "      ,[authen]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at] "
                + "      ,[sold_count] from product "
                + " where category_ID = ? "
                + " and email_admin is not null"
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
                            rs.getInt("authen") == 1,
                            rs.getDate("create_at"),
                            rs.getDate("approve_at"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(id)
                    )
            );
        }
        return list;
    }

    public List<ProductDTO> getProductListByProductName(int pageNum, String productName, int option, boolean trend) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList<>();
        String query = "select [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[email_admin]\n"
                + "      ,[authen]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at]\n"
                + "      ,[sold_count]"
                + " from product "
                + " where name like ? "
                + " and email_admin is not null "
                + getFilter(option, trend)
                + " offset ? rows "
                + " fetch NEXT ? rows only";
        int itemSkipped = (pageNum - 1) * Constants.ITEM_PER_PAGE;

        PreparedStatement stm = conn.prepareStatement(query);
        stm.setString(1, "%" + productName + "%");
        stm.setInt(2, itemSkipped);
        stm.setInt(3, Constants.ITEM_PER_PAGE);
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
                            rs.getInt("authen") == 1,
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
                + " and email_admin  is not null"
                + " order by name "
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

    //chua su dung
    public ProductDTO getProductById(int productId, int authen, int optionAdmin) throws ClassNotFoundException, SQLException {
        String strStatus = "";
        String strOptionAdmin = "";
        if (optionAdmin == 1) {
            strOptionAdmin = " AND email_admin is not null ";
        } else if (optionAdmin == 0) {
            strOptionAdmin = " AND email_admin is null ";
        }
        if (authen == 1) {
            strStatus = "authen = 1";
        } else if (authen == 0) {
            strStatus = "authen = 0";
        }
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[email_seller]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[category_id]\n"
                + "      ,[quantity]\n"
                + "      ,[sold_count] FROM product "
                + " WHERE product_id = ? " + strStatus + strOptionAdmin);
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
                + " WHERE product_id = ? AND email_admin is not null AND authen = 1");
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
                + "WHERE email_seller = ?  AND authen = 1 AND quantity > 0"
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

    //count product seller
    public int getCountProducts(String emailSeller) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT COUNT(product_id) [count] "
                + "FROM product WHERE email_seller = ?");
        stm.setString(1, emailSeller);
        ResultSet rs = stm.executeQuery();
        ProductImageDAO imageDAO = new ProductImageDAO();
        if (rs.next()) {
            return rs.getInt("count");
        }
        return -1;
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
                + "      ,[authen]\n"
                + "      ,[create_at]\n"
                + "      ,[approve_at] "
                + "      ,[sold_count] from product "
                + " where category_ID = ?"
                + " and email_admin  is not null "
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
                            rs.getInt("authen") == 1,
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
                + " WHERE email_admin is null AND authen is null "
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
                + "set authen = 0, email_admin = ? \n"
                + "WHERE product_id = ?");
        stm.setString(1, emailAdmin);
        stm.setString(2, productId);
        return stm.executeUpdate() == 1;
    }

    // xet duyet product
    public boolean approveProduct(String emailAdmin, int productId, String acction) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement(" UPDATE [dbo].[product]\n"
                + "SET email_admin = '" + emailAdmin + "' ,approve_at = '"
                + java.sql.Date.valueOf(LocalDate.now()).toString() + "' ,authen = ? \n"
                + "WHERE product_id = " + productId);
        if (acction.equalsIgnoreCase("Yes")) {
            stm.setInt(1, 1);
            System.out.println("HERE : " + stm.executeUpdate());
        } else {
            stm.setInt(1, 0);
        }
        System.out.println(stm.executeUpdate());
        return stm.executeUpdate() == 1;
    }

    //  list all product approved
    public List<ProductDTO> getProductApproved(int option, boolean trend) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        List<ProductDTO> list = new ArrayList();
        PreparedStatement stm = conn.prepareStatement("select [product_id], [email_seller], [name], [price], [description], [category_id], [quantity], [email_admin], [authen], [create_at], [approve_at], [sold_count] \n"
                + "from product \n"
                + " WHERE authen = 1"
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
                            rs.getInt("authen") == 1,
                            rs.getDate("create_at"),
                            rs.getDate("approve_at"),
                            rs.getInt("sold_count"),
                            imageDAO.findAll(id)
                    )
            );
        }
        return list;
    }

    public List<ProductDTO> getTop10ProductByMonth(int month) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT DISTINCT TOP 10 p.product_id, od.quantity, p.name FROM \n"
                + "(SELECT order_id FROM [order] WHERE MONTH([order_date]) = ?) o\n"
                + "LEFT JOIN order_by_shop os ON o.order_id = os.order_id\n"
                + "LEFT JOIN order_detail od ON od.order_by_shop_id = os.order_by_shop_id\n"
                + "LEFT JOIN product p ON p.product_id = od.product_id\n"
                + "order by od.quantity desc");
        stm.setInt(1, month);
        ResultSet rs = stm.executeQuery();
        List<ProductDTO> arr = new ArrayList<>();
        while (rs.next()) {
            ProductDTO product = new ProductDTO();
            product.setProductId(rs.getInt(1));
            product.setQuantity(rs.getInt(2));
            product.setName(rs.getString(3));
            arr.add(product);
        }
        return arr;
    }

    //--product list seller
    public List<ProductDTO> getProductListSeller(String emailSeller, int status, int authen) throws ClassNotFoundException, SQLException {
        String strStatus = " AND ";
        switch (status) {
            case 0: {
                strStatus += "status = 0";
            }
            break;
            case 1: {
                strStatus += "status = 1";
            }
            break;
            case -1: {
                strStatus += "authen is null";
            }
            break;
            case -2: {
                strStatus += "quantity <= 5";
            }
            break;
            default:
                strStatus = " ";
        }
        String strAuthen = " AND ";
        switch (authen) {
            case 0: {
                strAuthen += "authen = 0";
            }
            break;
            case 1: {
                strAuthen += "authen = 1";
            }
            break;
            case -1: {
                strAuthen += "authen is null";
            }
            break;
            default:
                strAuthen = " ";
        }
        Connection conn = DBUtil.getConnection();
        PreparedStatement stm = conn.prepareStatement("SELECT [product_id]\n"
                + "      ,[name]\n"
                + "      ,[price]\n"
                + "      ,[description]\n"
                + "      ,[create_at] FROM product\n"
                + " WHERE email_seller = ? " + strStatus + strAuthen);
        stm.setString(1, emailSeller);
        ResultSet rs = stm.executeQuery();
        List<ProductDTO> list = new ArrayList<>();
        while (rs.next()) {
            list.add(
                    new ProductDTO(
                            rs.getInt("product_id"),
                            rs.getString("name"),
                            rs.getLong("price"),
                            rs.getString("description"),
                            rs.getDate("create_at"),
                            new ProductImageDAO().findAll(rs.getInt("product_id"))
                    )
            );
        }
        return list;
    }

    //--product list seller
    public boolean handerProductSeller(int pId, String option, ProductDTO p) throws ClassNotFoundException, SQLException {
        Connection conn = DBUtil.getConnection();
        if (option.equalsIgnoreCase("ss") || option.equalsIgnoreCase("as")) {
            PreparedStatement stm = conn.prepareStatement("UPDATE product "
                    + "SET status = ? WHERE product_id = ? ");
            stm.setInt(1, option.equalsIgnoreCase("ss") ? 0 : 1);
            stm.setInt(2, pId);
            return stm.executeUpdate() == 1;
        } else if (option.equalsIgnoreCase("u") && p != null) {
            PreparedStatement stm = conn.prepareStatement("UPDATE product "
                    + "SET name = ?, price = ?, category_id = ?, [description] = ?, "
                    + "quantity = ?  WHERE product_id = ? ");
            stm.setString(1, p.getName());
            stm.setLong(2, p.getPrice());
            stm.setInt(3, p.getCateId());
            stm.setString(4, p.getDescription());
            stm.setInt(5, p.getQuantity());
            stm.setInt(6, pId);
            return stm.executeUpdate() == 1;
        } else if (option.equalsIgnoreCase("d")) {
            PreparedStatement stm = conn.prepareStatement("DELETE FROM product "
                    + "WHERE product_id = ? ");
            stm.setInt(1, pId);
            return stm.executeUpdate() == 1;
        }
        return false;
    }

    public String getProductListJson(List<ProductDTO> productList) throws ClassNotFoundException, SQLException {
        Gson gson = new Gson();
        HashMap<String, Object> hashmap = new HashMap<>();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
        String a = "[";
        for (ProductDTO p : productList) {
            hashmap.put("productId", String.valueOf(p.getProductId()));
            hashmap.put("date", formatter.format(p.getCreateAt()));
            hashmap.put("name", p.getName());
            hashmap.put("image", p.getMainImage() == null ? "" : p.getMainImage().getUrl());
            hashmap.put("price", String.valueOf(p.getPrice()));
            hashmap.put("description", String.valueOf(p.getDescription()));
            a += gson.toJson(hashmap) + ",";
        }
        return a + "]";
    }

    public ProductDTO getProductToJson(String json) {
        Gson gson = new Gson();
        JsonObject jobj = gson.fromJson(json, JsonObject.class);
        ProductDTO product = new ProductDTO();
        product.setProductId(jobj.get("pId").getAsInt());
        product.setName(jobj.get("name").getAsString());
        product.setPrice(jobj.get("price").getAsInt());
        product.setDescription(jobj.get("description").getAsString());
        product.setCateId(jobj.get("cateId").getAsInt());
        product.setQuantity(jobj.get("quantity").getAsInt());
        return product;
    }

    public static void main(String[] args) {
        ProductDAO p = new ProductDAO();
        try {
            String s = 1 + "_img";
            System.out.println(s);
        } catch (Exception e) {
//            e.fillInStackTrace();
            e.printStackTrace();
        }
    }
}
