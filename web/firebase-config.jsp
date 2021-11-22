<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://www.gstatic.com/firebasejs/7.2.0/firebase-app.js""></script>
        <script src="https://www.gstatic.com/firebasejs/7.2.0/firebase-database.js""></script>
        <script src="js/configFirebase.js"></script>      
    </head>
    <body>
        <p id="message">
            
        </p>
        <script>
            document.getElementById("message").innerHTML = "123";
        </script>
    </body>
</html>
