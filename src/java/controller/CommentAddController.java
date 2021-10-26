/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import comment.CommentDAO;
import comment.CommentDTO;
import comment.CommentError;
import event.eventDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Math.random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import user.UserDTO;

/**
 *
 * @author benth
 */
public class CommentAddController extends HttpServlet {

    public static final String ERROR = "enventpagetest.jsp";
    public static final String SUCCESS = "enventpagetest.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        CommentError commentError = new CommentError("","","","","","");
        try{
            // -- Generate CommentID --//
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            CommentDAO cmtdao = new CommentDAO();
            String commentID = request.getParameter("commentID");
            commentID = commentID + String.valueOf(cmtdao.getQuantity()+1);
            // -- Done --//

            String commentContent = request.getParameter("commentContent");            
            String repliedTo = request.getParameter("repliedTo");
            
            //eventID
            eventDTO event = (eventDTO) session.getAttribute("CURRENT_EVENT");
//            String eventID = event.getEventID();
            String eventID = "Yeah boi";
            String CommentBy = user.getUserID();
            boolean check = true;
            if(commentContent.length()>500){
                check = false;
            }
            if (check) {               
                CommentDTO comment = new CommentDTO(commentID, commentContent, repliedTo, eventID, 1, CommentBy);
                boolean checkInsert = cmtdao.insertComment(comment);
                if (checkInsert) {
                    request.setAttribute("Comment ERROR", commentError);
                }
            }else{
                url = ERROR;
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
