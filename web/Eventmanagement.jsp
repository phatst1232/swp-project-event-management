<!DOCTYPE html>
<html>

    <head>
        <title>Event management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/912e671d73.js" crossorigin="anonymous"></script>
        <script src="js/script.js"></script>

        <link rel="stylesheet" href="css/mainpage.css">
    </head>

    <body>
        <%
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
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
                    <form action="MainController">
                        <i id="but-search"><img src="image\search.png"></i>
                        <input type="text" name="search" value="<%=search%>" placeholder="Search...">
                        <input type="hidden" name="action" value="Search event">
                        <span class="tooltip">Search</span>
                    </form>
                </li>
                <li>
                    <a href="PersonalProfile.jsp">
                        <i id="user-search"><img src="image\icons8-user-24.png"></i>
                        <span class="link-name">User</span>                   
                    <span class="tooltip">User</span>
                    </a>
                </li>
                <li>
                    <a href="#">
                        <i id="edit-search"><img src="image\pencil-solid-24.png"></i>
                        <span class="link-name">Edit</span>
                    </a>
                    <span class="tooltip">Edit</span>
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
                            <div class="name"><a href="#" style="text-decoration:none; "><label for="show">Login</label></a></div>
                            <!--                            <div class="job"><a href="#" style="text-decoration:none; ">Sign Up</a></div>-->
                        </div>
                    </div>
                    <i id="log-out"><img src="image\log-in-regular-24.png"></i>
                </div>
            </div>
        </div>
        <!-- End Navigation Bar  -->


        <!-- Home Content -->
        <div class="home-content">
            <div class="event-content">
                <div class="content">
                    <p class="text">Space exploration</p>
                    <p class="txt"><img src="image/calendar-7-24.png" width="25px" height="25px">16/10</p>
                    <p id="demo"></p>
                    <a href="#">Join now</a>
                </div>
            </div>


            <div class="show-slide">

                <div class="grid-contain fade">
                    <div class="grid">
                        <div class="grid-item" style="background-image: url('event-user-photo/an-phuket-beach-venue-theme1.jpg');">
                            <p id="time-box">
                                <a href="#">Beach Event</a>
                            <p id="box"><img src="image/time-regular-24.png">16:00</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:352</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:234</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('event-user-photo/space-1821a-2400x1200.jpg');">
                            <p id="time-box">
                                <a href="#">Space Exploration</a>
                            <p id="box"><img src="image/time-regular-24.png">7:00</p>
                            </p>
                            <p>T6:22/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:879</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:999</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('event-user-photo/Music.jpeg');">
                            <p id="time-box">
                                <a href="#">Music</a>
                            <p id="box"><img src="image/time-regular-24.png">13h:15</p>
                            </p>
                            <p>T7:30/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:123</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:324</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('event-user-photo/posters-muscular-sports-man-stretching-out-over-dark-background.jpg');">
                            <p id="time-box">
                                <a href="#">Calisthenics</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('event-user-photo/images (1).jpg');">
                            <p id="time-box">
                                <a href="#">Cooking</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('event-user-photo/coding.jpg');">
                            <p id="time-box">
                                <a href="#">Coding</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                    </div>
                </div>

                
                <div class="grid-contain fade">
                    <div class="grid">
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Photo</a>
                            <p id="box"><img src="image/time-regular-24.png">19h00</p>
                            </p>
                            <p>T7:15/11/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:453</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:234</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Space Exploration</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Music</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:0</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Calisthenics</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Cooking</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Coding</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid-contain fade">
                    <div class="grid">
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Beach Event</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Space Exploration</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Music</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Calisthenics</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Cooking</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                        <div class="grid-item" style="background-image: url('./image/Sunset-Wallpapers-HD-A3.jpg');">
                            <p id="time-box">
                                <a href="#">Coding</a>
                            <p id="box"><img src="image/time-regular-24.png">16:10</p>
                            </p>
                            <p>T2:16/10/2021</p>
                            <div class="itm-flex">
                                <img src="image/heart-regular-24.png"><label id="like">Like:10</label>
                                <img src="image/star-regular-24.png"><label id="famous">Follow:10</label>
                            </div>
                        </div>
                    </div>
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>

                <div style="text-align: center;">
                    <span class="dot" onclick="currentSlide(1)">1</span>
                    <span class="dot" onclick="currentSlide(2)">2</span>
                    <span class="dot" onclick="currentSlide(3)">3</span>

                </div>
            </div>
            <!-- loginpopup -->
            <input type="checkbox" id="show" >
            <div id="loginbox">
                <label for="show" class="close-btn fas fa-times"></label>

                <div class="loginwelcome">
                    <h1>WELCOME</h1>
                </div>
                <form class="login form formactive" action="MainController" method="POST">
                    <p>Username</p>
                    <input type="text" name="userID" class="fields" placeholder="Enter Username" required>
                    <p>Password</p>
                    <input type="password" name="password" class="fields" placeholder="Enter Password" required><br>
                    <input type="submit" name="action" value="login"><br>
                    <div class="google-btn">
                        <div class="google-icon-wrapper">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/swp-project-event-management/login-google&response_type=code
                               &client_id=435275509930-p8hod642g2vq6cig8ln9g9u2oi3r71v0.apps.googleusercontent.com&approval_prompt=force">
                                <img class="google-icon" src="https://upload.wikimedia.org/wikipedia/commons/5/53/Google_%22G%22_Logo.svg"/>
                                <span class="ggtext">Login with Gmail</span>                              
                            </a>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <!-- End home content -->


    <script type="text/javascript">
        let but = document.querySelector("#but");
                let sidebar = document.querySelector(".sidebar");
                let searchBtn = document.querySelector("#but-search");
                let userBtn = document.querySelector("#user-search");
                let editBtn = document.querySelector("#edit-search");
                let
        notiBtn = document.querySelector("#noti-search");
                let
        logBtn = document.querySelector("#log-out");
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
        logBtn.onclick = function () {
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
    </script>




    <!-- contain stage  -->
    <!--  <div class="container">
            
             main -->



    <!-- Pop UP login BOx -->
    <!-- <input type="checkbox" id="show">
            <div id="loginbox">

                    <label for="show" class="close-btn fas fa-times"></label>

                    <div class="loginwelcome"><h1>WELCOME</h1></div>
                    <form  class="login form formactive" action="MainController" method="POST" >
                        <p>Username</p>
                        <input type="text" name="userID" class="fields" placeholder="Enter Username" required>
                        <p>Password</p>
                        <input type="password" name="password" class="fields" placeholder="Enter Password" required><br>
                        <input type="submit" name="action" value="login"><br>
                        <a class="btn-google" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/swp-project-event-management/login-google&response_type=code
                           &client_id=435275509930-p8hod642g2vq6cig8ln9g9u2oi3r71v0.apps.googleusercontent.com&approval_prompt=force"><img src="image\Google_icon.png"> LOGIN WITH FPT EMAIL</a>
                    </form>
                </div>
            </div> -->

    <!-- end of login box -->
    <!-- 
        </div> 


            <script type="text/javascript">

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


    <!-- bottom stage  -->
    <!--         <div class="bottom">
            <div id="bot-nav">
                <div>
                    <a href="#">
                        <img src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png" width="65%" /> </a>
                </div>

                <div>Contact</div>

                <div>
                    <a href="#">
                        <img src="https://img.icons8.com/ios-glyphs/50/000000/twitter.png" width="65%" /></a>
                </div>
            </div>
            <h3>@Copyright for fpt university group 2 project</h3>
        </div>
    -->
</body>

</html>