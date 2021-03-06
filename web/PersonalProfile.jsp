<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/PersonalProfile.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="./js/PersonalProfile.js">
        <script>  function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah')
                                .attr('src', e.target.result);
                    };

                    reader.readAsDataURL(input.files[0]);
                }
            }</script>
        <style>img{
                max-width:180px;
            }
            input[type=file]{
                padding:10px;
</style>
        </head>

        <body>

            <!-- <div class="top">
                        <Button id="forward">Back</Button>
                    <div id="Logo">
                    </div>
            </div> -->
            <%
                UserDAO dao = new UserDAO();
              UserDTO  user= (UserDTO) session.getAttribute("Update_USER");

                UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                if (loginUser == null) {
                    response.sendRedirect("Eventmanagement.jsp");
                    return;
                }
            %>
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
                    <i id="but-search"><img src="image\search.png"></i>
                    <input type="text" placeholder="Search...">
                    <span class="tooltip">Search</span>
                </li>
                <li>
                    <a href="#">
                        <i id="user-search"><img src="image\home-solid-24.png" width="24px" height="24px"></i>
                        <span class="link-name">Home</span>
                    </a>
                    <span class="tooltip">Home</span>
                </li>
                <!-- <li>
                    <a href="#">
                        <i id="edit-search"><img src="image\pencil-solid-24.png"></i>
                        <span class="link-name">Edit</span>
                    </a>
                    <span class="tooltip">Edit</span>
                </li> -->
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
                            <div class="name"><%=loginUser.getUserName()%></div>
                            <div class="job"><%=loginUser.getMajorID()%></div>                    
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
        <div>
            <div class="extrabox">
                <div class="extrabox-content">
                    <div class="avatar"><img src="./event-user-photo/<%=loginUser.getAvtLink()%>" >
                    </div>

                    <div class="navigate">
                        <ul>
                            <li class=" tab"><button id="defaultOpen" class="tablink"
                                                     onclick="opentab('tabpro', this)"><i><img class="icon"
                                                                          src="./image/profile.PNG"
                                                                          alt=""></i><span class="label">Profile</span></button></li>
                            <li class="active tab"><button class="tablink" onclick="opentab('tabcon', this)"><i><img
                                            class="icon"
                                            src="./image/Account.PNG"
                                            alt=""></i><span class="label">Account Setting</span></button></li>
                            <li class=" tab"><button class="tablink" onclick="opentab('tabac', this)"><i><img class="icon"
                                                                                                              src="./image/calendar.PNG" alt=""></i><span
                                        class="label">Activities</span></button></li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class=" containerbox">
                <div id="tabcon" class=" accountcontent tabcontent">
                    <h1 class="tabtitle">Change Your User Detail</h1>
                    <form action="MainController" method="post" enctype="multipart/form-data">
                        <div class="accountwrapper">
                            <div class="accfieldrow">
                                <div class="accfieldbox">
                                    <label for="">User Name</label><input type="text" name="userName" value="<%=loginUser.getUserName()%>">
                                </div>
                                <div class="accfieldbox">
                                    <label for="">Address</label><input type="text" name="Address" value="<%=loginUser.getAddress()%>">
                                </div>
                            </div>
                            <div class="accfieldrow">
                                <div class="accfieldbox">
                                    <label for="">Phone Number</label><input type="text" name="phoneNumber" value="<%=loginUser.getPhoneNumber()%>">
                                </div>
                                <div class="accfieldbox">
                                    <label for="">Major</label><input type="text" value="<%=loginUser.getMajorID()%>"disabled>
                                </div>
                            </div>
                            <div class="accfieldrow">
                                <div class="accfieldbox">
                                    <label for="">Avatar</label> <input type="file"  onchange="readURL(this)" name="avtLink">
                                    <img id="blah" src="http://placehold.it/180" alt="your image" />
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="userID" value="<%=loginUser.getUserID()%>">
                        <input type="hidden" name="userName" value="<%=loginUser.getUserName()%>">
                        <input type="hidden" name="Address" value="<%=loginUser.getAddress()%>">
                        <input type="hidden" name="phoneNumber" value="<%=loginUser.getPhoneNumber()%>">
                        <input type="hidden" name="avtLink" value="<%=loginUser.getAvtLink()%>">;
                        <button type="submit" class="accsubmitbtn" name="action" value="userpr5">SAVE</button>
                    </form>

                </div>
                <div id="tabpro" class=" profilecontent tabcontent">
                    <h1 class="tabtitle">User Detail</h1>
                    <div class="profile fields"><span>User Name</span>
                        <div class="profile value"> <%=loginUser.getUserName()%></div>
                    </div>
                    <div class="profile fields"><span>User ID</span>
                        <div class="profile value"> <%=loginUser.getUserID()%></div>
                    </div>
                    <div class="profile fields"><span>Email</span>
                        <div class="profile value"> <%=loginUser.getEmail()%></div>
                    </div>
                    <div class="profile fields"><span>Phone</span>
                        <div class="profile value"> <%=loginUser.getPhoneNumber()%></div>
                    </div>
                    <div class="profile fields"><span>Club</span>
                        <div class="profile value"> <%=loginUser.getClubID()%></div>
                    </div>
                    <div class="profile fields"><span>Role</span>
                        <div class="profile value"> <%=loginUser.getRoleID()%></div>
                    </div>

                </div>
                <div id="tabac" class=" activitiescontent tabcontent">
                    <div class="eventbox">
                        <h1 class="tabtitle">Events</h1>
                        <section class="article-border">
                            <article class="article-item">

                                <p class="thumbnail"><img src=".\image\3959220.jpg" width="120px" height="120px"></p>
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
                                    <textarea class="article-summary">
 "H??m nay, t???i ch???t ki???m so??t g???n tr???m thu ph?? Long Ph?????c tr??n cao t???c TP HCM - Long Th??nh - D???u Gi??y 
(TP Th??? ?????c), c???nh s??t ch??? y??u c???u ng?????i v??o th??nh ph??? khai th??ng tin di chuy???n n???i ?????a qua ???ng d???ng VNEID, 
k??m ch???ng nh???n ti??m vaccine ph??ng Covid-19. M???t c??n b??? t???i ch???t cho hay ch??? nh???ng ng?????i ch??a ti??m vaccine; 
ti??m m??i m???t nh??ng ch??a ????? 14 ng??y ho???c kh???i Covid-19 ch??a ????? 6 th??ng m???i c???n gi???y x??t nghi???m. Ph???n l???n ng?????i 
qua ch???t ?????u ????p ???ng c??c ??i???u ki???n, kh??ng c???n l??m x??t nghi???m.
                                    </textarea>
                                </header>
                            </article>

                            <article class="article-item">

                                <p class="thumbnail"><img src=".\image\3959220.jpg" width="120px" height="120px"></p>
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
                                    <textarea class="article-summary">
                                    "This event help student espcially one who
                                    alwaysdhdhshfhsdhfshdfhshfhsdfhdshfhsdfhshdfhsdfhsdh
                                    dhhdfhhdsfhsdhfhsdfhsdhf
                                    couch potato and also for the one who love sport and fitness want to show there
                                    strength to orther people"

                                    jdjsdhshdhsdhshdhssadahsdhashdhas
                                    sajdasjdjasjdjsajdasjdjasjdjas
                                    ksdkkdsfkskdfksdkfdks dasjdhashdahsdhsahdhashdahsdhashdhasdhahsdhasd
                                    ashdhashdhashdahsdhashdhashdhasd ashdhashdahsdhahsdh
                                    </textarea>
                                </header>
                            </article>

                        </section>
                    </div>
                    <!-- <div class="commentbox">
                        <h1>Comments</h1>
                        <div class="commentcontent"></div>
                    </div> -->
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

    <!-- script navigation -->
    <script>
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
    </script>
</body>

</html>