package controllers;

import config.Config;
import dao.ProductDAO;
import dao.UserDAO;
import dto.OrderByShopDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dto.UserDTO;
import java.io.EOFException;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        System.out.println(user);
                        OrderDTO cart = null;
                        if (session.getAttribute("order") == null) {
                            cart = new OrderDTO(user.getEmail(), user.getAddress(), new ArrayList<>());
                        } else {
                            cart = (OrderDTO) session.getAttribute("order");
                        }
                        if (request.getParameter("func") != null) {
                            String func = request.getParameter("func");
                            System.out.println(func);
                            int productId = -1;
                            if (request.getParameter("pId") != null) {
                                productId = Integer.parseInt(request.getParameter("pId"));
                            }
                            System.out.println(productId);
                            int quan = 0;
                            if (request.getParameter("quan") != null) {
                                quan = Integer.parseInt(request.getParameter("quan"));
                            }
                            System.out.println(quan);
                            if (handleCart(cart, productId, quan, func) == null) {
                                throw new Exception();
                            }
                        }
                        session.setAttribute("order", cart);
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

    public static OrderDTO handleCart(OrderDTO cart, int productId, int quantity, String option) throws ClassNotFoundException, SQLException, Exception {
        ProductDAO p = new ProductDAO();
        System.out.println(option);
        if (option.equalsIgnoreCase("deleteAll")) {
            cart.setOrderByShopList(new ArrayList<>());
            System.out.println(cart);
            return cart;
        }
        if (p.getProductById(productId) != null) {
            List<OrderByShopDTO> obsList = cart.getOrderByShopList();
            String sellerEmail = p.getSellerEmailByProductId(productId);
            int indexOBS = checkOrderByShop(obsList, sellerEmail);
            List<OrderDetailDTO> odList = new ArrayList<>();
            if (indexOBS == -1 && option.equalsIgnoreCase("add")) {
                UserDTO u = new UserDAO().findUser(sellerEmail);
                cart.getOrderByShopList().add(new OrderByShopDTO(sellerEmail,
                        u.getFirstName() + " " + u.getLastName(),
                        handleOrderDetail(odList, productId, 1, "add", -1)));
                return cart;
            } else if (indexOBS != -1) {
                if (obsList.get(indexOBS).getOrderDetailList() == null) {
                    obsList.get(indexOBS).setOrderDetailList(odList);
                }
                odList = obsList.get(indexOBS).getOrderDetailList();
                int indexOD = checkOrderDetail(odList, productId);
                if (option.equalsIgnoreCase("add")) {
                    odList = handleOrderDetail(odList, productId, 1, "add", indexOD);
                } else if (indexOD != -1 && (option.equalsIgnoreCase("delete")
                        || option.equalsIgnoreCase("update"))) {
                    odList = handleOrderDetail(odList, productId, quantity, option, indexOD);
                } else {
                    return null;
                }
                cart.getOrderByShopList().get(indexOBS).setOrderDetailList(odList);
                clearCart(cart);
                return cart;
            } else {
                return null;
            }
        }

        return null;
    }

    public static int checkOrderDetail(List<OrderDetailDTO> odList, int productId) {
        for (int i = 0; i < odList.size(); i++) {
            if (odList.get(i).getProductId() == productId) {
                return i;
            }
        }
        return -1;
    }

    public static int checkOrderByShop(List<OrderByShopDTO> obsList, String sellerEmail) {
        for (int i = 0; i < obsList.size(); i++) {
            if (obsList.get(i).getEmailSeller().equalsIgnoreCase(sellerEmail)) {
                return i;
            }
        }
        return -1;
    }

    public static OrderDTO clearCart(OrderDTO cart) {
        for (OrderByShopDTO o : cart.getOrderByShopList()) {
            if (o.getOrderDetailList() == null || o.getOrderDetailList().isEmpty()) {
                cart.getOrderByShopList().remove(o);
            }
        }
        return cart;
    }

    public static List<OrderDetailDTO> handleOrderDetail(List<OrderDetailDTO> odList,
            int productId, int quantity, String option, int indexOD) throws ClassNotFoundException, SQLException {
        switch (option) {
            case "add": {
                if (indexOD != -1) {
                    System.out.println("==============");
                    System.out.println(quantity);
                    System.out.println(odList.get(indexOD).getQuantity() + 1);
                    odList.get(indexOD).setQuantity(odList.get(indexOD).getQuantity() + 1);
                    System.out.println(odList.get(indexOD).getQuantity() + 1);
                    System.out.println("==============");
                } else {
                    odList.add(new OrderDetailDTO(productId, 1, new ProductDAO().getProductById(productId)));
                }
            }
            break;
            case "update": {
                odList.get(indexOD).setQuantity(quantity);
            }
            break;
            case "delete": {
                odList.remove(indexOD);
            }
            break;
        }
        return odList;
    }

    public static void main(String[] args) throws SQLException, Exception {
//        List<OrderByShopDTO> obsList = new ArrayList<>();
        OrderByShopDTO os = new OrderByShopDTO();
////        obsList.add(os);
        OrderDTO cart = new OrderDTO("tên", null, new ArrayList<>());
////        cart.setOrderByShopList(obsList);
//
        if (cart.getOrderByShopList() == null) {
//            List<OrderByShopDTO> obsList = new ArrayList<>();
//            cart.setOrderByShopList(new ArrayList<>());
        }
//        System.out.println(cart.getOrderByShopList().add(os));
        cart = clearCart(cart);
        System.out.println(cart);
//        List<OrderByShopDTO> obsList = cart.getOrderByShopList();
//        System.out.println(obsList==null);
//        obsList.add(os);
//        cart.setOrderByShopList(obsList);
//        System.out.println(cart);
//        System.out.println(obsList.add(os));
//        System.out.println(checkOrderByShop(obsList, "a"));
//        cart = handleCart(cart, 384, 0, "add");
//        System.out.println(cart);
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
