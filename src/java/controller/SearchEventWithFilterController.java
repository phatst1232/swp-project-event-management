/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import event.eventDAO;
import event.eventDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author phats
 */
public class SearchEventWithFilterController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "Eventmanagement.jsp";
    private static final String LOGIN_SUCCESS = "LoginPage.jsp";
    private static final String ADMIN_SUCCESS = "eventManagePage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String url = ERROR;
        try {
            String OrderBy = request.getParameter("OrderBy");
            String ended = request.getParameter("ended");
            String from = request.getParameter("from");
            String search = request.getParameter("search");
            eventDAO dao = new eventDAO();
            List<eventDTO> list = dao.getListEvent(search, OrderBy, ended);
            request.setAttribute("LIST_EVENT", list);
            if (session.getAttribute("LOGIN_USER") != null) {
                url = LOGIN_SUCCESS;
                if (from.equals("eventManagePage")) {
                    url = ADMIN_SUCCESS;
                }
            } else {
                url = SUCCESS;
            }

        } catch (Exception e) {
            log("Error at SearchEventController" + e.toString());
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
