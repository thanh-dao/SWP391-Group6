/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import config.Config;
import dao.UserDAO;
import dto.UserDTO;
import dto.UserGoogleDTO;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import utils.Constants;

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
            case "userInformation":
                break;
            case "googleLoginHandle": {
                String code = request.getParameter("code");
                System.out.println(code);
                String token = getToken(code);
                UserGoogleDTO googleUser = getUserInfo(token);
                isFowarded = true;
                System.out.println(googleUser.getEmail().endsWith("@fpt.edu.vn"));
                if (googleUser.getEmail().endsWith("@fpt.edu.vn")) {
                    UserDAO userDAO = new UserDAO();
                    UserDTO userDTO = null;
                    try {
                        userDTO = userDAO.findUser(googleUser.getEmail());
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(UserController.class.getName()).log(Level.SEVERE, null, ex);
                    } catch (SQLException ex) {
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
                    redirectUrl = "/home/main.do";
                    session.setAttribute("errorLoginMessage", null);

                } else {
                    redirectUrl = "/user/login.do";
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

    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println(response);
        UserGoogleDTO user = new Gson().fromJson(response, UserGoogleDTO.class);

        return user;
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
