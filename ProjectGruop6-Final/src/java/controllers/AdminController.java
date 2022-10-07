/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import config.Config;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import dto.ProductDTO;
import dto.ReviewDTO;
import dto.UserDTO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.Constants;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AdminControlller", urlPatterns = {"/admin"})
public class AdminController extends HttpServlet {

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

        switch (action) {
            case "adminAuthen":
                break;
            case "dashBroad":
                break;
            case "productAuthen": {
                ProductDAO proDAO = new ProductDAO();
                try {
                    List<ProductDTO> list = proDAO.getProductAdmin();
                    request.setAttribute("listProduct", list);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "checkProductAd": {
                int productId = Integer.parseInt(request.getParameter("productId"));
                System.out.println(productId);
                ProductDAO proDAO = new ProductDAO();
                UserDAO userDAO = new UserDAO();
                ReviewDAO review = new ReviewDAO();
                try {
                    ProductDTO product = proDAO.getProductByIdAd(productId);
                    UserDTO user = userDAO.getUserByProductId(productId);
                    List<ReviewDTO> reviewer = review.getReview(productId);
                    double rating = review.getAVGRatingOfProduct(productId);
                    List<ProductDTO> productList = proDAO.getProductList(1, Constants.ITEM_PER_PAGE_PRODUCT_DETAIL,
                            proDAO.SOLD_COUNT, proDAO.DESC, user.getEmail());
                    List<ProductDTO> productListCategory = proDAO.getProductList(1, Constants.ITEM_PER_PAGE_PRODUCT_DETAIL,
                            proDAO.SOLD_COUNT, proDAO.DESC, product.getCateId());
                    System.out.println(productListCategory);
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
            case "reviewAuthen":
                break;
            case "deleteProduct":
                break;
            default:
                //chuyển đến trang thông báo lổi
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
