<%-- 
    Document   : profile
    Created on : Oct 9, 2021, 10:07:08 PM
    Author     : AN515-52
--%>

<%@page import="user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
    </head>
    <body>
        <form action="MainController">
        <%UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>"></br>
        User Name <input type="text" name="userName" value="<%=loginUser.getUserName()%>"></br>
        Password <input type="text" name="password" value="<%=loginUser.getPassword()%>"></br>
        Address <input type="text" name="address" value="<%=loginUser.getAddress()%>"></br>
        Phone Number <input type="text" name="phonenumber" value="<%=loginUser.getPhoneNumber()%>"></br>
    Interested Detail <input type="text" name="interestedDetail" value="<%=loginUser.getInterestedDetail()%>"></br>
    <input  type="submit" name="action" value="updatepro">Update Pro</input>
    <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
    <input type="hidden" name="userName" value="<%=loginUser.getUserName()%>">
    <input type="hidden" name="password" value="<%=loginUser.getPassword()%>">
    <input type="hidden" name="address" value="<%=loginUser.getAddress()%>">
    <input type="hidden" name="phonenumber" value="<%=loginUser.getPhoneNumber()%>">
    <input type="hidden" name="interestedDetail" value="<%=loginUser.getInterestedDetail()%>">
        </form>
</body>
</html>
