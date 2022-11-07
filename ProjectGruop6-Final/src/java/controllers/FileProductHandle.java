/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ProductDAO;
import dao.ProductImageDAO;
import dto.UserDTO;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashSet;
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
import org.apache.commons.io.FilenameUtils;
import utils.Constants;

@WebServlet(name = "FileProductHandle", urlPatterns = {"/FileProductHandle"})
@MultipartConfig(location = Constants.IMAGE_ABSOLUTE_DIRECTORY)
public class FileProductHandle extends HttpServlet {

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
        ProductDAO proDAO = new ProductDAO();
        HttpSession session = request.getSession();

        String sellerEmail = ((UserDTO) session.getAttribute("user")).getEmail();
        try {
            int productId = proDAO.getMaxId() + 1;
            handleImage(request, productId);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(FileProductHandle.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void renameFileBaseOnImgId(String[] arr, ProductImageDAO pImageDAO, int productId) {
        for (int i = 0; i < arr.length; i++) {
            try {
                String currentFileName = arr[i];
                int imgId = pImageDAO.getMaxId() + 1;
                String localFileExtension = FilenameUtils.getExtension(currentFileName);
                String localFileName = Integer.toString(imgId + 1) + "." + localFileExtension;
                String localFileDir = Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + localFileName;
                File file = new File(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + currentFileName);
                file.renameTo(new File(localFileDir));
                pImageDAO.addImage(productId, localFileName, i == 0);

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(FileProductHandle.class
                        .getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public String getFileName(Part path) {
        String contentDisposition = path.getHeader("content-disposition");
        if (contentDisposition.contains("filename=")) {
            int beginIndex = contentDisposition.indexOf("filename=") + 10;
            int endIndex = contentDisposition.length() - 1;
            return contentDisposition.substring(beginIndex, endIndex);
        }
        return contentDisposition;
    }

    public void handleImage(HttpServletRequest request, int productId) throws IOException, ServletException {
        Collection<Part> part = request.getParts();
        System.out.println(part);
        ProductImageDAO pImageDAO = new ProductImageDAO();
        HashSet<String> downloadedFiles = new HashSet<>();
        System.out.println(part);
        part.forEach(i -> {
            String fileName = getFileName(i);
            System.out.println(fileName);
            if (fileName != null) {
                try {
                    i.write(fileName);
                    downloadedFiles.add(fileName);

                } catch (IOException ex) {
                    Logger.getLogger(FileProductHandle.class
                            .getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        String[] arr = downloadedFiles.toArray(new String[downloadedFiles.size()]);
        System.out.println(arr);
        renameFileBaseOnImgId(arr, pImageDAO, productId);
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
