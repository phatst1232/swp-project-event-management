<%-- 
    Document   : showevent
    Created on : Oct 4, 2021, 11:51:43 PM
    Author     : phats
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1><br/>
        
        <h2><%=request.getParameter("eventName")%></h2>
    </body>
</html>
