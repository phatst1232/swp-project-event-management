<%@page import="java.util.List"%>
<%@page import="user.UserDTO"%>
<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>UserList</title>
        <link rel="stylesheet" href="user_managerment_style.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    </head>

    <body style="background-color: pink;">
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !"AD".equals(loginUser.getRoleID())) {
                response.sendRedirect("Eventmanagement.jsp");
                return;
            }
        %>
        <form action="SearchUserController" name="firstSearch">
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
                <img src="image\244351476_224631916395247_2148764225629497919_n.png" height="120px" width="140px">
            </div>

            <div id="searchbar">
                <form action="SearchUserController">
                    <input type="text" name="search" value="<%=search%>" placeholder="Search user..." />
                    <button type="submit" name="action" value="Search user"><img src="image\search.png" width="20px" height="20px" />
                    </button>
                </form>
            </div>

            <div id="category">
                <button id="categorybtn">
                    <img src="image\icons8-user-24.png">
                </button>
                <div id="category-content">
                    <a href="Eventmanagement.jsp">Home</a>
                    <a href="ListEvent.jsp">Event</a>
                    <a href="LogoutController">Sign Out</a>
                    <!--<a href="">Edit Profile</a>-->
                    <a href="createEvent.jsp">Create Event</a>


                </div>
            </div>
        </div>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div class="col-sm-5">
                                <h2>User <b>Management</b></h2>
                            </div>

                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Password</th>
                                <th>Role</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Email</th>                      
                                <th>Club ID</th>
                                <th>Department Manager ID</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<UserDTO> list = (List<UserDTO>) request.getAttribute("LIST_USER");
                                if (list != null) {
                                    if (!list.isEmpty()) {
                                        int count = 1;
                                        for (UserDTO user : list) {
                            %>  
                            <tr>
                                <td><%=count%></td>
                                <td><%=user.getUserID()%></td>
                                <td><%=user.getUserName()%></td>
                                <td><%=user.getPassword()%></td>
                                <td><%=user.getRoleID()%></td>
                                <td><%=user.getAddress()%></td>
                                <td><%=user.getPhoneNumber()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getClubID()%></td>
                                <td><%=user.getDmID()%></td>
                                <td><%=user.getStatusID()%></td>
                            </tr>
                            <%
                                }
                            } else {
                            %>
                        <h3>List event is empty!!!</h3>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                    <!-- <div class="clearfix">
                        <div class="hint-text">Showing <b>5</b> out of <b>25</b> entries</div>
                        <ul class="pagination">
                            <li class="page-item disabled"><a href="#">Previous</a></li>
                            <li class="page-item"><a href="#" class="page-link">1</a></li>
                            <li class="page-item"><a href="#" class="page-link">2</a></li>
                            <li class="page-item active"><a href="#" class="page-link">3</a></li>
                            <li class="page-item"><a href="#" class="page-link">4</a></li>
                            <li class="page-item"><a href="#" class="page-link">5</a></li>
                            <li class="page-item"><a href="#" class="page-link">Next</a></li>
                        </ul>
                    </div> -->
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('[data-toggle="tooltip"]').tooltip();
            });
        </script>

    </body>

</html>