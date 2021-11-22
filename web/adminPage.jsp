<%@page import="user.UserDTO"%>
<%@page import="event.eventDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8">
        <title>Admin Page</title>
        <link rel="stylesheet" type="text/css" href="./css/admin.css">
        <script  src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("Eventmanagement.jsp");
                return;
            }
            eventDAO Edao = new eventDAO();
        %>
        <!-- navigation bar-->
        <div class="sidebar">
            <!-- Logo Admin Page -->
            <div class="logo-content">
                <img src="image/favourite.png" style="width: 24px; height: 24px;"><p>Admin Page</p>
            </div>



            <!--Content element to another admin section  -->
            <!-- tu add url toi 2 cai trang kia nha -->
            <ul>
                <li>
                    <a href="#">
                        <span >DashBoard</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <span >Event Manager</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>

                </li>
                <li>
                    <a href="#">
                        <span >User Manager</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>

                </li>
                <li>
                    <a href="#">
                        <span>Create Request</span>
                        <i><img src="image/left-arrow.png"></i>
                    </a>
                </li>
            </ul>

            <!-- button to click back to mainPage -->
            <button class="btn-main">
                <a href="LoginPage.jsp">Main Page</a>
            </button>
        </div>


        <!-- container element  -->
        <header>     
            <div id="category">
                <button type="hidden" onclick="myFunction()" class="categorybtn">
                    <img src="image/icons8-user-24.png">
                </button>
                <div id="category-content" class="dropdown-content">
                    <a href="PersonalProfile.jsp">Edit</a>
                    <a href="LogoutController">Log Out</a>
                </div>
            </div>
            <img src="image/bell-solid-24.png" width="30px" height="30px">
            <script type="text/javascript">
                /* When the user clicks on the button, 
                 toggle between hiding and showing the dropdown content */
                function myFunction() {
                    document.getElementById("category-content").classList.toggle("show");
                }

                // Close the dropdown if the user clicks outside of it
                window.onclick = function (event) {
                    if (!event.target.matches('.categorybtn')) {
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

        <div class="main-container">
            <!-- table show sum event -->
            <div class="grid">
                <div class="grid-item">
                    <p>Tổng event trong tháng này:</p>
                    <span><%=Edao.countEventOfThisMonth()%></span>
                    <p>Tháng trước:</p>
                    <span><%=Edao.countEventOfLastMonth()%></span>
                </div>
                <div class="grid-item">
                    <p>Tổng lượt tương tác:</p>
                    <span>????????</span>
                    <p>so với tháng trước</p>
                </div>
                <!--pie chart  -->
                <div id="chartContainer" style="height: 380px; width: 525px;">
                </div>

            </div>
            <!-- Script pie chart -->
            <script type="text/javascript">
                window.onload = function () {
                    var chart = new CanvasJS.Chart("chartContainer",
                            {
                                title: {
                                    text: "Event Management"
                                },
                                legend: {
                                    maxWidth: 400,
                                    itemWidth: 200
                                },
                                data: [
                                    {
                                        type: "pie",
                                        showInLegend: true,
                                        legendText: "{indexLabel}",
                                        dataPoints: [
                                            {y: <%=Edao.getQuantity()%>, indexLabel: "Âm nhạc"},
                                            {y: 3, indexLabel: "Wii"},
                                            {y: 4, indexLabel: "Xbox 360"},
                                            {y: 38, indexLabel: "Nintendo DS"},
                                            {y: 11, indexLabel: "PSP"},
                                        ]
                                    }
                                ]
                            });
                    chart.render();
                }
            </script>
            <div class="contain-list-event">
                <p>List event has most interact</p>
            </div>

            <div class="grid-2">
                <div class="grid-item-2">
                    <p>List event just start to create</p>
                </div>
                <div class="grid-item-2">
                    <p>List user just start to create</p>
                </div>
            </div>
        </div>



    </body>
</html>