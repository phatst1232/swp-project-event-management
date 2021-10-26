/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

<<<<<<< HEAD
import comment.CommentDAO;
import comment.CommentDTO;
import comment.CommentError;
=======
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
<<<<<<< HEAD
import javax.servlet.http.HttpSession;
=======
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199

/**
 *
 * @author benth
 */
public class CommentUpdateController extends HttpServlet {

<<<<<<< HEAD
    private static final String ERROR = "eventpage.jsp";
    private static final String SUCCESS = "eventpage.jsp";
=======
    public static final String ERROR = "eventpage.jsp";
    public static final String SUCCESS = "eventpage.jsp";
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
<<<<<<< HEAD
        String url = ERROR;
        HttpSession session = request.getSession();
        CommentError commentError = new CommentError("","");
        try{
            String commentID = request.getParameter("commentID");
            String commentContent = request.getParameter("commentContent"); 
            
            boolean check = true;
            if(commentContent.length()>500){
                check =false;
            }
            if(check){
               CommentDAO dao = new CommentDAO();
               CommentDTO cmt = new CommentDTO(commentID, commentContent);
               boolean checkUpdate = dao.updateComment(cmt);
               if(checkUpdate){
                   request.setAttribute("Comment Error", commentError);
               }
            } else {
                url = ERROR;
            }
        } catch(Exception e){
            log("Error at UpdateCommentController: " + e.toString());
        } finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
=======
        
>>>>>>> b7ee3afaeae9bc67af717edc5db030aa29c91199
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
