<%-- 
    Document   : SearchE
    Created on : Oct 18, 2021, 9:46:51 AM
    Author     : AN515-52
--%>

<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%            String SearchE = (String) request.getParameter("SearchE");
            if (SearchE == null) {
                SearchE = "";
            }
        %>
        <form action="MainController">
            Search  <input type="text" name="SearchE" value= "<%= SearchE%>">
            <button type="submit" name="action" value="SearchE">Check</button>
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
                        <th>Event ID</th>
                        <th>Like </th>
                    </tr>
                </thead>
                <%
                    int count = 1;
                    for (eventDTO event : list) {
                %>
                <form action="MainController" method="POST">
                <tbody>
                    <tr>
                        <th><%= count++%></th>
                        <td><%=event.getEventID()%></td>
                        <td><%=event.getLike()%></td>
                        <td>
                            <button type="submit" name ="action"value="Like">Like</button>
                            <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    </form>
                </tbody>
            </table>


            <%
                    }
                }
            %>
    </body>
</html>
