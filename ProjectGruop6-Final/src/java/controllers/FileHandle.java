/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ProductImageDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.FilenameUtils;
import utils.Constants;

/**
 *
 * @author kanek
 */
@WebServlet(name = "FileHandle", urlPatterns = {"/FileHandle"})
@MultipartConfig(location = Constants.IMAGE_DIRECTORY)
public class FileHandle extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        Collection<Part> part = request.getParts();
        ProductImageDAO pImageDAO = new ProductImageDAO();

        part.forEach(i -> {
            String fileName = getFileName(i);
            System.out.println(fileName);
            if (fileName != null) {
                try {
                    int imgCount = pImageDAO.countImage();
                    String localFileExtension =  FilenameUtils.getExtension(fileName);
                    String localFileName = Integer.toString(imgCount + 1);
                    i.write(localFileName + "." + localFileExtension);
                } catch (IOException | ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(FileHandle.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
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

    public String getFileName(Part path) {
        String contentDisposition = path.getHeader("content-disposition");
        if (contentDisposition.contains("filename=")) {
            int beginIndex = contentDisposition.indexOf("filename=") + 10;
            int endIndex = contentDisposition.length() - 1;
            return contentDisposition.substring(beginIndex, endIndex);
        }
        return contentDisposition;
    }
}
