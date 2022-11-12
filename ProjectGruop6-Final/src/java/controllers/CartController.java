package controllers;

import config.Config;
import dao.AddressDAO;
import dao.DeliveryMethodDAO;
import dao.OrderByShopDAO;
import dao.OrderDAO;
import dao.OrderDetailDAO;
import dao.PaymentMethodDAO;
import dao.ProductDAO;
import dao.UserDAO;
import dto.AddressDTO;
import dto.OrderByShopDTO;
import dto.OrderDTO;
import dto.OrderDetailDTO;
import dto.UserDTO;
import java.io.EOFException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Array;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.GhnApi;

@WebServlet(name = "CartController", urlPatterns = {"/cart"})
public class CartController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        String action = (String) request.getAttribute("action");
        String controller = (String) request.getAttribute("controller");
        System.out.println("HERE");
        System.out.println(action + " " + controller);
        HttpSession session = request.getSession();
        if (session.getAttribute("user") == null) {
            request.setAttribute("controller", "user");
            request.setAttribute("action", "login");
        } else {
            switch (action) {
                case "cart": {
                    try {
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        OrderDTO cart = session.getAttribute("cart") == null
                                ? new OrderDTO(user.getEmail(), user.getAddress(),
                                        new ArrayList<>(), user.getFirstName() + " "
                                        + user.getLastName(), user.getPhone())
                                : (OrderDTO) session.getAttribute("cart");
                        session.setAttribute("cart", cart);
                        if (request.getParameter("func") != null) {
                            String func = request.getParameter("func");
                            if (func.equalsIgnoreCase("create")) {
                                if (request.getParameter("pIdList") != null) {
                                    String[] pIdList = request.getParameter("pIdList").replace("[", "").replace("]", "").split(",");
                                    int[] arrpId = new int[pIdList.length];
                                    for (int i = 0; i < pIdList.length; i++) {
                                        arrpId[i] = Integer.parseInt(pIdList[i]);
                                    }
                                    OrderDTO order = new OrderDTO(cart.getEmailBuyer(),
                                            cart.getAddress(), new ArrayList<>(),
                                            cart.getUserName(), cart.getPhone());
                                    handleOrder(cart, arrpId, order);
                                    System.out.println("CREATE");
                                    session.setAttribute("order", order);
                                }
                            } else if (func.equalsIgnoreCase("buy")) {
                                System.out.println(request.getParameter("pIdList"));
                                String[] pIdList = request.getParameter("pIdList").replace("[", "").replace("]", "").split(",");
                                ProductDAO p = new ProductDAO();
                                for (int i = 0; i < pIdList.length; i++) {
                                    if (p.getProductById(Integer.parseInt(pIdList[i])) != null) {
                                        handleCart(cart, Integer.parseInt(pIdList[i]), -1, "add");
                                    } else {
                                        if (pIdList.length == 1) {
                                            return;
                                        }
                                    }
                                }
                            } else {
                                int productId = request.getParameter("pId") != null
                                        ? Integer.parseInt(request.getParameter("pId")) : -1;
                                int quan = request.getParameter("quan") != null
                                        ? Integer.parseInt(request.getParameter("quan")) : 0;
                                if (handleCart(cart, productId, quan, func) == null) {
                                    throw new Exception();
                                }
                                session.setAttribute("cart", cart);
                            }
                        }
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
                break;
                case "pay": {
                    System.out.println("pay HERE");
                    try {
                        UserDTO user = (UserDTO) session.getAttribute("user");
                        if (session.getAttribute("order") != null
                                && request.getParameter("payId") != null
                                && request.getParameter("deliId") != null) {
                            System.out.println(request.getParameter("pIdList"));
                            String payId = request.getParameter("payId");
                            String deliId = request.getParameter("deliId");
                            OrderDTO order = (OrderDTO) session.getAttribute("order");
                            order.setPaymentId(Integer.parseInt(request.getParameter("payId")));
                            order.setDeliveryId(Integer.parseInt(request.getParameter("deliId")));
                            if (payId.equals("1")) {
                                System.out.println("paypal order id: " + request.getParameter("paypalOrderId"));
                                order.setPayId(request.getParameter("paypalOrderId"));
                            }
                            UserDAO uDAO = new UserDAO();
                            if (deliId.equals("1")) {
                                order.getOrderByShopList().forEach(i -> {
                                    try {
                                        String ghnOrderCode = GhnApi.createOrder(user, uDAO.findUser(i.getEmailSeller()), i.getOrderDetailList(), payId.equals("1") ? "0" : Integer.toString(i.getTotal()));
                                        i.setShipId(ghnOrderCode);
                                    } catch (ClassNotFoundException | SQLException | IOException ex) {
                                        ex.printStackTrace();
                                    }
                                });
                            }
                            new OrderDAO().createOrder(order);
                            OrderDTO cart = (OrderDTO) session.getAttribute("cart");
                            for (OrderByShopDTO os : order.getOrderByShopList()) {
                                for (OrderDetailDTO od : os.getOrderDetailList()) {
                                    handleCart(cart, od.getProductId(), -1, "delete");
                                }
                            }
                            session.setAttribute("cart", cart);
                            request.setAttribute("controller", "cart");
                            request.setAttribute("action", "thanks");
                            System.out.println("END");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                break;
                case "shipInformation": {
                    System.out.println("shipInformation");
                    try {
                        if (session.getAttribute("cart") != null) {
                            OrderDTO order = session.getAttribute("order") == null ? (OrderDTO) session.getAttribute("cart")
                                    : (OrderDTO) session.getAttribute("order");
                            System.out.println(session.getAttribute("order") == null ? "---null---"
                                    : "---not null---");
                            if (request.getParameter("wardId") != null
                                    && request.getParameter("districtId") != null
                                    && request.getParameter("cityId") != null
                                    && request.getParameter("houseNumber") != null
                                    && request.getParameter("userName") != null
                                    && request.getParameter("phone") != null) {
                                AddressDAO ad = new AddressDAO();
                                String wardId = request.getParameter("wardId");
                                String districtId = request.getParameter("districtId");
                                String cityId = request.getParameter("cityId");
                                String userName = request.getParameter("userName");
                                String phone = request.getParameter("phone");
                                AddressDTO address = new AddressDTO(request.getParameter("houseNumber"),
                                        wardId, ad.get(wardId, 3), districtId,
                                        ad.get(districtId, 2), cityId, ad.get(cityId, 1));
                                order.setAddress(address);
                                order.setUserName(userName);
                                order.setPhone(phone);
                                if (session.getAttribute("order") == null) {
                                    session.setAttribute("cart", order);
                                    request.setAttribute("controller", "cart");
                                    request.setAttribute("action", "cart");
                                } else {
                                    request.setAttribute("order", order);
                                    request.setAttribute("controller", "cart");
                                    request.setAttribute("action", "pay");
                                }
                            }
                        } else {
                            throw new Exception();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                break;
                case "billInformation": {
                    if (request.getParameter("osId") != null && request.getParameter("oId") != null) {
                        try {
                            OrderDTO order = new OrderDAO().getOrder(Integer.parseInt(request.getParameter("oId")));
                            request.setAttribute("osId", Integer.parseInt(request.getParameter("osId")));
                            request.setAttribute("order", order);
                            request.setAttribute("delivery", new DeliveryMethodDAO().getName(order.getDeliveryId()));
                            request.setAttribute("payment", new PaymentMethodDAO().getName(order.getPaymentId()));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    } else {
                        request.setAttribute("controller", "error");
                        request.setAttribute("action", "index");
                        request.setAttribute("message", "Error when processing the request");
                    }
                }
                break;
                default:
                    //chuyển đến trang thông báo lổi
                    request.setAttribute("controller", "error");
                    request.setAttribute("action", "index");
                    request.setAttribute("message", "Error when processing the request");
            }
        }
        request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
    }

    public static void handleOrder(OrderDTO cart, int[] pIdList, OrderDTO order) throws ClassNotFoundException, SQLException, Exception {
        for (int i : pIdList) {
            for (OrderByShopDTO obs : cart.getOrderByShopList()) {
                for (OrderDetailDTO od : obs.getOrderDetailList()) {
                    if (od.getProductId() == i) {
                        int indexOBS = checkOrderByShop(order.getOrderByShopList(),
                                obs.getEmailSeller());
                        if (indexOBS != -1) {
                            order.getOrderByShopList().get(indexOBS)
                                    .getOrderDetailList().add(od);
                        } else {
                            OrderByShopDTO os = new OrderByShopDTO(obs.getEmailSeller(),
                                    obs.getName(), obs.getAddress(), new ArrayList<>());
                            os.getOrderDetailList().add(od);
                            order.getOrderByShopList().add(os);
                        }
                    }
                }
            }
        }
    }

    public static OrderDTO handleCart(OrderDTO cart, int productId, int quantity,
            String option) throws ClassNotFoundException, SQLException, Exception {
        ProductDAO p = new ProductDAO();
        if (option.equalsIgnoreCase("deleteAll")) {
            cart.setOrderByShopList(new ArrayList<>());
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
                        new UserDAO().getAddressUser(sellerEmail),
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

    public static void clearCart(OrderDTO cart) {
        List<OrderByShopDTO> obs = new ArrayList<>();
        for (OrderByShopDTO o : cart.getOrderByShopList()) {
            if (o.getOrderDetailList() == null || o.getOrderDetailList().isEmpty()) {
                obs.add(o);
            }
        }
        cart.getOrderByShopList().removeAll(obs);
    }

    public static List<OrderDetailDTO> handleOrderDetail(List<OrderDetailDTO> odList,
            int productId, int quantity, String option, int indexOD) throws ClassNotFoundException, SQLException {
        switch (option) {
            case "add": {
                if (indexOD != -1) {
                    odList.get(indexOD).setQuantity(odList.get(indexOD).getQuantity() + 1);
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
//        OrderByShopDTO os = new OrderByShopDTO();
////        obsList.add(os);
//        OrderDTO cart = new OrderDTO("tên", null, new ArrayList<>());
////        cart.setOrderByShopList(obsList);
//
//        if (cart.getOrderByShopList() == null) {
//            List<OrderByShopDTO> obsList = new ArrayList<>();
//            cart.setOrderByShopList(new ArrayList<>());
//        }
//        System.out.println(cart.getOrderByShopList().add(os));
//        cart = clearCart(cart);
//        System.out.println(cart);
//        List<OrderByShopDTO> obsList = cart.getOrderByShopList();
//        System.out.println(obsList==null);
//        obsList.add(os);
//        cart.setOrderByShopList(obsList);
//        System.out.println(cart);
//        System.out.println(obsList.add(os));
//        System.out.println(checkOrderByShop(obsList, "a"));
//        cart = handleCart(cart, 384, 0, "add");
//        System.out.println(cart);
//        System.out.println(cart);

//        if (Files.exists(Paths.get("web/img/phinhse150972@fpt.edu.vn.png"))) {
////            System.out.println(Files.deleteIfExists(Paths.get("web/img/")));
//            System.out.println("OK");
//        }
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
