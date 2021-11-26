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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddLikeController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "ShowAnEvent.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            eventDAO edao = new eventDAO();
            String userID = request.getParameter("userIDlike");
            String eventID = request.getParameter("eventIDlike");
            String status = request.getParameter("status");
            boolean checklike = false;
            HttpSession session = request.getSession();
            eventDTO event = (eventDTO) session.getAttribute("CLICK_ON_EVENT");
            if (status.equals("likebutton disable theUnbtn2"))
            {
                checklike = edao.UnLike(userID, eventID);
                edao.DeleteLike(eventID);
                event.setLike(edao.getLike(eventID));
                if(checklike){
                    url=SUCCESS;
                }
            }else{     
                checklike = edao.AddLike(userID, eventID);
                edao.UpdateLike(eventID);
                event.setLike(edao.getLike(eventID));
                if (checklike) {
                    url = SUCCESS;
                }
          }
        } catch (Exception e) {
            log("Error at AddEventController" + e.toString());
        } finally {
              response.sendRedirect("ShowAnEvent.jsp");
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