/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import event.eventDAO;
import event.eventDTO;
import event.eventErrors;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;

/**
 *
 * @author AN515-52
 */
public class AddEventController extends HttpServlet {

    public static final String ERROR = "addevent.jsp";
    public static final String SUCCESS = "showevent.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        eventErrors eventError = new eventErrors("", "", "", "", "", "", "", "", "", "");
        try {
            UserDTO user = (UserDTO)session.getAttribute("LOGIN_USER");
            String eventID = "";
            String eventName = request.getParameter("eventName");
            Date createDate = java.sql.Date.valueOf(LocalDate.now());
            Date eventStartDate = java.sql.Date.valueOf(request.getParameter("StartDate"));
            String userID = user.getUserID();
            String categoryID = request.getParameter("categoryID");
            String statusID = request.getParameter("statusID");
            int limitMember = Integer.parseInt(request.getParameter("limitMember"));
            int RoomID = Integer.parseInt(request.getParameter("RoomID"));
            String interestID = request.getParameter("interestID");
            String content = request.getParameter("content");
            String clubID = request.getParameter("clubID");
            String dmID = request.getParameter("dmID");
            boolean check = true;
            if (eventName.length() > 100 || eventName.length() < 2) {
                eventError.setEventNameError("Event Name [ 2 , 100 ] !");
                check = false;
            }
            if (limitMember > 800) {
                eventError.setLimitMemberError("Limit Member [ 0,800]");
                check = false;
            }
            if (check) {
                eventDAO dao = new eventDAO();
                eventDTO event = new eventDTO(eventID, eventName, createDate, eventStartDate, userID, categoryID, statusID, limitMember, RoomID, interestID, content, clubID, dmID);
                boolean checkInsert = dao.AddEvent(event);
                if (checkInsert) {
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("Event_ERROR", eventError);
            }

        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
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
