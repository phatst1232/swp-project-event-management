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

    private final static String ERROR = "error.jsp";
     public static final String SUCCESS = "ListEvent.jsp";
    private static final String UPLOAD_DIR = "event-user-photo";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        HttpSession session = request.getSession();
        eventErrors userError = new eventErrors("", "", "", "", "", "", "", "", "", "");
        try {
            eventDAO dao = new eventDAO();
            String cate1 = "";
            String cate2 = "";
            String cate3 = "";
            String slot1 = "";
            String slot2 = "";
            String slot3 = "";
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = user.getUserID();
            String eventID;
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
            int limitMember = Integer.parseInt(request.getParameter("capacity"));
            String eventName = request.getParameter("eventName");
            String content = request.getParameter("content");
            String category = request.getParameter("category");

            Date createDate = Date.valueOf(request.getParameter("createDate"));
            Date startDate = Date.valueOf(request.getParameter("Date"));
            eventDTO event = new eventDTO(eventID, eventName, createDate, startDate, userID, "AC", limitMember, content, clubID, dmID, 0);
            boolean checkEvent = dao.AddEvent(event);
            if (checkEvent) {
                String roomID = request.getParameter("roomID");
                String[] room = roomID.split("[|]");
                boolean checkRoom = dao.addRoom(eventID, room[0]);
                if (checkRoom) {
                    String imageURL = uploadFile(request);
                    boolean checkimg = dao.addImage(eventID, imageURL);
                    if (checkimg) {
                        String[] cate = category.split("\\s+");
                        boolean checkcate = false;
                        if (cate.length == 1) {
                            cate1 = cate[0];
                            dao.addCate(eventID, cate1);
                            checkcate = true;
                        } else if (cate.length == 2) {
                            cate1 = cate[0];
                            cate2 = cate[1];
                            dao.addCate(eventID, cate1);
                            dao.addCate(eventID, cate2);
                            checkcate = true;
                        } else if (cate.length == 3) {
                            cate1 = cate[0];
                            cate2 = cate[1];
                            cate3 = cate[2];
                            dao.addCate(eventID, cate1);
                            dao.addCate(eventID, cate2);
                            dao.addCate(eventID, cate3);
                            checkcate = true;
                        }
                        if (checkcate) {
                            String Slot = request.getParameter("slot");
                            boolean checkSlot = false;
                            String[] slots = Slot.split("\\s");
                            if (slots.length == 1) {
                                slot1 = slots[0];
                                dao.addSlot(eventID, slot1);
                                checkSlot = true;
                            } else if (slots.length == 2) {
                                slot1 = slots[0];
                                slot2 = slots[1];
                                dao.addSlot(eventID, slot1);
                                dao.addSlot(eventID, slot2);
                                checkSlot = true;
                            } else if (slots.length == 3) {
                                slot1 = slots[0];
                                slot2 = slots[1];
                                slot3 = slots[2];
                                dao.addSlot(eventID, slot1);
                                dao.addSlot(eventID, slot2);
                                dao.addSlot(eventID, slot3);
                                checkSlot = true;
                            }
                            if (checkSlot) {
                                url = SUCCESS;
                            }
                        }
                    }
                }

            }
        } catch (Exception e) {
            log("Error at CreateController: " + e.toString());
            if (e.toString().contains("duplicate")) {
                userError.setUserIDError("Duplicate UserID !!!");
                request.setAttribute("USER_ERROR", userError);
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
