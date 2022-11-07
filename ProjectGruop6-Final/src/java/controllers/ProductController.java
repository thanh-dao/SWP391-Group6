package controllers;

import config.Config;
import dao.ProductDAO;
import dao.ProductImageDAO;
import dto.UserDTO;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
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
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import utils.Constants;

@MultipartConfig
@WebServlet(name = "CreateProduct", urlPatterns = {"/product"})
public class ProductController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            if (request.getParameter("func") != null
                    && request.getParameter("listId") != null) {
                if (request.getParameter("func").equalsIgnoreCase("delete")) {
                    String[] pIdList = request.getParameter("listId")
                            .replace("[", "").replace("]", "").split(",");
                    int[] arrpId = new int[pIdList.length];
                    for (int i = 0; i < pIdList.length; i++) {
                        ProductImageDAO pi = new ProductImageDAO();
                        if (!pIdList[i].isEmpty()) {
                            arrpId[i] = Integer.parseInt(pIdList[i]);
                            System.out.println(arrpId[i]);
                            String url = pi.findImgUrl(arrpId[i]);
                            if (url != null ? url.split("/").length == 3 : false) {
                                findImage(url.split("/")[2].substring(0, url.split("/")[2].lastIndexOf(".")));
                            }
                            new ProductImageDAO().deleteImgProduct(arrpId[i]);
                        }
                    }
                }
            } else {
                ProductDAO p = new ProductDAO();
                int pId = request.getParameter("option").equalsIgnoreCase("create") ? p.getMaxId() + 1
                        : Integer.parseInt(request.getParameter("pId"));
                System.out.println(pId);
                String name = (String) request.getParameter("name");
                String price = (String) request.getParameter("price").replace(",", "");
                String quantity = (String) request.getParameter("quantity").replace(",", "");
                String cateId = (String) request.getParameter("cateId");
                String descripion = (String) request.getParameter("descriptionHidden");
                Part p0 = request.getPart("img0");
                Part p1 = request.getPart("img1");
                Part p2 = request.getPart("img2");
                Part p3 = request.getPart("img3");
                Part p4 = request.getPart("img4");
                LinkedHashMap<String, Part> arr = new LinkedHashMap();
                arr.put(pId + "_img0", p0);
                arr.put(pId + "_img1", p1);
                arr.put(pId + "_img2", p2);
                arr.put(pId + "_img3", p3);
                arr.put(pId + "_img4", p4);
                arr.forEach((key, value) -> {
                    System.out.println("MAP: " + key);
                    try {
                        handleImage(key, value, pId);
                    } catch (IOException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (SQLException ex) {
                        Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                });
                if (request.getParameter("option").equalsIgnoreCase("create")) {
                    System.out.println("CREATE");
                    HttpSession session = (HttpSession) request.getSession();
                    UserDTO user = (UserDTO) session.getAttribute("user");
                    p.createProduct(user.getEmail(), name, price, descripion, cateId, quantity);
                } else {
                    System.out.println("UPDATE");
                    p.updateProduct(pId, name, price, descripion, cateId, quantity);
                }
                request.setAttribute("controller", "order");
                request.setAttribute("action", "stored");
                request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void handleImage(String key, Part part, int pId) throws IOException, ClassNotFoundException, SQLException {
        String fileName = part.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            String e = fileName.substring(fileName.lastIndexOf("."), fileName.length());
            System.out.println(key);
            findImage(key);
            //insert
            String url = "../img/" + key + e;
            ProductImageDAO i = new ProductImageDAO();
            if (!i.findImgUrl(pId, url)) {
                boolean isMain = key.split("_img")[1].equals("0") ? true : false;
                i.addImage(pId, url, isMain);
            }
            part.write(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + key + e);
        }
    }

    public boolean findImage(String key) {
        File f = new File(Paths.get(Constants.IMAGE_ABSOLUTE_DIRECTORY).toString());
        File[] matchingFiles = f.listFiles(new FilenameFilter() {
            public boolean accept(File dir, String name) {
                if (name.startsWith(key)) {
                    try {
                        System.out.println("DELETE IMG");
                        return Files.deleteIfExists(Paths.get(Constants.IMAGE_ABSOLUTE_DIRECTORY + "/" + name));
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                return name.startsWith(key);
            }
        });
        return false;
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
