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
    </head>
    <body>
        <h1>Error: <%= session.getAttribute("ERROR_MESSAGE")%> </h1>
        <h1>Hello World!</h1>
    </body>
</html>
