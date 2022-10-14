package controllers;

import config.Config;
import dao.OrderDAO;
import dto.OrderDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

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
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        System.out.println(action + " " + controller);
        HttpSession session = request.getSession();
        switch (action) {
            case "cart": {
                try {
                    if (session.getAttribute("user") == null) {
                        System.out.println("HERE=====================================");
                        request.setAttribute("controller", "user");
                        request.setAttribute("action", "login");
                    } else {
                        OrderDAO o = new OrderDAO();
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        System.out.println(user.toString());
                        if (request.getParameter("func") != null
                                && request.getParameter("pId") != null) {
                            String func = request.getParameter("func");
                            int productId = Integer.parseInt(request.getParameter("pId"));
//                            System.out.println("HERE=====================================");
                            switch (func) {
                                case "add": {
                                    o.addCart(user.getEmail(), productId);
                                }
                                break;
                                case "delete": {

                                }
                                break;
                                default:
                                    request.setAttribute("controller", "error");
                                    request.setAttribute("action", "index");
                                    request.setAttribute("message", "Error when processing the request");
                            }
                        } else {
                            OrderDTO order = o.getOrder(user.getEmail(), 0);
//                            order.getOrderByShopList()
                            request.setAttribute("order", order);
//                            System.out.println(o.getOrder(user.getEmail(), 0));
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            break;
            case "pay":
                break;
            case "shipInformation":
                break;
            case "billInformation":
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
