<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css\PersonalProfile.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="js\PersonalProfile.js">
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
        <div class="top">
            <Button onclick="goBack()" id="forward">Back</Button>
            <div id="Logo">
            </div>
        </div>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
        <div>
            <div class="extrabox">
                <div class="extrabox-content">
                    <div class="avatar"><img src="<%=loginUser.getAvtLink()%>" alt="">
                                            
                    </div>

                    <div class="navigate">
                        <ul>

                            <li class="active tab"><button class="tablink" onclick="opentab('tabcon', this)"><i><img
                                            class="icon"
                                            src="image/Account.PNG"
                                            alt=""></i><span class="label">Edit Profile</span></button></li>
                            <li class=" tab"><button id="defaultOpen" class="tablink"
                                                     onclick="opentab('tabpro', this)"><i><img class="icon"
                                                                          src="image/profile.PNG"
                                                                          alt=""></i><span class="label">Public Info</span></button></li>

                            <li class=" tab"><button class="tablink" onclick="opentab('tabac', this)"><i><img class="icon"
                                                                                                              src="image/calendar.PNG" alt=""></i><span
                                        class="label">Activities</span></button></li>

                        </ul>
                    </div>
                </div>

            </div>
            <div class=" containerbox">
                <div id="tabcon" class=" accountcontent tabcontent">
                    <h1>Account</h1>
                    <form action="">
                        <div class="accountwrapper">
                            <div class="accfieldrow">
                                <div class="accfieldbox">
                                    <label for="">User Name</label><input type="text" value="Hi">
                                </div>
                                <div class="accfieldbox">
                                    <label for="">Address</label><input type="text">
                                </div>
                            </div>
                            <div class="accfieldrow">
                                <div class="accfieldbox">
                                    <label for="">Phone Number</label><input type="text">
                                </div>
                                <div class="accfieldbox">
                                    <label for="">Major</label><input type="text">
                                </div>
                            </div>
                            <h4 class="pwdtag">Password</h4>
                            <div class="pwd-accfieldrow">

                                <div class="pwd-accfieldbox">
                                    <label for="">Current Password</label><input type="text">
                                </div>
                                <div class="pwd-accfieldbox">
                                    <label for="">New Password</label><input type="text">
                                </div>
                                <div class="pwd-accfieldbox">
                                    <label for="">ReType</label><input type="text">
                                </div>
                            </div>
                        </div>
                        <button type="submit" class="accsubmitbtn">SAVE</button>
                    </form>

                </div>
                <div id="tabpro" class=" profilecontent tabcontent">
                    <h1>About</h1>
                    <div class="profile fields"><span>User Name</span>
                        <div class="profile value"><%=loginUser.getUserName()%></div>
                    </div>
                    <div class="profile fields"><span>User ID</span>
                        <div class="profile value"><%=loginUser.getUserID()%></div>
                    </div>
                    <div class="profile fields"><span>Email</span>
                        <div class="profile value"><%=loginUser.getEmail()%></div>
                    </div>
                    <div class="profile fields"><span>Phone</span>
                        <div class="profile value"><%=loginUser.getPhoneNumber()%></div>
                    </div>

                    <%
                        if (loginUser.getClubID() != null) {
                    %>

                    <div class="profile fields"><span>Club</span>
                        <div class="profile value"><%=dao.getClubName(loginUser.getClubID())%></div>
                    </div>

                    <%
                    } else if (loginUser.getDmID() != null) {
                    %>
                    <div class="profile fields"><span>Department Manager</span>
                        <div class="profile value"><%=dao.getClubName(loginUser.getDmID())%></div>
                    </div>
                    <%
                        }
                    %>
                    <div class="profile fields"><span>Roll</span>
                        <div class="profile value"><%=loginUser.getRoleID()%></div>
                    </div>

                </div>
                <div id="tabac" class=" activitiescontent tabcontent">
                    <div class="eventbox">
                        <h1>Events</h1>
                        <section class="article-border">

                            <article class="article-item">
                                <p class="thumbnail"><img src="image\3959220.jpg" width="120px" height="120px"></p>
                                <header contain>
                                    <p class="article-title">
                                        <a href="#">HealthCare Event for all member</a>
                                    </p>
                                    <p class="article-meta">
                                        <span class="active">
                                            <span>15:21</span>
                                            <span>9/10/2021</span>
                                        </span>
                                    </p>
                                    <p class="article-summary">
                                        "This event help student espcially one who
                                        alwaysdhdhshfhsdhfshdfhshfhsdfhdshfhsdfhshdfhsdfhsdh
                                        dhhdfhhdsfhsdhfhsdfhsdhf
                                        couch potato and also for the one who love sport and fitness want to show there
                                        strength to orther people"

                                        jdjsdhshdhsdhshdhssadahsdhashdhas
                                        sajdasjdjasjdjsajdasjdjasjdjas
                                        ksdkkdsfkskdfksdkfdks dasjdhashdahsdhsahdhashdahsdhashdhasdhahsdhasd
                                        ashdhashdhashdahsdhashdhashdhasd ashdhashdahsdhahsdh
                                    </p>
                                </header>
                            </article>
                            <---------------------------------------------------->
                            <article class="article-item">
                                <p class="thumbnail"><img src="image\3959220.jpg" width="120px" height="120px"></p>
                                <header contain>
                                    <p class="article-title">
                                        <a href="#">HealthCare Event for all member</a>
                                    </p>
                                    <p class="article-meta">
                                        <span class="active">
                                            <span>15:21</span>
                                            <span>9/10/2021</span>
                                        </span>
                                    </p>
                                    <p class="article-summary">
                                        "This event help student espcially one who always couch potato and also for the one
                                        who love sport and fitness want to show there strength to orther people"
                                    </p>
                                </header>
                            </article>

                        </section>
                    </div>
                    <div class="commentbox">
                        <h1>Comments</h1>
                        <div class="commentcontent"></div>
                    </div>
                </div>
            </div>

        </div>
                         
    <script>
        function opentab(tabName, elmnt, color) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            // tablinks = document.getElementsByClassName("tablink");
            // for (i = 0; i < tablinks.length; i++) {
            //     tablinks[i].style.backgroundColor = "";
            // }
            document.getElementById(tabName).style.display = "block";
            // var texts = document.getElementsByClassName('text');
            // for (var i = 0; i < texts.length; i++) {
            //     if (texts[i].classList.contains(tabName)) {
            //       texts[i].classList.add('show');
            //   } else {
            //       texts[i].classList.remove('show');
            //   }
            // }

        }
        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
    </script>
</body>

</html>