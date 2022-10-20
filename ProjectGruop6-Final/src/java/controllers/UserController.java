/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import config.Config;
import dao.UserDAO;
import dto.AddressDTO;
import dto.UserDTO;
import dto.UserGoogleDTO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import services.GoogleAPI;

/**
 *
 * @author Admin
 */
@WebServlet(name = "UserController", urlPatterns = {"/user"})
public class UserController extends HttpServlet {

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
        String controller = (String) request.getAttribute("controller");
        String action = (String) request.getAttribute("action");
        boolean isFowarded = false;
        HttpSession session = (HttpSession) request.getSession();
        String redirectUrl = "";
        switch (action) {
            case "login":

//                response.sendRedirect("");
//                request.getRequestDispatcher("/WEB-INF/layouts/main.jsp").forward(request, response);
                break;
            case "userInformation": {
            }
            break;
            case "updateInformation": {
                UserDAO userDAO = new UserDAO();
                String email = ((UserDTO) session.getAttribute("user")).getEmail();
                String yob = request.getParameter("yob");
                Date date = Date.valueOf(yob);
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String phone = request.getParameter("phone");
                String cityId = request.getParameter("cityId");
                String districtId = request.getParameter("districtId");
                String wardId = request.getParameter("wardId");
                String houseNumber = request.getParameter("houseNumber");
                AddressDTO address = new AddressDTO();
                address.setHouseNumber(houseNumber);
                address.setCityId(cityId);
                address.setDistrictId(districtId);
                address.setWardId(wardId);
                UserDTO userDTO = new UserDTO(email, "", firstName, lastName, phone, date, address);
                try {
                    userDAO.updateUser(userDTO);
                    session.setAttribute("user", userDTO);
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("action", "userInformation");
            }
            break;
            case "googleLoginHandle": {
                String code = request.getParameter("code");
                System.out.println(code);
                String token = GoogleAPI.getToken(code);
                UserGoogleDTO googleUser = GoogleAPI.getUserInfo(token);
                
                System.out.println(googleUser.getEmail().endsWith("@fpt.edu.vn"));
                if (googleUser.getEmail().endsWith("@fpt.edu.vn")) {
                    UserDAO userDAO = new UserDAO();
                    UserDTO userDTO = null;
                    try {
                        userDTO = userDAO.findUser(googleUser.getEmail());
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (userDTO == null) {
                        try {
                            userDTO = userDAO.addUser(googleUser.getEmail(), googleUser.getGivenName(), googleUser.getPicture());
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    }
                    System.out.println(userDTO);
                    session.setAttribute("user", userDTO);
                    System.out.println(isFowarded);
                } else {
                    redirectUrl = "/user/login.do";
                    isFowarded = false;
                    session.setAttribute("errorLoginMessage",
                            "Tài khoản của bạn không được phép đăng nhập vào hệ thống");
                }
                break;
            }
            
            case "logout": {
                session.removeAttribute("user");
                redirectUrl = "/";
                isFowarded = true;
                break;
            }
            
            default: {
                request.setAttribute("controller", "error");
                request.setAttribute("action", "index");
                request.setAttribute("message", "Error when processing the request");
            }
        }
        if (!isFowarded) {
            request.getRequestDispatcher(Config.LAYOUT).forward(request, response);
        } else {
            response.sendRedirect(getServletContext().getContextPath() + redirectUrl);
        }
        isFowarded = false;
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
