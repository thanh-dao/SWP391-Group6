/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kanek
 */
@WebServlet(name = "GetProductAjax", urlPatterns = {"/GetProductAjax"})
public class GetProductAjax extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        String sortOption = request.getParameter("option");
        ProductDAO proDAO = new ProductDAO();
        int cateID = Integer.parseInt(request.getParameter("cateID"));
        int pageNumber = Integer.parseInt(request.getParameter("pageNum"));
        int sortBy = 0;
        boolean dataTrend = true;
        if (sortOption != null) {
            switch (Integer.parseInt(sortOption)) {
                case 1: {
                    sortBy = ProductDAO.PRICE;
                    dataTrend = ProductDAO.ASC;
                    break;
                }
                case 2: {
                    sortBy = ProductDAO.PRICE;
                    dataTrend = ProductDAO.DESC;
                    break;
                }
                case 3: {
                    sortBy = ProductDAO.NAME;
                    dataTrend = ProductDAO.ASC;
                    break;
                }
                case 4: {
                    sortBy = ProductDAO.NAME;
                    dataTrend = ProductDAO.DESC;
                    break;
                }
                case 5: {
                    sortBy = ProductDAO.SOLD_COUNT;
                    dataTrend = ProductDAO.DESC;
                    break;
                }

            }
        }else {
            sortBy = ProductDAO.NAME;
            dataTrend = ProductDAO.ASC;
        }
        try {
            List<ProductDTO> sortedProductList = proDAO.getProductList(pageNumber, sortBy, dataTrend, cateID);
            Gson gson = new Gson();
            PrintWriter out = response.getWriter();
            out.print(gson.toJson(sortedProductList));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
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
