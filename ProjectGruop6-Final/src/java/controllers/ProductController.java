package controllers;

import config.Config;
import dao.ProductImageDAO;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Collection;
import java.util.LinkedHashMap;
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
        try {
            if (request.getParameter("pId") != null) {
                request.setAttribute("pId", request.getParameter("pId"));
                if (request.getParameter("func") != null
                        && request.getParameter("listId") != null) {
                    if (request.getParameter("func").equalsIgnoreCase("delete")) {
                        String[] pIdList = request.getParameter("listId")
                                .replace("[", "").replace("]", "").split(",");
                        int[] arrpId = new int[pIdList.length];
                        for (int i = 0; i < pIdList.length; i++) {
                            if (!pIdList[i].isEmpty()) {
                                arrpId[i] = Integer.parseInt(pIdList[i]);
                                System.out.println(arrpId[i]);
//                                new ProductImageDAO().deleteImgProduct(arrpId[i]);
                            }
                        }
                    }
                } else {
                    int pId = Integer.parseInt(request.getParameter("pId"));
                    System.out.println("-i-");
                    //        String name = (String) request.getParameter("name");
//        int price = Integer.parseInt((String)request.getParameter("price"));
//        float quantity = Float.parseFloat((String)request.getParameter("quantity"));
                    System.out.println("name: " + (String) request.getParameter("name"));
                    System.out.println("price: " + (String) request.getParameter("price"));
                    System.out.println("quantity: " + (String) request.getParameter("quantity"));
                    System.out.println("---------1-------");
                    Collection<Part> part = request.getParts();
                    part.forEach(i -> {
                        System.out.println(i.getSubmittedFileName());
                    });
                    System.out.println(part);
                    Part p1 = request.getPart("img1");
                    Part p2 = request.getPart("img2");
                    Part p3 = request.getPart("img3");
                    Part p4 = request.getPart("img4");
                    LinkedHashMap<String, Part> arr = new LinkedHashMap();
                    arr.put(pId + "_img1", p1);
                    arr.put(pId + "_img2", p2);
                    arr.put(pId + "_img3", p3);
                    arr.put(pId + "_img4", p4);
                    arr.forEach((key, value) -> {
                        try {
                            handleImage(key, value);
                        } catch (IOException ex) {
                            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    });
                    System.out.println("part1 " + p1.getSubmittedFileName());

                    System.out.println("--------2--------");
                }
            } else {
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "Error when processing the request");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
    }

    public void handleImage(String key, Part part) throws IOException {
        String fileName = part.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            String e = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            findImage(key);
            //insert
            part.write(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + key + e);
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
