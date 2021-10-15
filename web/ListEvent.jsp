<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="event.eventDTO"%>
<%@page import="user.UserDTO"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="list.css">
    </head>
    <body>  
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
//            if (loginUser == null) {
//                response.sendRedirect("Eventmanagement.jsp");
//                return;
//            }
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


        <!-- top stage -->
        <div class="top">
            <div id="Logo">
                <img src="image\244351476_224631916395247_2148764225629497919_n.png"
                     height="100px"
                     width="100px">
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
                    <img src="image\icons8-user-24.png">
                </button>
                <div id="category-content">
                    <a href="LoginPage.jsp">Home</a>                    
                    <a href="createEvent.jsp">Create event</a>
                    <%
                        if (loginUser != null) {
                    %>
                    <a href="LogoutController">Sign Out</a>
                    <a href="">Edit Profile</a>
                    <%
                        }
                    %>
                    

                </div>
            </div>
        </div>

        <!-- Container Page  -->
        <section class="wrapper" data-count="2"> 

            <header class="wrapper-title">
                <h3> Newest Event </h3>
            </header>
            <section class="article-border" >          
                <!---------------------->
                <%
                    List<eventDTO> list = (List<eventDTO>) request.getAttribute("LIST_EVENT");
                    if (list != null) {
                        if (!list.isEmpty()) {
                            int count = 1;
                            for (eventDTO event : list) {
                %>            
                <article class="article-item">
                    <p class="thumbnail"><img src="image\3959220.jpg" width="100px" height="100px"></p>
                    <header contain>
                        <p class="article-title">
                        <form action="MainController">
                            <input type="hidden" name="eventID" value="<%=event.getEventID()%>"/>                           
                            <button type="submit" name="action" value="show event" id="btnlink"><%=event.getEventName()%></button>
                        </form>                          
                        </p>
                        <p class="article-meta">
                            <span class="active">
                                <span>15:21</span>
                                <span><%=event.getCreateDate()%></span>
                            </span> 
                        </p>
                        <p class="article-summary">
                            <%=event.getContent()%>
                        </p>
                    </header>
                </article>                       
                <%
                    }
                } else {
                %>
                <h3>List event is empty!!!</h3>
                <%
                        }
                    }
                %>

            </section>
        </section>
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
            <h4>@Copyright for fpt university group 2 project</h4>
        </div>
    </body>
</html>