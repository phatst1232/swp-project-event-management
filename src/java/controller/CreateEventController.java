///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package controller;
//
//import event.eventDAO;
//import java.io.File;
//import java.io.FileOutputStream;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.OutputStream;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.annotation.MultipartConfig;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import javax.servlet.http.Part;
//
///**
// *
// * @author AN515-52
// */
////tạm thời dùng để test up event nha
//@MultipartConfig(
//        fileSizeThreshold = 1024 * 1024 * 10,
//        maxFileSize = 1024 * 1024 * 50,
//        maxRequestSize = 1024 * 1024 * 100
//)
//public class CreateEventController extends HttpServlet {
//
//    private final String ERROR_PAGE = "error.jsp";
//    private final String VIEWBLOG = "testimg.jsp";//"ViewBlogByAuthorServlet";
//    private static final String UPLOAD_DIR = "event-user-photo";
//
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        request.setCharacterEncoding("UTF-8");
//        PrintWriter out = response.getWriter();
//        HttpSession session = request.getSession();
//        String url = ERROR_PAGE;
//        String eventID = request.getParameter("eventID");
//        String eventName = request.getParameter("eventName");
//        String imageURL = uploadFile(request);
////        String imageURL1 = uploadFile2(request);
//        try {
//            eventDAO dao = new eventDAO();
//            if (session != null) {
//                boolean result;
//               result = dao.updateImg(eventID, imageURL);
//                if (result) {
//                    url = VIEWBLOG;
//                } else {
//                    url = ERROR_PAGE;
//                }
//            }
//            response.sendRedirect(url); 
//        } catch (Exception e) {
//        } finally {
//            out.close();
//        }
//    }
//
//    private String uploadFile(HttpServletRequest request) throws IOException, ServletException {
//        String fileName = "";
//        try {
//            Part filePart = request.getPart("imageURL");
//            fileName = (String) getFileName(filePart);
//            String applicationPath = request.getServletContext().getRealPath("");
//            int end = applicationPath.lastIndexOf("build");
//            String truePath = applicationPath.substring(0, end) + "web";
//            String basePath = truePath + File.separator + UPLOAD_DIR + File.separator;
//            InputStream inputStream = null;
//            OutputStream outputStream = null;
//            try {
//                File outputFilePath = new File(basePath + fileName);
//                inputStream = filePart.getInputStream();
//                outputStream = new FileOutputStream(outputFilePath);
//                int read = 0;
//                final byte[] bytes = new byte[1024];
//                while ((read = inputStream.read(bytes)) != -1) {
//                    outputStream.write(bytes, 0, read);
//                }
//            } finally {
//                if (inputStream != null) {
//                    inputStream.close();
//                }
//                if (outputStream != null) {
//                    outputStream.close();
//                }
//            }
//
//        } catch (Exception e) {
//            fileName = "";
//        }
//        return fileName;
//    }
////private String uploadFile2(HttpServletRequest request) throws IOException, ServletException {
////        String fileName = "";
////        try {
////            Part filePart = request.getPart("imageURL1");
////            fileName = (String) getFileName(filePart);
////            String applicationPath = request.getServletContext().getRealPath("");
////            int end = applicationPath.lastIndexOf("build");
////            String truePath = applicationPath.substring(0, end) + "web";
////            String basePath = truePath + File.separator + UPLOAD_DIR + File.separator;
////            InputStream inputStream = null;
////            OutputStream outputStream = null;
////            try {
////                File outputFilePath = new File(basePath + fileName);
////                inputStream = filePart.getInputStream();
////                outputStream = new FileOutputStream(outputFilePath);
////                int read = 0;
////                final byte[] bytes = new byte[1024];
////                while ((read = inputStream.read(bytes)) != -1) {
////                    outputStream.write(bytes, 0, read);
////                }
////            } finally {
////                if (inputStream != null) {
////                    inputStream.close();
////                }
////                if (outputStream != null) {
////                    outputStream.close();
////                }
////            }
////
////        } catch (Exception e) {
////            fileName = "";
////        }
////        return fileName;
////    }
//    private String getFileName(Part part) {
//        final String partHeader = part.getHeader("content-disposition");
//        for (String content : part.getHeader("content-disposition").split(";")) {
//            if (content.trim().startsWith("filename")) {
//                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
//            }
//        }
//        return null;
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
