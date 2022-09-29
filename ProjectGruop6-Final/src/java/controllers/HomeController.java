/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import config.Config;
import dao.CategoryDAO;
import dao.ProductDAO;
import dao.ReviewDAO;
import dao.UserDAO;
import dto.CategoryDTO;
import dto.ProductDTO;
import dto.ReviewDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
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
        switch (action) {
            case "main": {
                CategoryDAO cateDAO = new CategoryDAO();
                ProductDAO proDAO = new ProductDAO();
                try {
                    List<CategoryDTO> cateList = cateDAO.findAll();
                    cateList.forEach(i -> {
                        System.out.println(i);
                    });
                    session.setAttribute("cateList", cateList);
                    List<ProductDTO> bestSellers = proDAO.getProductList(0, ProductDAO.SOLD_COUNT, ProductDAO.DESC);
                    List<ProductDTO> newProducts = proDAO.getProductList(0, ProductDAO.APPROVE_AT, ProductDAO.DESC);
                    request.setAttribute("bestSellers", bestSellers);
                    request.setAttribute("newProducts", newProducts);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            }

            case "productDetail": {
                int productId = Integer.parseInt(request.getParameter("productId"));
                System.out.println(productId);
                ProductDAO proDAO = new ProductDAO();
                UserDAO userDAO = new UserDAO();
                ReviewDAO review = new ReviewDAO();
                try {
                    ProductDTO product = proDAO.getProductById(productId);
                    UserDTO user = userDAO.getUserByProductId(productId);
                    List<ReviewDTO> reviewer = review.getReview(productId);
                    double rating = review.getAVGRatingOfProduct(productId);
                    List<ProductDTO> productList = proDAO.getProductList(1, proDAO.SOLD_COUNT,
                            proDAO.DESC, user.getEmail());
                    request.setAttribute("rating", rating);
                    request.setAttribute("product", product);
                    request.setAttribute("seller", user);
                    request.setAttribute("reviewer", reviewer);
                    request.setAttribute("productList", productList);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "uploadProduct":
                break;
            case "checkProduct":
                break;
            case "productList":
                int cateId = Integer.parseInt(request.getParameter("cateId"));
                ProductDAO proDAO = new ProductDAO();
                try {
                    List<ProductDTO> productList = proDAO.getProductList(1, ProductDAO.NAME, ProductDAO.ASC, cateId);
                    request.setAttribute("productList", productList);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }

                break;
            case "reviewProduct":

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
