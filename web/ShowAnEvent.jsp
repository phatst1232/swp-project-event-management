<%@page import="user.UserDAO"%>
<%@page import="user.UserDTO"%>
<%@page import="event.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
<%@page import="event.eventDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/ShowAnEvent.css">
    </head>

    <body>

        <%
            UserDAO dao = new UserDAO();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String search = (String) request.getParameter("search");
            if (search == null) {
                search = "";
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
                    <form action="MainController" name="Search Bar">
                        <i id="but-search"><img src="image\search.png"></i>
                        <input type="text" name="search" id="name" value="<%=search%>" placeholder="Search...">
                        <input type="hidden" name="action" value="Search event">
                    </form>    
                    <span class="tooltip">Search</span>
                </li>
                <%
                    if (loginUser != null) {
                %>
                <li>
                    <a href="PersonalProfile.jsp">
                        <i id="user-search"><img src="image\icons8-user-24.png"></i>
                        <span class="link-name">Profile</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>
                <%
                    if ("AD".equals(loginUser.getRoleID()) || "CL".equals(loginUser.getRoleID()) || "DM".equals(loginUser.getRoleID())) {
                %>
                <li>
                    <a href="createEvent.jsp">
                        <i id="user-search"><img src="image/notepad-regular-24.png" style="width: 24px; height: 24px;"></i>
                        <span class="link-name">Create Event</span>
                    </a>
                    <span class="tooltip">User</span>
                </li>
                <%
                    }
                %>
                <li>
                    <a href="#">
                        <i id="noti-search"><img src="image\bell-solid-24.png"></i>
                        <span class="link-name">Notification</span>
                    </a>
                    <span class="tooltip">Notification</span>
                </li>
                <%
                    }
                %>
            </ul>
            <%
                if (loginUser == null) {
            %>
            <div class="profile-content">
                <div class="profile">
                    <div class="profile-detail">
                        <img src="image\icons8-user-24.png">
                        <div class="name-job">
                            <div class="name"><a href="Eventmanagement.jsp" style="text-decoration:none; "><label for="show">Login</label></a></div>
                            <!--                            <div class="job"><a href="#" style="text-decoration:none; ">Sign Up</a></div>-->
                        </div>
                    </div>
                    <i id="log-out"><img src="image\log-in-regular-24.png"></i>
                </div>
            </div>
            <%
            } else {
            %>
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
            <%
                }
            %>
        </div>

        <%
            eventDAO Edao = new eventDAO();
            eventDTO event = (eventDTO) session.getAttribute("CLICK_ON_EVENT");
            if (event != null) {

        %>

        <div class="container">

            <div class="contentwrapper">
                <div class="content">

                    <div class="wrapperbackground">
                        <div class="backgroundimg">
                            <!--                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQvCnBhDsLFBB5ljN-wSUMniM1PJzACAJ3sDA&usqp=CAU" width="100%" height="80%" alt="">-->
                            <img src="event-user-photo/<%=Edao.getImageLink(event.getEventID())%>" width="100%" height="80%" alt="">
                        </div>
                    </div>

                    <div class="discriptionwrapper">

                        <h1 class="eventname"><%=event.getEventName()%></h1>
                        <div class="tags"> 
                            <span> <img src="image/purchase-tag-alt-regular-24.png" width="24px" height="24px"  alt="">
                                <%
                                    List<String> listCategory = Edao.getListCategoty(event.getEventID());
                                    for (String category : listCategory) {
                                %>
                            </span> <a href=""><%=category%></a> 
                            <%
                                }
                            %>
                        </div>
                        <div class="gachchan">
                        </div>
                        <div class="discription">
                            <div class="discriptiontitle">
                                <h3>Description</h3>
                                <p>
                                    <%=event.getContent()%>
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
                <%
                    List<CommentDTO> listComment = Edao.getListComment(event.getEventID());
                    if (loginUser != null) {
                %>
                <div class="commentbox">
                    <div class="commentheader">
                        <h3> Bình luận (<%=listComment.size()%>)</h3>
                    </div>
                    <div class="commentseries">
                        <div class="mycommentbox">
                            <h2 style="margin-left: 20px;">Nhập bình luận</h2>
                            <div class="mybinhluanwrapper">
                                <form action="MainController">
                                    <div class="binhluancontent">
                                        <textarea placeholder="Enter comment here" name="commentContent" id="" cols="30" rows="10"></textarea>
                                    </div>
                                    <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>
                                    <%
                                        if (loginUser != null) {
                                    %>
                                    <input type="hidden" name="commentBy" value="<%=loginUser.getUserID()%>"/>
                                    <%
                                        }
                                    %>
                                    <div class="binhluanbuttonwrapper">
                                        <button class="dangbinhluan" name="action" value="post comment" >Đăng bình luận</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                        <div class="othercomment">
                            <!--   1 comment -->
                            <%
                                for (CommentDTO comment : listComment) {
                            %>
                            <div class="eachothercomment">
                                <div class="otherguestavatar">
                                    <img src="event-user-photo/<%=dao.getAvtLink(comment.getCommentBy())%>" alt="">
                                </div>
                                <div class="otherguestcontent">
                                    <div class="otherguestcontentname"><a href=""><%=dao.getUserName(comment.getCommentBy())%></a></div>
                                    <div class="otherguestcontentcomment"><%=comment.getCommentContent()%></div>

                                </div>
                            </div>
                            <%
                                }
                            %>

                            <!--                            <div class="eachothercomment">
                                                            <div class="otherguestavatar"><img
                                                                    src="https://c1.hako.re/lightnovel/illusts/u57841-1b0b910c-6f42-4448-b2d3-1da1cf1fe4a9.jpg"
                                                                    alt=""></div>
                                                            <div class="otherguestcontent">
                                                                <div class="otherguestcontentname"><a href="">Huyhunghang</a></div>
                                                                <div class="otherguestcontentcomment">ddddddddddddd</div>
                                                            </div>
                            
                                                        </div>
                            
                            
                                                        <div class="eachothercomment">
                                                            <div class="otherguestavatar"><img
                                                                    src="https://c1.hako.re/lightnovel/illusts/u57841-1b0b910c-6f42-4448-b2d3-1da1cf1fe4a9.jpg"
                                                                    alt=""></div>
                                                            <div class="otherguestcontent">
                                                                <div class="otherguestcontentname"><a href="">Huyhunghang</a></div>
                                                                <div class="otherguestcontentcomment">ddddddddddddd</div>
                                                            </div>
                            
                                                        </div>-->
                        </div>
                    </div>
                    <div class="sidebarright">
                        <div class="sidebarright-content">
                            <div class="sidebarheader">
                                <h4>CLUB/DM</h4><span
                                    <%
                                        String cldmName = "Admin";
                                        if (event.getClubID() != null) {
                                            cldmName = Edao.getClubName(event.getClubID());
                                        }
                                        if (event.getDmID() != null) {
                                            cldmName = Edao.getDMName(event.getDmID());
                                        }

                                    %>
                                    style="font-size: 20px; margin-top: 8px; color: white; font-weight: 700;"><%=cldmName%></span><br>
                            </div>
                            <h3>Time</h3>
                            <div class="contentfield">
                                <span class="contentfield">7.00 A.M</span><br>
                                <span class="contentfield"><%=event.getEventStartDate()%></span>
                            </div>
                            <div class="border">
                                <h3>Creator</h3>
                            </div>
                            <div class="contentfield">
                                <span class="contentfield"><%=Edao.getUserName(event.getUserID())%></span>
                            </div>

                            <h3>Limit</h3>
                            <div class="contentfield">
                                <span style="font-size: 24px; color: rgb(241, 90, 64);">123/<%=event.getLimitMember()%></span>
                            </div>

                        </div>
                        <div class="sidebarright-contact">
                            <button class="joinbutton contactbtn">
                                <h2>Join Now!!!</h2>
                            </button>
                            <div class="followliked">

                                <div class="buttonwrapper">
                                    <span>1000</span><br>
                                    <button class="followbutton contactbtn">
                                        <i><img src="image/notepad-regular-24.png" width="16px" alt=""></i>
                                        Follow
                                    </button>

                                </div>
                                <div class="buttonwrapper">
                                    <span><%=event.getLike()%></span><br>
                                    <button class="likebutton contactbtn">
                                        <i><img src="image/heart-regular-24.png" width="16px" alt=""></i>
                                        <span>Like</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%                    }
                %>        
            </div>

            <!--            <div class="comment">
                        </div>-->
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

            $(".contactbtn").click(function () {
                if ($(this).hasClass('disable')) {
                    $(this).removeClass('disable');
                } else {
                    $(this).addClass('disable');
                }
            });
        </script>
        <script>
            $(".contactbtn").click(function () {
                if ($(this).hasClass('disable')) {
                    $(this).removeClass('disable');
                } else {
                    $(this).addClass('disable');
                }
            });
        </script>
    </body>

</html>