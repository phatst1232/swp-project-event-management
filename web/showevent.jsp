<%-- 
    Document   : showevent
    Created on : Oct 4, 2021, 11:51:43 PM
    Author     : phats
--%>

<%@page import="event.eventDTO"%>
<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Event Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("Eventmanagement.html");
                return;
            }
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <h1>Hello my Admin: <%=loginUser.getUserName()%></h1><br/>

        <form action="MainController">
            <input type="submit" name="action" value="logout"/> 
        </form> 
        </br>
        <form action="MainController">
            Search<input type="text" name="search" value="<%=search%>"/>            
            <input type="submit" name="action" value="Search event"/>
        </form> 

        <%
            List<eventDTO> list = (List<eventDTO>) request.getAttribute("LIST_EVENT");
            if (list != null) {
                if (!list.isEmpty()) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Event Name</th>
                    <th>Start Date</th>
                    <th>Category ID</th>
                    <th>Limit member</th>
                    <th>Room ID</th>
                    <th>Interest ID</th>                     
                    <th>Club/Department manager ID</th>
                    <th></th>
                </tr>
            </thead>

            <tbody>
                <%
                    int count = 1;
                    for (eventDTO event : list) {
                %>
                <tr>
                    <td><%=count++%></td>
                    <td><%=event.getEventName()%></td>
                    <td><%=event.getEventStartDate()%></td>
                    <td><%=event.getCategoryID()%></td>
                    <td><%=event.getRoomID()%></td>
                    <td><%=event.getRoomID()%></td>
                    <td><%=event.getInterestedID()%></td>
                    <%
                        if (loginUser.getRoleID().equals("CL")) {
                    %>
                    <th><%=event.getClubID()%></th>
                        <%
                        } else if (loginUser.getRoleID().equals("DM")) {
                        %>
                    <th><%=event.getDmID()%></th>
                        <%
                            } else {
                            %>
                    <th>--Orther Role--</th>
                            <%
                        }
                        %>
                </tr>         
                <%
                    }
                %>
            </tbody>
        </table>
        <%
        } else {
        %>
        <h2>The list is empty!</h2 >
        <%
                }
            }
        %>
    </body>
</html>
