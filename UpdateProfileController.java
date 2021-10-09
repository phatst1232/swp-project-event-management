/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDAO;
import user.UserDTO;
import user.UserError;

/**
 *
 * @author AN515-52
 */
public class UpdateProfileController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "profile.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        try {
            String userID = request.getParameter("userID");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String phonenumber = request.getParameter("phonenumber");
            String interestedDetail = request.getParameter("interestedDetail");
            UserError userError = new UserError("", "", "", "", "", "", "", "", "", "", "", "");
            boolean check = true;
            if (userName.length() < 2) {
                userError.setUserName("Full Name must be at least 5 words");
                check = false;
            }
            if (password.length() < 2) {
                userError.setPassword("password must be at least 2 words");
                check = false;
            }
            if (address.length() < 2) {
                userError.setAddress("Address must be real");
                check = false;
            }
            if (phonenumber.length() < 5) {
                userError.setPhoneNumber("phone must be real");
                check = false;
            }
            if (interestedDetail.length() < 2) {
                userError.setStatusID("Status ID must  atleast 2 words");
                check = false;
            }
            if (check) {
                UserDAO dao = new UserDAO();
                UserDTO user = new UserDTO(userID, userName, password, "", address, phonenumber, "", "", "", "", interestedDetail);
                boolean checkUpdate = dao.updateUserProfile(user);
                if (checkUpdate) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            log("Error at UpdateController: " + e.toString());
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
