<%-- 
    Document   : creatEvent
    Created on : Oct 4, 2021, 10:31:16 PM
    Author     : phats
--%>

<%@page import="user.UserDTO"%>
<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Event Page</title>
    </head>
    <body>
        <h1>Create an event!</h1>
        <%UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <form action="MainController" method="POST">
            <input type="hidden" name="eventID" value="">            

            Event name<input type="text" name="eventName" required=""/>

            <input type="hidden" name="createDate" value="<%=java.sql.Date.valueOf(LocalDate.now())%>"/>

            Date start<input type="date" name="StartDate" required=""/>

            <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">

            Category ID<input type="text" name="categoryID" required=""/>

            <input type="hidden" name="statusID" value="AC"/>

            Limit Member<input type="text" name="limitMember" required=""/>

            Room ID<input type="text" name="RoomID" required=""/>         

            Interested ID<input type="text" name="interestedID" required=""/> 

            Content<input type="text" name="content" required="">           
            <%
                if (loginUser.getRoleID().equals("CL")) {
            %>
            ClubID<input type="text" name="clubID" required="">
            <%
            } else if (loginUser.getRoleID().equals("DM")) {
            %>
            DmID<input type="text" name="dmID" required="">
            <%
                } 
            %>         
            
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/>

        </form>
    </body>
</html>
