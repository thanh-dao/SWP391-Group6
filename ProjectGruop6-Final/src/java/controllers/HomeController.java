/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.nio.file.Paths;
import config.Config;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import dto.BannerDTO;
import dto.CategoryDTO;
import dto.ProductDTO;
import dto.ReviewDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.Constants;

/**
 *
 * @author Admin
 */
@MultipartConfig
@WebServlet(name = "HomeController", urlPatterns = {"/home"})

public class HomeController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        System.out.println(action + " " + controller);
        HttpSession session = request.getSession();
        session.setAttribute("user", new UserDTO("ThinhPQSE151077@fpt.edu.vn", 
                "a", "TD", "DRAGON", null, null, null, 1));
        switch (action) {
            case "main": {
                CategoryDAO cateDAO = new CategoryDAO();
                ProductDAO proDAO = new ProductDAO();
//                BannerDAO b = new BannerDAO();
                try {
                    List<CategoryDTO> cateList = cateDAO.findAll();
                    session.setAttribute("cateList", cateList);
                    List<ProductDTO> bestSellers = proDAO.getProductList(0, ProductDAO.SOLD_COUNT, ProductDAO.DESC);
                    List<ProductDTO> newProducts = proDAO.getProductList(0, ProductDAO.APPROVE_AT, ProductDAO.DESC);
//                    BannerDTO banner = b.get(0);
                    request.setAttribute("bestSellers", bestSellers);
                    request.setAttribute("newProducts", newProducts);
//                    request.setAttribute("banner", banner);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            }

            case "productDetail": {
                ProductDAO proDAO = new ProductDAO();
                UserDAO userDAO = new UserDAO();
                ReviewDAO review = new ReviewDAO();
                try {
                    int productId = Integer.parseInt(request.getParameter("productId"));
                    ProductDTO product = proDAO.getProductById(productId);
                    UserDTO user = userDAO.getUserByProductId(productId);
                    List<ReviewDTO> reviewer = review.getReview(productId);
                    double rating = review.getAVGRatingOfProduct(productId);
                    List<ProductDTO> productList = proDAO.getProductList(1, Constants.ITEM_PER_PAGE_PRODUCT_DETAIL,
                            proDAO.SOLD_COUNT, proDAO.DESC, user.getEmail());
                    List<ProductDTO> productListCategory = proDAO.getProductList(1, Constants.ITEM_PER_PAGE_PRODUCT_DETAIL,
                            proDAO.SOLD_COUNT, proDAO.DESC, product.getCateId());
//                    System.out.println(user.toString());
//                    System.out.println(productListCategory);
                    request.setAttribute("rating", rating);
                    request.setAttribute("product", product);
                    request.setAttribute("seller", user);
                    request.setAttribute("reviewer", reviewer);
                    request.setAttribute("productList", productList);
                    request.setAttribute("productListCategory", productListCategory);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "uploadProduct":
                String name = request.getParameter("name");
                System.out.println("name: " + name);
                if (name != null) {
                    String price = request.getParameter("price").replace(",", "");
                    String quantity = request.getParameter("quantity").replace(",", "");;
                    String cateId = request.getParameter("cateId");
                    String description = request.getParameter("descriptionHidden");
                    String sellerEmail = request.getParameter("sellerEmail");
                    ProductDAO proDAO = new ProductDAO();
                    session.setAttribute("name", name);
                    try {
                        System.out.println("product created : " + proDAO.createProduct(name, cateId, quantity, price, description, sellerEmail));
                        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                        LocalDateTime now = LocalDateTime.now();
                        System.out.println(dtf.format(now));
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                }
                break;
            case "checkProduct":
                break;
            case "productList": {
                String cateIDStr = request.getParameter("cateId");
                int cateID = Integer.parseInt(cateIDStr);
                ProductDAO proDAO = new ProductDAO();
                try {
                    List<ProductDTO> productList = proDAO.getProductList(1, ProductDAO.NAME, ProductDAO.ASC, cateID);
                    int totalProduct = proDAO.countProductByCateId(cateIDStr);
                    int pageNum = totalProduct / Constants.ITEM_PER_PAGE + (totalProduct % Constants.ITEM_PER_PAGE == 0 ? 0 : 1);
                    request.setAttribute("productList", productList);
                    request.setAttribute("pageNum", pageNum);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "reviewProduct":
                break;
            case "searchProduct": {
                String productName = request.getParameter("name");
                System.out.println("productName: " + productName);
                ProductDAO proDAO = new ProductDAO();
                List<ProductDTO> productList = null;
                int totalProduct = 0;
                try {
                    productList = proDAO.getProductListByProductName(1, productName, ProductDAO.SOLD_COUNT, ProductDAO.DESC);
                    totalProduct = proDAO.countProductListByProductName(productName);
                    int pageNum = totalProduct / Constants.ITEM_PER_PAGE + (totalProduct % Constants.ITEM_PER_PAGE == 0 ? 0 : 1);
                    request.setAttribute("productList", productList);
                    request.setAttribute("pageNum", pageNum - 1);
                    request.setAttribute("action", "productList");
                } catch (ClassNotFoundException | SQLException ex) {
                    ex.printStackTrace();
                }
                break;
            }
            case "top": {
                ProductDAO proDAO = new ProductDAO();
                List<ProductDTO> productList = null;
                int totalProduct = 0;
                String top = request.getParameter("top");
                try {
                    switch (top) {
                        case "newest": {
                            productList = proDAO.getProductListByProductName(1, "", ProductDAO.APPROVE_AT, ProductDAO.DESC);
                            break;
                        }
                        case "soldCount": {
                            productList = proDAO.getProductListByProductName(1, "", ProductDAO.SOLD_COUNT, ProductDAO.DESC);
                            break;
                        }
                    }

                    totalProduct = proDAO.countProductListByProductName("");
                    int pageNum = totalProduct / Constants.ITEM_PER_PAGE + (totalProduct % Constants.ITEM_PER_PAGE == 0 ? 0 : 1);
                    request.setAttribute("productList", productList);
                    request.setAttribute("pageNum", pageNum - 1);
                    request.setAttribute("action", "productList");
                } catch (ClassNotFoundException | SQLException ex) {
                    ex.printStackTrace();
                }
                break;
            }
            default:
                //chuyển đến trang thông báo lỗi
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "Error when processing the request");
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
