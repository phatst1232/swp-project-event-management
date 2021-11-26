<%-- 
    Document   : error
    Created on : Oct 3, 2021, 11:15:56 PM
    Author     : phats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <style>.swal-text{
                font-size: 25px;
            }</style>
    </head>
    <body>
        <script>
            swal(<%=request.getAttribute("Event_ERROR")%>);
        </script>

        <h1>Error: <%=request.getAttribute("Event_ERROR")%> </h1>
    </body>
</html>
