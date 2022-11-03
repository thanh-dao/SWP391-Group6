package controllers;

import com.google.gson.Gson;
import config.Config;
import dao.OrderDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dto.UserDTO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
@WebServlet(name = "OrderController", urlPatterns = {"/order"})
public class OrderController extends HttpServlet {

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
        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        HttpSession session = (HttpSession) request.getSession();

        if (session.getAttribute("user") == null) {
            request.setAttribute("controller", "user");
            request.setAttribute("action", "login");
        } else {
            UserDTO user = (UserDTO) session.getAttribute("user");
            switch (action) {
                case "history": {
                    try {
                        request.setAttribute("orderList", new OrderDAO().getOrder(user.getEmail()));
                        System.out.println(request.getAttribute("orderList"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                break;
                case "stored": {
                    System.out.println("HERE");
                    ProductDAO p = new ProductDAO();
                    try {
                        if (request.getParameter("func") != null) {
                            String func = request.getParameter("func");
                            int pId = Integer.parseInt(request.getParameter("pId"));
                            switch (func) {
                                case "ss": {
                                    p.handerProductSeller(pId, "ss", null);
                                }
                                break;
                                case "as": {
                                    p.handerProductSeller(pId, "as", null);
                                }
                                break;
                                case "d": {
                                    p.handerProductSeller(pId, "d", null);
                                }
                                break;
                                case "u": {
                                    if (request.getParameter("product") == null) {
                                        System.out.println("OK");
                                        request.setAttribute("product", p.getProductById(pId));
                                        request.setAttribute("controller", "home");
                                        request.setAttribute("action", "uploadProduct");
                                    } else {
                                        if (request.getPart("img0")==null) {
                                            System.out.println("GAy");
                                        }else{
                                            System.out.println("CO");
                                        }
                                        Part part = request.getPart("img0");
                                        System.out.println(part);
//                                        Collection<Part> part = request.getParts();
//                                        String realPath = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                                        System.out.println("==============");
                                        System.out.println(part);
//                                        System.out.println(realPath);
                                    }
                                }
                                break;
                                default:
                                    request.setAttribute("controller", "error");
                                    request.setAttribute("action", "index");
                                    request.setAttribute("message", "Error when processing the request");
                            }
                        } else {
                            if (request.getParameter("status") != null) {
                                String status = request.getParameter("status");
                                request.setAttribute("status", status);
                                switch (status) {
                                    case "ar": {
                                        request.setAttribute("productList",
                                                p.getProductListJson(p.getProductListSeller(user.getEmail(), 1, 1)));
                                    }
                                    break;
                                    case "nar": {
                                        request.setAttribute("productList",
                                                p.getProductListJson(p.getProductListSeller(user.getEmail(), 2, 0)));
                                    }
                                    break;
                                    case "nary": {
                                        request.setAttribute("productList",
                                                p.getProductListJson(p.getProductListSeller(user.getEmail(), 2, -1)));
                                    }
                                    break;
                                    case "ss": {
                                        request.setAttribute("productList",
                                                p.getProductListJson(p.getProductListSeller(user.getEmail(), 0, 1)));
                                    }
                                    break;
                                    case "oos": {
                                        request.setAttribute("productList",
                                                p.getProductListJson(p.getProductListSeller(user.getEmail(), -2, 1)));
                                    }
                                    break;
                                    case "dashboard": {
                                        int currentMonth = Calendar.getInstance().get(Calendar.MONTH);
                                        for (int i = 0; i < currentMonth; i++) {

                                        }
                                        String userEmail = user.getEmail();
                                        Gson gson = new Gson();
                                        request.setAttribute("productList",
                                                gson.toJson(p.getTop10ProductByShop(userEmail,currentMonth, ProductDAO.DESC)));
                                        System.out.println(gson.toJson((p.getTop10ProductByShop(userEmail, currentMonth, ProductDAO.ASC))));
                                        request.setAttribute("top10ProductLeastSell", gson.toJson((p.getTop10ProductByShop(userEmail, currentMonth, ProductDAO.ASC))));
                                        UserDAO u = new UserDAO();
                                        request.setAttribute("top10SoldCountUser", gson.toJson(u.getTop10UserBuyByShop(userEmail, currentMonth, ProductDAO.DESC, true)));
                                        request.setAttribute("top10SoldPriceUser", gson.toJson(u.getTop10UserBuyByShop(userEmail, currentMonth, ProductDAO.DESC, false)));
                                        break;
                                    }
                                    default:
                                        request.setAttribute("controller", "error");
                                        request.setAttribute("action", "index");
                                        request.setAttribute("message", "Error when processing the request");
                                }
                            } else {
                                request.setAttribute("controller", "error");
                                request.setAttribute("action", "index");
                                request.setAttribute("message", "Error when processing the request");
                            }
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                break;
                default:
                    request.setAttribute("controller", "error");
                    request.setAttribute("action", "index");
                    request.setAttribute("message", "Error when processing the request");
            }
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
