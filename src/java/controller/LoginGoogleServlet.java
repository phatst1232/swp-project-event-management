/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import google.accountDTO.GooglePojo;
import google.utils.GoogleUtils;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
import user.UserDTO;

@WebServlet("/login-google")
public class LoginGoogleServlet extends HttpServlet {

    private static final String ERROR = "Eventmanagement.jsp";
    private static final String SUCCESS = "LoginPage.jsp";

    public LoginGoogleServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String url = ERROR;
        String accessToken = GoogleUtils.getToken(code);
        GooglePojo googlePojo = GoogleUtils.getUserInfo(accessToken);
        UserDAO dao = new UserDAO();
        UserDTO user = new UserDTO(googlePojo.getId(), "not yet", "*****", "ST", "", "", googlePojo.getEmail(), "AC", null, null, null, "");
        try {
            if (user != null && dao.isFPTEmail(googlePojo.getEmail())) {

                url = SUCCESS;
                if (!dao.checkUserExist(user.getUserID())) {
                    dao.insertUserNew(user);
                    session.setAttribute("LOGIN_USER", user);
                } else {
                    user = dao.checkLogin(googlePojo.getId(), "*****");
                    session.setAttribute("LOGIN_USER", user);
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginGoogleServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(LoginGoogleServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(LoginGoogleServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher(url).forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
