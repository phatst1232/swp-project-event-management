<%@page import="event.eventDTO"%>
<%@page import="event.eventDAO"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Document</title>
        <link rel="stylesheet" href="css/ShowAnEvent.css">
    </head>

    <body>


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
                    <a href="Eventmanagement.jsp">
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
                            <div class="name">Thong</div>
                            <div class="job">Student</div>
                        </div>
                    </div>
                    <i id="log-out">
                        <button id="bt" style="background-color:#8afcfd; outline: none; border: none;">
                            <a href="#">
                                <img src="image\log-out-regular-24.png">
                            </a>
                        </button>
                    </i>
                </div>
            </div>
        </div>

        <%
            eventDTO event = (eventDTO) session.getAttribute("CLICK_ON_EVENT");
            if (event != null) {                                                            //    <!--CLICK_ON_EVENT is null-->

        %>

        <div class="container">

            <div class="contentwrapper">
                <div class="content">
                    <div class="wrapperbackground">
                        <div class="backgroundimg"><img
                                src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvCnBhDsLFBB5ljN-wSUMniM1PJzACAJ3sDA&usqp=CAU"
                                width="100%" height="80%" alt=""></div>
                    </div>
                    <div class="discriptionwrapper">

                        <h1 class="eventname"><%=event.getEventName()%></h1>
                        <div class="tags"> <span> <img src="/img/purchase-tag-alt-regular-24.png" width="24px" height="24px"  alt=""></span> <a href="">Dảk</a> <a href="">bủh</a> <a href="">Lmao</a></div>
                        <div class="gachchan">
                        </div>
                        <div class="discription">
                            <div class="discriptiontitle">
                                <h3>Discripton</h3>
                                <p> Ma Vương mạnh nhất Leonis phong ấn sự tồn tại của mình lại trong hơn 1000 năm để chuẩn bị cho trận chiến cuối cùng trong tương lai. Tuy nhiên, sau giấc ngủ ngàn năm, hắn ta đột trở về với thân hình của một cậu bé 10 tuổi!

                                    "Tại sao em lại bị nhốt ở đây? Mọi chuyện ổn rồi. Chị sẽ bảo vệ em."

                                    Được cô gái xinh đẹp Lyseria bao bọc, Ma Vương Leonis bắt đầu cuộc hành trình của mình tại Học Viện Thánh Kiếm.

                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="commentbox">
                    <div class="commentheader">
                        <h3> Bình Luận (365)</h3>
                    </div>
                    <div class="commentseries">
                        <div class="mycommentbox">
                            <h2 style="margin-left: 20px;">Nhập Bình luận</h2>
                            <div class="mybinhluanwrapper">
                                <div class="binhluancontent">
                                    <textarea placeholder="Enter comment here" name="" id="" cols="30" rows="10"></textarea>
                                </div>
                                <div class="binhluanbuttonwrapper">
                                    <button class="dangbinhluan">Đăng bình luận</button>
                                </div>
                            </div>



                        </div>
                        <div class="othercomment">
                            <!-- đây là 1 comment -->
                            <div class="eachothercomment">
                                <div class="otherguestavatar"><img
                                        src="https://c1.hako.re/lightnovel/illusts/u57841-1b0b910c-6f42-4448-b2d3-1da1cf1fe4a9.jpg"
                                        alt=""></div>
                                <div class="otherguestcontent">
                                    <div class="otherguestcontentname"><a href="">Huyhunghang</a></div>
                                    <div class="otherguestcontentcomment">Tại sao lá cây lại có màu cầu vòng ?</div>
                                </div>

                            </div>

                            <div class="eachothercomment">
                                <div class="otherguestavatar"><img
                                        src="https://c1.hako.re/lightnovel/illusts/u57841-1b0b910c-6f42-4448-b2d3-1da1cf1fe4a9.jpg"
                                        alt=""></div>
                                <div class="otherguestcontent">
                                    <div class="otherguestcontentname"><a href="">Huyhunghang</a></div>
                                    <div class="otherguestcontentcomment">Tại sao lá cây lại có màu cầu vòng ?</div>
                                </div>

                            </div>


                            <div class="eachothercomment">
                                <div class="otherguestavatar"><img
                                        src="https://c1.hako.re/lightnovel/illusts/u57841-1b0b910c-6f42-4448-b2d3-1da1cf1fe4a9.jpg"
                                        alt=""></div>
                                <div class="otherguestcontent">
                                    <div class="otherguestcontentname"><a href="">Huyhunghang</a></div>
                                    <div class="otherguestcontentcomment">Tại sao lá cây lại có màu cầu vòng ?</div>
                                </div>

                            </div>


                        </div>
                    </div>
                </div>
                <div class="sidebarright">
                    <div class="sidebarright-content">
                        <div class="sidebarheader">
                            <h4>CLUB</h4><span
                                style="font-size: 20px; margin-top: 8px; color: white; font-weight: 700;">Huyhuh</span><br>
                        </div>
                        <h3>Time</h3>
                        <div class="contentfield">
                            <span class="contentfield">7.00 A.M</span><br>
                            <span class="contentfield">25/10/2021</span>
                        </div>
                        <div class="border">
                            <h3>Creator</h3>
                        </div>
                        <div class="contentfield">
                            <span class="contentfield">Huyhunghang</span>
                        </div>

                        <h3>Limit</h3>
                        <div class="contentfield">
                            <span style="font-size: 24px; color: rgb(241, 90, 64);">123/200</span>
                        </div>

                    </div>
                    <div class="sidebarright-contact">
                        <button class="joinbutton">
                            <h2>Join Now!!!</h2>
                        </button>
                        <div class="followliked">

                            <div class="buttonwrapper">
                                <span>1000</span><br>
                                <button class="followbutton">
                                    <i><img src="/img/notepad-regular-24.png" width="16px" alt=""></i>
                                    Follow
                                </button>

                            </div>
                            <div class="buttonwrapper">
                                <span>1001</span><br>
                                <button class="likebutton">
                                    <i><img src="/img/heart-regular-24.png" width="16px" alt=""></i>
                                    <span>Like</span>
                                </button>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="comment">

            </div>


        </div>
        <%
            }
        %>
        <script>
            let but = document.querySelector("#but");
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