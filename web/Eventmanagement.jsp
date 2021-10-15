<!DOCTYPE html>
<html>

    <head>
        <title>Event management</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://kit.fontawesome.com/912e671d73.js" crossorigin="anonymous"></script>
        <script src="script.js"></script>

        <link rel="stylesheet" href="mainpage.css">
    </head>

    <body>
        <%
            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>
        <!-- top stage -->
        <div class="top">
            <div id="Logo">
                <img src="image\244351476_224631916395247_2148764225629497919_n.png" 
                     height="120px"
                     width="140px">
            </div>
            <div id="searchbar">
                <form action="MainController">
                    <input type="text" name="search" 
                           value="<%=search%>" placeholder="Search..." />
                    <button type="submit" name="action" value="Search event"><img src="image\search.png" width="20px" height="20px" />
                    </button>
                </form>
            </div>        

            <div id="category">
                <button id="categorybtn">
                    <img src="image\icons8-listing-24.png" />
                </button>
                <div id="category-content">
                    <a href="">Home</a>
                    <a href="ListEvent.jsp">Event</a>
                    <a href=""><label for="show">Login</label></a>
                </div>
            </div>
        </div>


        <!-- contain stage  -->
        <div class="container">
            <!-- main -->
            <h2>Upcoming! Do not miss!!!</h2>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <img src="https://img.freepik.com/free-psd/event-planner-landing-page_23-2149104376.jpg?size=626&ext=jpg"
                         width="100%">
                </div>
                <button class="accordion" onclick="function()">
                    <img src="" 
                         width="15px">Details </button>
                <div class="contain">
                    <p id="demo"></p>

                </div>
                <!-- pop-up login box code -->
                <input type="checkbox" id="show">

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
                <!-- end of login box -->

            </div> <br>

            <script type="text/javascript">
                var acc = document.getElementsByClassName("accordion");
                var i;

                for (i = 0; i < acc.length; i++) {
                    acc[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var panel = this.nextElementSibling;
                        if (panel.style.maxHeight) {
                            panel.style.maxHeight = null;
                        } else {
                            panel.style.maxHeight = panel.scrollHeight + "px";
                        }
                    });
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
                            + minutes + "m " + seconds + "s ";

                    // If the count down is over, write some text 
                    if (distance < 0) {
                        clearInterval(x);
                        document.getElementById("demo").innerHTML = "EXPIRED";
                    }
                }, 0);
            </script>

            <!-- side -->
         <!--   <div id="sidebar">

            </div>  --!>

        </div>

        <!-- bottom stage  -->
        <div class="bottom">
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
    </body>

</html>