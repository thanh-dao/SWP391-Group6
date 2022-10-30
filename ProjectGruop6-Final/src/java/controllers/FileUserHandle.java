/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.UserDAO;
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

/**
 *
 * @author kanek
 */
@WebServlet(name = "FileUserHandle", urlPatterns = {"/FileUserHandle"})
@MultipartConfig(location = Constants.IMAGE_ABSOLUTE_DIRECTORY)
public class FileUserHandle extends HttpServlet {

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
        HttpSession session = request.getSession();
        try {
            String userEmail = ((UserDTO) session.getAttribute("user")).getEmail();
            handleImage(request, userEmail);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void handleImage(HttpServletRequest request, String userEmail) throws IOException, ServletException {

        Collection<Part> part = request.getParts();
        HashSet<String> downloadedFiles = new HashSet<>();
        try {
            part.forEach(i -> {
                System.out.println(i);
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
            for (String string : arr) {
                System.out.println(string);
            }

            renameFileBaseOnImgId(request, arr, userEmail);
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

    public void renameFileBaseOnImgId(HttpServletRequest request, String[] arr, String userEmail) {
        for (int i = 0; i < arr.length; i++) {
            try {
                String currentFileName = arr[i];
                String localFileExtension = FilenameUtils.getExtension(currentFileName);
                String localFileName = userEmail + "." + localFileExtension;
                File newUserAvatar = new File(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + currentFileName);
                File downloadedUserAvatar = new File(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + localFileName);

                UserDAO uDAO = new UserDAO();
                
                File dir = new File(Constants.IMAGE_RELATIVE_DIRECTORY);
                File[] directoryListing = dir.listFiles();
                if (directoryListing != null) {
                    for (File image : directoryListing) {
                        if(image.getName().contains(userEmail)){
                            image.delete();
                        }
                    }
                }else{
                    System.out.println("directoryListing is null");
                }
                
                
                newUserAvatar.renameTo(downloadedUserAvatar);
                uDAO.updateUserAvatar(localFileName, userEmail);
                
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                user.setAvatarLink(localFileName);
                session.setAttribute("user", user);
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
