<%-- 
    Document   : userManagePage
    Created on : Nov 23, 2021, 10:42:45 AM
    Author     : phats
--%>

<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
<%@page import="event.eventDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>
            User Management
        </title>
        <link rel="stylesheet" type="text/css" href="./css/eventPage.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    </head>
    <body style="background-color: #F2CED8;">

        <!--Search all user to show for the first time access page-->
        <form action="SearchUserController" name="firstSearch">
            <input type="hidden" name="search" value="">
            <input type="hidden" name="from" value="userManagePage">
        </form>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("Eventmanagement.jsp");
                return;
            }

            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
        %>
        <script type="text/javascript">
            document.firstSearch.submit();
        </script>
        <%
            }
        %>



        <div class="sidebar">
            <!-- Logo Admin Page -->
            <div class="logo-content">
                <img src="image/favourite.png" style="width: 24px; height: 24px;"><p>Admin Page</p>                   
            </div>

            <!--Content element to another admin section  -->
            <ul>
                <li>
                    <a href="adminPage.jsp">
                        <span >DashBoard</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>
                </li>
                <li>
                    <a href="eventManagePage.jsp">
                        <span >Event Manager</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>

                </li>
                <li>
                    <a href="userManagePage.jsp">
                        <span >User Manager</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>

                </li>
            </ul>

            <!-- button to click back to mainPage -->
            <button class="btn-main">
                <a href="LoginPage.jsp">Main Page</a>
            </button>
        </div>

        <!-- home content -->
        <!-- header to login -->
        <header>     
            <div class="dropdown">
                <button onclick="myFunction()" class="dropbtn"></button>
                <div id="myDropdown" class="dropdown-content">
                    <a href="PersonalProfile.jsp">Edit</a>
                    <a href="LogoutController" onclick="return confirm('Are you sure you want to logout?');">Log Out</a>
                </div>
            </div>

            <form action="MainController" class="search-bar">
                <input type="text" name="search" id="name" value="<%=search%>" placeholder="Search...">
                <input type="submit" name="action" value="Search user">
                <input type="hidden" name="from" value="userManagePage">

                <!--                <img src="image/bell-solid-24.png" width="30px" height="30px">    -->
            </form>



            <script type="text/javascript">
                /* When the user clicks on the button, 
                 toggle between hiding and showing the dropdown content */
                function myFunction() {
                    document.getElementById("myDropdown").classList.toggle("show");
                }

                // Close the dropdown if the user clicks outside of it
                window.onclick = function (event) {
                    if (!event.target.matches('.dropbtn')) {
                        var dropdowns = document.getElementsByClassName("dropdown-content");
                        var i;
                        for (i = 0; i < dropdowns.length; i++) {
                            var openDropdown = dropdowns[i];
                            if (openDropdown.classList.contains('show')) {
                                openDropdown.classList.remove('show');
                            }
                        }
                    }
                }
            </script>
        </header>

        <!-- main contain -->
        <div class="main-container">
            <div class="container-xl">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-5">
                                    <h2>User <b>Management</b></h2>
                                </div>

                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>No</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Password</th>
                                    <th>Role</th>
                                    <th>Address</th>
                                    <th>Phone Number</th>
                                    <th>Email</th>                      
                                    <th>Club ID</th>
                                    <th>Department Manager ID</th>
                                    <th>Status</th>
                                    <th>Update User</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                                    if (list != null) {
                                        if (!list.isEmpty()) {
                                            int count = 1;
                                            for (UserDTO user : list) {
                                %>  
                            <form action="MainController">

                                <tr>
                                    <td><%=count++%></td>
                                    <td><%=user.getUserID()%></td>
                                    <td><input type="text" name="userName" value="<%=user.getUserName()%>"/></td>
                                    <td><%=user.getPassword()%></td>
                                    <td><input type="text" name="roleID" value="<%=user.getRoleID()%>"/></td>
                                    <td><input type="text" name="address" value="<%=user.getAddress()%>"/></td>
                                    <td><input type="text" name="phoneNumber" value="<%=user.getPhoneNumber()%>"/></td>
                                    <td><input type="text" name="email" value="<%=user.getEmail()%>"/></td>
                                    <td><input type="text" name="clubID" value="<%=user.getClubID()%>"/></td>
                                    <td><input type="text" name="dmID" value="<%=user.getDmID()%>"/></td>
                                    <td><input type="text" name="statusID" value="<%=user.getStatusID()%>"/></td>
                                    <td>
                                        <input type="hidden" name="userID" value="<%=user.getUserID()%>">
                                        <input type="hidden" name="from" value="userManagePage">
                                        <input type="submit" name="action" value="Update user"/> 
                                    </td>
                                    <td>                                       
                                        <a href="MainController?action=Delete user&from=userManagePage&userID=<%=user.getUserID()%>&search=<%=search%>">Delete</a>
                                    </td>
                                </tr>
                            </form>
                            <%
                                }
                            } else {
                            %>
                            <h3>List event is empty!!!</h3>
                            <%
                                }
                            } else {
                            %>
                            <h3>Not thing found!!!</h3>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    $('[data-toggle="tooltip"]').tooltip();
                });
            </script>
        </div>
    </body>
</html>
