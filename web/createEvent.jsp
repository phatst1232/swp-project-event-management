<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Event Page</title>
    </head>
    <body>
        <%UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");%>
        <h1>Create an event! Hi, <%=loginUser.getUserName()%>! </h1>
        <form action="MainController" method="POST">
            <input type="hidden" name="eventID" value="">            

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    </script>
    <script src="https://cdn.tiny.cloud/1/8my3f4oobwgch3da52qojo7g9oko7704n1bu135edm12xo20/tinymce/5/tinymce.min.js"
        referrerpolicy="origin"></script>
    <!-- <script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> -->
    <script src="https://kit.fontawesome.com/912e671d73.js" crossorigin="anonymous"></script>

    <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
    <title>Create Event</title>
    <link rel="stylesheet" href="css/CreateEvent.css">
    <script src="js/CreateEvent3.js" defer></script>
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
                max-width:480px;
                max-height: 280px;
            }
            input[type=file]{
                padding:10px;
</style>

</head>

<body>
    <div>
        <div class="left" id="left">
            <div class="createeventbox">
                <form action="MainController" method="post" enctype="multipart/form-data" id="createform">
                       <div class="space"></div><span class="title">Enter Event Name</span><br> <input type="text" name="eventName"
                        class="fields" placeholder="Event Name " required><br>
                    <div class="space"></div><span class="title">Max Participants</span><br> <input type="text" name="capacity"
                        class="fields" placeholder="Enter estimated participants " required><br>
                 


                    <!-- dropdown categories -->
                    <div class="space"></div><span class="title">Categories</span>
                    <div class="multi-select2">
                        <div class="select-field2">
                            <input type="text" name="category" placeholder="Choose categories" id="hihi2" class="input-selector2"
                                required>
                            <span class="down-arrow2">&blacktriangledown; </span>

                        </div>

                        <div class="slotlist2">
                            <label for="Meow1" class="catetask">
                                <input class="catepick" value="CLUBA" type="checkbox" name="" id="Meow1">Cooking
                            </label>
                            <label for="Meow2" class="catetask">
                                <input class="catepick" value="F&D" type="checkbox" name="" id="Meow2">Food And Drink
                            </label>
                            <label for="Meow3" class="catetask">
                                <input class="catepick" value="IP" type="checkbox" name="" id="Meow3">Inspire
                            </label>
                            <label for="Meow4" class="catetask">
                                <input class="catepick" value="AN" type="checkbox" name="" id="Meow4">Music
                            </label>
                            <label for="Meow5" class="catetask">
                                <input class="catepick" value="SA" type="checkbox" name="" id="Meow5">School's Activities
                            </label>
                            <label for="Meow6" class="catetask">
                                <input class="catepick" value="SP" type="checkbox" name="" id="Meow6">Speech
                                Review
                            </label>
                        </div>


                    </div>


                    <!-- Time slot -->
                    <div class="space"></div><span class="title">Date</span><br>

                    <input type="date"  name="Date" data-date-inline-picker="true" width="70%" /><br>
                    <div class="space"></div><span class="title">Slots</span>
                    <div class="multi-select">
                        <div class="select-field">
                            <input type="text" name="slot" placeholder="Choose Time" id="hihi" class="input-selector" required>
                            <span class="down-arrow">&blacktriangledown; </span>
                        </div>
                        <div class="slotlist">
                            <label for="task1" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="1" type="checkbox" name=""
                                        id="task1">Slot 1</div> <span>7.00 - 8.30</span>
                            </label>
                            <label for="task2" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="2" type="checkbox" name=""
                                        id="task2">Slot 2</div> <span>8.45 - 10.15</span>
                            </label>
                            <label for="task3" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="3" type="checkbox" name=""
                                        id="task3">Slot 3</div> <span>10.30 - 12.00</span>
                            </label>
                            <label for="task4" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="4" type="checkbox" name=""
                                        id="task4">Slot 4</div> <span>12.30 - 14.00</span>
                            </label>
                            <label for="task5" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="5" type="checkbox" name=""
                                        id="task5">Slot 5</div> <span>14.15 - 15.45</span>
                            </label>
                            <label for="task5" class="task">
                                <div class="meowmeow"><input class="taskcheck" value="6" type="checkbox" name=""
                                        id="task5">Slot 6</div> <span>16.00 - 17.30</span>
                            </label>
                        </div>


                    </div>
                    


                    <!-- input cho PhÃ²ng báº­n -->
                    <input type="text" id="occuredrooms" value=" 315 316" onChange="updateTable()"
                        style="display: none;">


                    <!-- <span class="title contenttitle" style="margin-right: 30px;"> AddContent</span> -->
                    <div class="roomfield">
                        <span class="title">Choose Rooms</span><br>
                        <span style="font-size: 14px;">(Choose from left table)</span>
                        <!-- <input type="text"   id="rooms"
                        placeholder="Event rooms" ><br> -->
                        <input type="text" name="roomID" id="rooms" style="display: none;">
                        <div id="roomss"></div>
                        <div class="border"></div>
                    </div>

                    <!-- content -->
                    <label class="addcontent" for="show">Add Content  +</label>

                    <!-- texteria -->

                    <!-- DÃ²ng dÆ°á»i cho hiá»n áº©n content nÃªn Äá»«ng care -->
                    <input type="checkbox" id="show">  
                    <div id="contentbox"  class="textarea">
                        <label for="show" class="close-btn fas fa-times"></label>
                        <span class="title">Event Content</span>
                        <textarea name="content"class="textareacontent"> </textarea>
                        <!-- <input type="image" width="50px"> -->
                        <span class="title">Thumbnail</span>
                        <input type="file"  onchange="readURL(this)" name="imageURL" style="margin-top: 30px;" class="imgfields"  placeholder="Choose Thumbnail Image">
                        <img id="blah" src="http://placehold.it/180" alt="your image" />
                        <!-- <button type="button" onclick="showtextaria()"></button> -->
                    </div>

                    <!-- input slot áº©n -->
                    <!-- <div class="Createbtn"><input type="submit" value="Create Event"></div>
                    <input type="reset" class="reset" value="Reset"> -->
                    <div class="btncover">
                        <input type="hidden" name="createDate" value="<%=java.sql.Date.valueOf(LocalDate.now())%>"/>
                        <div class="Createbtn"><input type="submit" name="action"  value="Create_Event"></div>
                        <div class="Createbtn"><input type="reset" class="reset" value="Reset"></div>
    
                        <!-- <input type="reset" class="reset" value="Reset"> -->
                        </div>
                    <!-- <button class="reset">Reset</button> -->
                </form>
            </div>
        </div>

<!--      <script>
            tinymce.init({
                selector: 'textarea',

            });
            // function showtextaria() {
            //     if ($(".texteria").hasClass('default')) {
            //         $(".texteria").removeClass('default')
            //         $(".texteria").addClass('texteriaactive')

            //     } else {
            //         $(".texteria").removeClass('texteriaactive')
            //         $(".texteria").addClass('default')
            //     }
            // }
        </script>-->

        <!-- script datepick -->
        <script>



            // show occured rooms
            function updateTable(e) {
                if (!document.getElementById('occuredrooms').value) {
                    var x = document.getElementsByClassName('tblbtn');
                    for (j = 0; j <= x.length - 1; j++) {
                        x[j].classList.remove('inactive');
                        x[j].classList.add('default');
                    }
                }


                let arr = document.getElementById('occuredrooms').value.split('/');
                var x = document.getElementsByClassName('tblbtn');

            Interested ID<input type="text" name="interestedID" required=""/> 

            Content<input type="text" name="content" required="">           
            <%
                if (loginUser.getRoleID().equals("CL")) {
            %>
            ClubID<input type="text" name="clubID" required="">
            <%
            } else if (loginUser.getRoleID().equals("DM")) {
            %>
            DmID<input type="text" name="dmID" required="">
            <%
                }
            %>         
            <input type="submit" name="action" value="Create"/>
            <input type="reset" value="Reset"/></br> </br>
            <a href="LoginPage.jsp">Home</a> </br>
            <a href="ListEvent.jsp">Event</a> </br>
            <a href="LogoutController">Logout</a> </br>         
        </form>
    </body>
</html>
</head>

<body>




</body>

</html>
