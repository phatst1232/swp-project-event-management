<%@page import="java.util.Map"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
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


        <!-- container element  -->
        <header>     
            <div class="dropdown">
                <button onclick="myFunction()" class="dropbtn"></button>
                <div id="myDropdown" class="dropdown-content">
                    <a href="PersonalProfile.jsp">Edit</a>
                    <a href="LogoutController" onclick="return confirm('Are you sure you want to logout?');">Log Out</a>
                </div>
            </div>

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
        <%
            Hashtable<String, String> chartData = Edao.getChartData();
        %>
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
                    <p>Club's Activities:</p>
                    <span><%=chartData.get("Club-Activies")%></span>
                </div>
                <!--pie chart  -->
                <div id="chartContainer"">
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
                <%
                                                for (Map.Entry<String, String> e : chartData.entrySet()) {
                %>
                                            {y: <%=Integer.parseInt(e.getValue())%>, indexLabel: "<%=e.getKey()%>"},
                <%
                                                }
                %>
                                        ]
                                    }
                                ]
                            });
                    chart.render();
                }
            </script>

            <%
                List<eventDTO> interact_list = Edao.getListEvent("", "like_desc", "no");
                List<eventDTO> justCreate_list = Edao.getListEvent("", "eventCreateDate_desc", "no");
            %>

            <div class="contain-list-event">
                <div class="list-event">
                    <p>List event has most interact</p>
                    <%
                        if (interact_list.size() >= 5) {
                            for (int i = 0; i <= 5; i++) {
                    %>
                    <p><%=i + 1%>. <%=interact_list.get(i).getEventName()%></p>
                    <%
                        }
                    } else {
                        for (int i = 0; i <= interact_list.size() - 1; i++) {
                    %>
                    <p><%=i + 1%>. <%=interact_list.get(i).getEventName()%></p>
                    <%
                            }
                        }
                    %>
                </div>

                <div class="list-event">
                    <p>List event just start to create</p>
                    <%
                        if (justCreate_list.size() >= 5) {
                            for (int i = 0; i <= 5; i++) {
                    %>
                    <p><%=i + 1%>. <%=justCreate_list.get(i).getEventName()%></p>
                    <%
                        }
                    } else {
                        for (int i = 0; i <= justCreate_list.size() - 1; i++) {
                    %>
                    <p><%=i + 1%>. <%=justCreate_list.get(i).getEventName()%></p>
                    <%
                            }
                        }
                    %>
                </div>   

            </div>                     
        </div>



    </body>
</html>