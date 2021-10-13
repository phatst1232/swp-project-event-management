<%@page import="user.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="logopage.css">
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("Eventmanagement.jsp");
                return;
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
                <form>
                    <input type="text" name="search" 
                           value="" placeholder="Search..." />
                    <button type="submit"><img src="image\search.png" width="20px" height="20px" />
                    </button>
                </form>
            </div>           

            <div id="category">
                <button id="categorybtn">
                    <img src="image\icons8-user-24.png">
                </button>
                <div id="category-content">
                    <a href="LoginPage.jsp">Home</a>

                    <a href="ListEvent.jsp">Event</a>

                    <%
                        if (loginUser.getRoleID().equals("CL") || loginUser.getRoleID().equals("DM") || loginUser.getRoleID().equals("AD")) {
                    %>
                    <a href="createEvent.jsp">Create event</a>
                    <%
                        }
                    %>

                    <a href="LogoutController">Sign Out</a>
                    <a href="">Edit Profile</a>               
                </div>
            </div>
        </div>


        <!-- contain stage  -->
        <div class="container">                        
            <!-- main -->
            <h2>Nearest Event</h2>
            <div class="slideshow-container">
                <div class="mySlides fade">
                    <img src="https://img.freepik.com/free-psd/event-planner-landing-page_23-2149104376.jpg?size=626&ext=jpg" width="100%">  
                </div>
                <button class="accordion" onclick="function()">
                    <img src=""/>Details</button>
                <div class="contain">
                    <p id="demo"></p>
                    <nav>  
                        <button id="book-tbl"><a href="#" style="text-decoration:none;"><span style="color: black;">Dat lich</span></a></button>
                    </nav>

                </div>


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
            <div id="sidebar">

            </div>

        </div>

        <!-- bottom stage  -->
        <div class="bottom">
            <div id="bot-nav">
                <div>
                    <a href="#">
                        <img src="https://img.icons8.com/ios-filled/50/000000/facebook-new.png" width="65%"/> </a>
                </div>

                <div>Contact</div>                   

                <div>
                    <a href="#">
                        <img src="https://img.icons8.com/ios-glyphs/50/000000/twitter.png" width="65%"/></a>
                </div>
            </div>
            <h3>@Copyright for fpt university group 2 project</h3>
        </div>
    </body>
</html>