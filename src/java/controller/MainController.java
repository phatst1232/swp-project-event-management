/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author benth
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class MainController extends HttpServlet {

    //--Page
    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "LoginController";
    private static final String LOGOUT = "LogoutController";
    //-- Event
    private static final String SEARCH_EVENT = "SearchEventController";
    private static final String CREATE_EVENT = "AddEventController";
    private static final String SHOW_EVENT = "ShowEventController";
    //-- User
    private static final String USER_PROFILE = "ShowProfileController";
    private static final String SEARCH_USER = "SearchUserController";
    private static final String UP_PROFILE = "UpdateUserProfileController";
    
    private static final String SearchImg = "SrEController";
    private static final String TestCreate = "CreateEvent2Controller";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if ("login".equals(action)) {
                url = LOGIN;
            } else if ("logout".equals(action) || "back to login".equals(action)) {
                url = LOGOUT;
            } else if ("Create".equals(action)) {
                url = CREATE_EVENT;
            } else if ("Search event".equals(action)) {
                url = SEARCH_EVENT;
            } else if ("show event".equals(action)) {
                url = SHOW_EVENT;
            } else if ("profile".equals(action)) {
                url = USER_PROFILE;
            } else if ("Search user".equals(action)) {
                url = SEARCH_USER;
            }else if ("Create_Event".equals(action)) {
                url = TestCreate;
            } else if ("SearchE".equals(action)) {
                url = SearchImg;
            }else if ("userpr5".equals(action)) {
                url = UP_PROFILE;
            }else {
                HttpSession session = request.getSession();
                session.setAttribute("ERROR_MESSAGE", "Function is not avaiable!!!!");
            }
        } catch (Exception e) {
            log("ERROR at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);

        }
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
