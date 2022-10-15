package controllers;

import config.Config;
import dao.OrderByShopDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.ProductDAO;
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
        response.setContentType("application/json;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        System.out.println(action + " " + controller);
        HttpSession session = request.getSession();
        switch (action) {
            case "cart": {
                try {
                    if (session.getAttribute("user") == null) {
                        request.setAttribute("controller", "user");
                        request.setAttribute("action", "login");
                    } else {
                        OrderDAO o = new OrderDAO();
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        ProductDAO p = new ProductDAO();
                        if (request.getParameter("func") != null
                                && request.getParameter("pId") != null) {
                            String func = request.getParameter("func");
                            int productId = Integer.parseInt(request.getParameter("pId"));
                            
                            OrderDetailDAO od = new OrderDetailDAO();
                                                              
                            switch (func) {
                                case "add": {
                                    System.out.println("HERE");
                                    o.addCart(user.getEmail(), productId);
                                }
                                break;
                                case "delete": {
                                    int orderByShopId = Integer.parseInt(request.getParameter("osId"));
                                    od.deleteOrderDetail(orderByShopId, productId);
                                }
                                case "update": {
                                    int orderByShopId = Integer.parseInt(request.getParameter("osId"));
                                    if (request.getParameter("quan") != null) {
                                        int quantity = Integer.parseInt(request.getParameter("quan"));
                                        System.out.println(quantity);
                                        if (quantity <= p.getProductById(productId).getQuantity()) {
                                            od.updateOrderDetail(orderByShopId, productId, quantity, null);
                                        } else {
                                            throw new Exception();
                                        }
                                    } else {
                                        throw new Exception();
                                    }
                                }
                                break;
                                default:
                                    request.setAttribute("controller", "error");
                                    request.setAttribute("action", "index");
                                    request.setAttribute("message", "Error when processing the request");
                            }
                            int orderByShopId = Integer.parseInt(request.getParameter("osId"));
                            new OrderByShopDAO().checkOrderByShop(orderByShopId);
                        } else {
//                            order.getOrderByShopList()
                            request.setAttribute("order", o.getOrder(user.getEmail(), 0));
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
