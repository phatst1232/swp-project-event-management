<%-- 
    Document   : testimg
    Created on : Oct 17, 2021, 11:15:34 PM
    Author     : AN515-52
--%>

<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainController" method="post" enctype="multipart/form-data">
            <input type="text" name="eventID" value=""/></br>
         Thum bail   <input type="file" name="imageURL"></br>
           Context Pic <input type="file" name="imageURL1"></br>
            <input type="submit" name="action" value="create" ></button>
            <%            String SearchE = (String) request.getParameter("SearchE");
                if (SearchE == null) {
                    SearchE = "";
                }
            %>
            Search  <input type="text" name="SearchE" value= "<%=SearchE%>">
            <button type="submit" name="action" value="SearchE">Check</button>
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
                        <th>Like </th>
                        <th>Image </th>
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
                        <td><%=event.getEventID()%></td>
                        <td>
                            <img src="./images/<%=event.getImg2()%>"
                        </td>
                        <td>
                            <img src="./images/<%=event.getImg()%>"
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
