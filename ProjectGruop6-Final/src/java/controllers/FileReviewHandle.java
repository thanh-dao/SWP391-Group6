/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.ProductDAO;
import dao.ProductImageDAO;
import dao.ReviewDAO;
import dao.ReviewImageDAO;
import dto.ReviewDTO;
import dto.UserDTO;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;
import java.util.Date;
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

@WebServlet(name = "FileReviewHandle", urlPatterns = {"/FileReviewHandle"})
@MultipartConfig(location = Constants.IMAGE_ABSOLUTE_DIRECTORY)
public class FileReviewHandle extends HttpServlet {

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
        String function = request.getParameter("func");
        ReviewDAO reviewDAO = new ReviewDAO();
        int odid = 0;
        int productId = 0;
        switch (function) {
            case "uploadReviewText": {
                try {
                    ReviewDTO review = new ReviewDTO();
                    odid = Integer.parseInt(request.getParameter("odid"));
                    review.setOrderDetailId(odid);
                    review.setRating(Double.parseDouble(request.getParameter("rating")));
                    productId = Integer.parseInt(request.getParameter("productId"));
                    review.setProductId(productId);
                    review.setComment(request.getParameter("comment"));
                    review.setDate(new java.sql.Date(new Date().getTime()));
                    reviewDAO.createReview(review);
                    
                } catch (ClassNotFoundException | SQLException ex) {
                    ex.printStackTrace();;
                }
                break;
            }
            case "uploadReviewImage": {
                try {
                    int reviewId = reviewDAO.getReviewId(odid, productId);
                    if (reviewId == -1) {
                        reviewId = reviewDAO.getMaxReviewId();
                    }
                    handleImage(request, reviewId);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(FileReviewHandle.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    }

    public void renameFileBaseOnImgId(String[] arr, ReviewImageDAO rImageDAO, int reviewId) {
        for (int i = 0; i < arr.length; i++) {
            try {
                String currentFileName = arr[i];
                int imgId = rImageDAO.getMaxId();
                String localFileExtension = FilenameUtils.getExtension(currentFileName);
                String localFileName ="re" + Integer.toString(imgId + 1) + "." + localFileExtension;
                String localFileDir = Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + localFileName;
                File file = new File(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + currentFileName);
                file.renameTo(new File(localFileDir));
                rImageDAO.addImage(Integer.toString(reviewId), localFileName);

            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(FileReviewHandle.class
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

    public void handleImage(HttpServletRequest request, int reviewId) throws IOException, ServletException {
        Collection<Part> part = request.getParts();
        System.out.println(part);
        ReviewImageDAO reviewImgDAO = new ReviewImageDAO();
        HashSet<String> downloadedFiles = new HashSet<>();
        part.forEach(i -> {
            String fileName = getFileName(i);
            System.out.println("File: " + fileName);
            if (fileName != null) {
                try {
                    i.write(fileName);
                    downloadedFiles.add(fileName);

                } catch (IOException ex) {
                    Logger.getLogger(FileReviewHandle.class
                            .getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        String[] arr = downloadedFiles.toArray(new String[downloadedFiles.size()]);
        System.out.println(arr);
        renameFileBaseOnImgId(arr, reviewImgDAO, reviewId);
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
