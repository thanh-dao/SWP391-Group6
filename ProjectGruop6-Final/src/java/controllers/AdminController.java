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
import javax.servlet.http.HttpSession;
import javax.websocket.Session;
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
        HttpSession session = (HttpSession) request.getSession();
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
                    List<ProductDTO> list = proDAO.getProductAdmin(ProductDAO.CREATE_AT, ProductDAO.ASC);
                    request.setAttribute("listProduct", list);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "checkProductAd": {
                int productId = Integer.parseInt(request.getParameter("productId"));
                ProductDAO proDAO = new ProductDAO();
                UserDAO userDAO = new UserDAO();
                try {
                    ProductDTO product = proDAO.getProductByIdAd(productId);
                    UserDTO user = userDAO.getUserByProductId(productId);
                    request.setAttribute("product", product);
                    request.setAttribute("seller", user);
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "approvingProduct": {
                int productId = Integer.parseInt(request.getParameter("productId"));
                UserDTO user = (UserDTO) session.getAttribute("user");
                ProductDAO proDAO = new ProductDAO();
                String acction = request.getParameter("acction");
                try {
                    proDAO.approveProduct(user.getEmail(), productId, acction);
                } catch (Exception e) {
                }

                System.out.println(productId);
                System.out.println(user.getEmail());
                System.out.println(acction);
                try {

                    List<ProductDTO> list = proDAO.getProductAdmin(ProductDAO.CREATE_AT, ProductDAO.ASC);
                    request.setAttribute("listProduct", list);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                request.setAttribute("controller", "admin");
                request.setAttribute("action", "productAuthen");
            }
            break;
            case "reviewAuthen":
                break;
            case "deleteProduct": {
                ProductDAO proDAO = new ProductDAO();
                try {
                    List<ProductDTO> productList = proDAO.getProductApproved(ProductDAO.APPROVE_AT, ProductDAO.DESC);
                    request.setAttribute("product", productList);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
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
