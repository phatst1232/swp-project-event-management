<%-- 
    Document   : enventpagetest
    Created on : Oct 25, 2021, 10:20:27 PM
    Author     : benth
--%>

<%@page import="event.eventDTO"%>
<%@page import="comment.CommentDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EVENTPAGECommentTEST</title>
    </head>
    <body>
        <%UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <%eventDTO currentEvent = (eventDTO) session.getAttribute("CURRENT_EVENT");%>
        <form action="CommentAddController" method="POST">
            <input type="hidden" name="commentID" value="commentID">
            <input type="text" name ="commentContent">
            <!--<input type="hidden" name ="repliedTo">-->
                      
            <input type="hidden" name="commentBy" value="<%=loginUser.getUserID()%>">
            <input type="submit" name="action"/>                
            <input type="reset" value="Reset"/></br> </br>      
        </form>
    </body>
</html>
