/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import event.eventDAO;
import event.eventDTO;
import event.eventErrors;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.LinkedList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import static jdk.nashorn.internal.objects.NativeError.getFileName;
import user.UserDTO;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddEventController extends HttpServlet {

    private final static String ERROR = "createEvent.jsp";
    private final static String SUCCESS = "LoginPage.jsp";
    private static final String UPLOAD_DIR = "event-user-photo";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        eventErrors eer = new eventErrors("", "", "", "", "", "", "", "", "", "");
        try {
            eventDAO dao = new eventDAO();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String eventID;
            int limitMember = Integer.parseInt(request.getParameter("capacity"));
            String eventName = request.getParameter("eventName");
            String content = request.getParameter("content");
            String category = request.getParameter("category");
            String roomID = request.getParameter("roomID");
            String Slot = request.getParameter("slot");
            Date createDate = Date.valueOf(request.getParameter("createDate"));
            Date startDate = Date.valueOf(request.getParameter("Date"));
            long millis = System.currentTimeMillis();
            Date date = new java.sql.Date(millis);
            boolean check = true;
            if (user.getRoleID().equals("CL")) {
                eventID = "CL";
            } else if (user.getRoleID().equals("DM")) {
                eventID = "DM";
            } else {
                eventID = "AD";
            }
            eventID = eventID + String.valueOf(dao.getQuantity() + 1);    //-- end of generation -//
            String clubID;
            switch (user.getRoleID()) {
                case "CL":
                    clubID = "CL";
                    break;
                default:
                    clubID = null;
                    break;
            }
            String dmID;
            switch (user.getRoleID()) {
                case "DM":
                    dmID = "DM";
                    break;
                default:
                    dmID = null;
                    break;
            }
            List er = new LinkedList();
            //room
            String imageURL = uploadFile(request);
            if (content.isEmpty()) {
                er.add("Please add content");
                check = false;
            }
            if (imageURL.isEmpty()) {
                er.add("Please add  Thumbnail picture");
                check = false;
            }
            String[] room = roomID.split("[|]");
            if (room.length > 4 || room.length < 1) {
                er.add("Room must between 1  and  4");
                check = false;
            }
            String[] cate = category.split("\\s+");
            if (cate.length > 4 || cate.length < 1) {
                er.add("Category must between  1  and  4");
                check = false;
            }
            String[] slots = Slot.split("\\s");
            if (slots.length > 4 || slots.length < 1) {
                er.add("Slot must between  1  and  4");
                check = false;
            }
            if (date.compareTo(startDate) > 0) {
                er.add("Start Date must be in future");
                check = false;
            }

            if (check) {
                eventDTO event = new eventDTO(eventID, eventName, createDate, startDate, userID, "AC", limitMember, content, clubID, dmID, 0);
                boolean checkEvent = dao.AddEvent(event);
                if (checkEvent) {
                    for (String ro : room) {
                        dao.addRoom(eventID, ro);
                    }
                    //cate
                    for (String ca : cate) {
                        dao.addCate(eventID, ca);
                    }
                    // slot
                    for (String sl : slots) {
                        dao.addSlot(eventID, sl);
                    }
                    dao.addImage(eventID, imageURL);
                    url = SUCCESS;
                }
            } else {
                request.setAttribute("Event_ERROR", er);
            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                eer.setUserIDError("Duplicate UserID !!!");
                request.setAttribute("USER_ERROR", eer);
            }
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
        String fileName = "";
        try {
            Part filePart = request.getPart("imageURL");
            fileName = (String) getFileName(filePart);
            String applicationPath = request.getServletContext().getRealPath("");
            int end = applicationPath.lastIndexOf("build");
            String truePath = applicationPath.substring(0, end) + "web";
            String basePath = truePath + File.separator + UPLOAD_DIR + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + fileName);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

        } catch (Exception e) {
            fileName = "";
        }
        return fileName;
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
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
