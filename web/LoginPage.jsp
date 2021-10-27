
<%@page import="event.eventDAO"%>
<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>

<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<!DOCTYPE html>
<html>

    <head>
        <title>User Page</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/loginpage.css">
    </head>

    <body>
        <%
            UserDAO dao = new UserDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("Eventmanagement.jsp");
                return;
            }
        %>
        <form action="SearchEventController" name="firstSearch">
            <input type="hidden" name="search" value="">
        </form>
        <%
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
        <%
            List<eventDTO> showing_list = (List<eventDTO>) request.getAttribute("LIST_EVENT");
            eventDAO Edao = new eventDAO();
            if (showing_list == null && search != null) {
                showing_list = Edao.getListEvent("");
            }
            eventDTO event = showing_list.get(0);
        %>
        <!-- navigation bar -->
        <div class="sidebar">
            <div class="logo-content">
                <div class="logo">
                    <img src="image\243476569_4979393015418472_7594668457206850499_n.png" width="60px" height="60px">
                    <div class="logo-name">Event</div>
                </div>
                <i id="but"><img src="image\menu-regular-24.png"></i>
            </div>
            <ul class="nav-list">
                <li>
                    <form action="MainController" name="Search Bar">
                        <i id="but-search"><img src="image\search.png"></i>
                        <input type="text" name="search" id="name" value="<%=search%>" placeholder="Search...">
                        <input type="hidden" name="action" value="Search event">
                    </form>    
                    <span class="tooltip">Search</span>
                </li>
                <li>
                    <a href="PersonalPorofile.jsp">
                        <i id="user-search"><img src="image\icons8-user-24.png"></i>
                        <span class="link-name">Profile</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>
                <li>
                    <a href="#">
                        <i id="noti-search"><img src="image\bell-solid-24.png"></i>
                        <span class="link-name">Notification</span>
                    </a>
                    <span class="tooltip">Notification</span>
                </li>
            </ul>
            <div class="profile-content">
                <div class="profile">
                    <div class="profile-detail">
                        <img src="image\icons8-user-24.png">
                        <div class="name-job">
                            <%
                                String loginUserName = loginUser.getUserName();
                                if (loginUser.getUserName().isEmpty() || loginUser.getUserName() == null) {
                                    loginUserName = "Not named yet";
                                }
                            %>
                            <div class="name"><%=loginUserName%></div>
                            <div class="job"><%=dao.getRoleName(loginUser.getRoleID())%></div>                    
                        </div>                           
                    </div>
                    <i id="log-out">
                        <button id="bt" style="background-color:#8afcfd; outline: none; border: none;">
                            <a href="LogoutController">
                                <img src="image\log-out-regular-24.png">
                            </a>
                        </button>
                    </i>
                </div>
            </div>
        </div>
        <!-- End navigation Bar  -->

        <!-- Home Content -->
        <div class="home-content">

            <div class="event-content">
                <div class="content">
                    <p class="text"><%=event.getEventName()%></p>
                    <p class="txt"><img src="image/calendar-7-24.png" width="25px" height="25px"><%=event.getEventStartDate()%></p>
                    <p id="demo"></p>

                    <form action="MainController" id="showEventForm">
                        <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>                           
                        <input type="hidden" name="action" value="show event"/>
                    </form>  
                    <a href="#" onclick="document.getElementById('showEventForm').submit()">Join now</a>
                </div>
            </div>


            <div class="show-slide">
                <%
//                    List<eventDTO> showing_list = (List<eventDTO>) request.getAttribute("LIST_EVENT");
//                    eventDAO dao = new eventDAO();
//                    if (showing_list == null && search != null) {
//                        showing_list = dao.getListEvent("");
//                    }
//                    eventDTO event = new eventDTO();

                    int num_of_slide = 0;
                    if (showing_list != null) {
                        if (showing_list.size() % 6 == 0 && showing_list.size() != 0) {
                            num_of_slide = showing_list.size() / 6;
                        } else {
                            num_of_slide = showing_list.size() / 6 + 1;
                        }

                        if (!showing_list.isEmpty()) {
                            int index = 0;
                            for (int i = 1; i <= num_of_slide; i++) {
                %>
                <div class="grid-contain fade">
                    <div class="grid">
                        <%
                            for (int j = 0; j <= 5; j++) {
                                if (index < showing_list.size()) {
                                    event = showing_list.get(index);
                                    index++;
                                    String like = String.valueOf(event.getLike());
                                    String follow = String.valueOf(Edao.countFollow(event.getEventID()));
                        %>
                        <div class="grid-item" style="background-image: url('<%=Edao.getImageLink(event.getEventID())%>');">
                            <p id="time-box">
                                <a href="ShowAnEvent.jsp"><%=event.getEventName()%>
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                </a>
                            <p id="box"><img src="image/time-regular-24.png">Slot: <%=Edao.getListSlot(event.getEventID())%></p>
                            </p>
                            <p><%=event.getEventStartDate()%></p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:<%=like%></label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:<%=follow%></label>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <%
                    }
                %>
                <%
                } else {
                %>
                <h2>Not thing found!!!</h2>
                <%
                    }
                %>
                <%
                } else {
                %>
                <h2>The list is Null!!!</h2>
                <%
                    }
                %>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <div style="text-align: center;">
                    <%
                        for (int i = 1; i <= num_of_slide; i++) {
                    %>
                    <span class="dot" onclick="currentSlide(<%=i%>)"><%=i%></span>
                    <%
                        }
                    %>                         
                </div>
            </div>


        </div>



        <script type="text/javascript">
            let
            but = document.querySelector("#but");
            let
            sidebar = document.querySelector(".sidebar");
            let
            searchBtn = document.querySelector("#but-search");
            let
            userBtn = document.querySelector("#user-search");
            let
            editBtn = document.querySelector("#edit-search");
            let
            notiBtn = document.querySelector("#noti-search");
            but.onclick = function () {
                sidebar.classList.toggle("active");
            }

            searchBtn.onclick = function () {
                sidebar.classList.toggle("active");
            }

            userBtn.onclick = function () {
                sidebar.classList.toggle("active");
            }

            editBtn.onclick = function () {
                sidebar.classList.toggle("active");
            }

            notiBtn.onclick = function () {
                sidebar.classList.toggle("active");
            }



            var slideIndex = 1;
            showSlides(slideIndex);

            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlide(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                var i;
                var slides = document.getElementsByClassName("grid-contain");
                var dots = document.getElementsByClassName("dot");
                if (n > slides.length) {
                    slideIndex = 1
                }
                if (n < 1) {
                    slideIndex = slides.length
                }
                for (i = 0; i < slides.length; i++) {
                    slides[i].style.display = "none";
                }
                for (i = 0; i < dots.length; i++) {
                    dots[i].className = dots[i].className.replace(" active", "");
                }
                slides[slideIndex - 1].style.display = "block";
                dots[slideIndex - 1].className += " active";
            }


            // Set the date we're counting down to
            var countDownDate = new Date("Jan 5, 2022 15:37:25").getTime();

            // Update the count down every 1 second
            var x = setInterval(function () {

                // Get today's date and time
                var now = new Date().getTime();

                // Find the distance between now and the count down date
                var distance = countDownDate - now;

                // Time calculations for days, hours, minutes and seconds
                var days = Math.floor(distance / (1000 * 60 * 60 * 24));
                var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                var seconds = Math.floor((distance % (1000 * 60)) / 1000);

                // Output the result in an element with id="demo"
                document.getElementById("demo").innerHTML = days + "d " + hours + "h "
                        + minutes + "m " + seconds + "s " + "left";

                // If the count down is over, write some text 
                if (distance < 0) {
                    clearInterval(x);
                    document.getElementById("demo").innerHTML = "EXPIRED";
                }
            }, 0);
        </script>



    </div>

    <script type="text/javascript">
        let
        but = document.querySelector("#but");
        let
        sidebar = document.querySelector(".sidebar");
        let
        searchBtn = document.querySelector("#but-search");
        let
        userBtn = document.querySelector("#user-search");
        let
        editBtn = document.querySelector("#edit-search");
        let
        notiBtn = document.querySelector("#noti-search");
        but.onclick = function () {
            sidebar.classList.toggle("active");
        }

        searchBtn.onclick = function () {
            sidebar.classList.toggle("active");
        }

        userBtn.onclick = function () {
            sidebar.classList.toggle("active");
        }

        editBtn.onclick = function () {
            sidebar.classList.toggle("active");
        }

        notiBtn.onclick = function () {
            sidebar.classList.toggle("active");
        }

    </script>

</body>

</html>