<%-- 
    Document   : eventpage
    Created on : Oct 12, 2021, 9:46:07 PM
    Author     : phats
--%>

<%@page import="event.eventDTO"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Page</title>
    </head>
    <body>
        <h1>Show event space!</h1> </br>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            eventDTO event = (eventDTO) session.getAttribute("CLICK_ON_EVENT");
            if (event != null) {
        %>       
        <h2>Event ID: <%=event.getEventID()%></h2> </br>
        <h2>Event name: <%=event.getEventName()%></h2></br>
        <h2>Event create date: <%=event.getCreateDate()%></h2></br>
        <h2>Event start date: <%=event.getEventStartDate()%></h2></br>
        <h2>User ID: <%=event.getUserID()%></h2></br>
        <h2>Limit member: Limit member: ><%=event.getLimitMember()%></h2></br>
        </br>
        <h2>Content: <%=event.getContent()%></h2>
        </br>
        <h2>Club ID/Department manager ID: <%=event.getClubID()%></h2></br>
        <%
            }
        %>
    </body>
</html>
