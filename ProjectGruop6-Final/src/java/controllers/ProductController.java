package controllers;

import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
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
import utils.Constants;

@MultipartConfig
@WebServlet(name = "CreateProduct", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        String name = (String) request.getAttribute("name");
//        int price = Integer.parseInt((String)request.getAttribute("price"));
//        float quantity = Float.parseFloat((String)request.getAttribute("quantity"));
        System.out.println("name: " + (String) request.getParameter("name"));
        System.out.println("price: " + (String) request.getParameter("price"));
        System.out.println("quantity: " + (String) request.getParameter("quantity"));
        System.out.println("----------------");
        Collection<Part> part = request.getParts();
        part.forEach(i -> {
            System.out.println(i.getSubmittedFileName());
        });
        System.out.println(part);
//        handleImage(part, String.valueOf(pId));
        System.out.println("----------------");

    }

    public void handleImage(Collection<Part> part, String pId) throws IOException {
        int index = 0;
        for (Part p : part) {
            String fileName = p.getSubmittedFileName();
            if (fileName != null && !fileName.isEmpty()) {
                try {
                    String e = fileName.substring(fileName.lastIndexOf("."), fileName.length());
                    index++;
                    String newName = pId + "_" + String.valueOf(index);
                    findImage(newName);
                    p.write(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + newName + e);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public void findImage(String urlImage) {
        File f = new File(Paths.get(Constants.IMAGE_ABSOLUTE_DIRECTORY).toString());
        File[] matchingFiles = f.listFiles(new FilenameFilter() {
            public boolean accept(File dir, String name) {
                if (name.startsWith(urlImage)) {
                    try {
                        Files.deleteIfExists(Paths.get(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + name));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                return name.startsWith(urlImage);
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

}
