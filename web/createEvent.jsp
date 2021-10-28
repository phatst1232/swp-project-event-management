<%@page import="java.time.LocalDate"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page autoFlush="true" buffer="1094kb"%>
<!DOCTYPE html>

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

                for (j = 0; j <= x.length - 1; j++) {
                    x[j].classList.remove('inactive');
                    x[j].classList.add('default');
                }

                for (i = 0; i <= arr.length - 1; i++) {
                    for (j = 0; j <= x.length - 1; j++) {
                        if (x[j].innerHTML == arr[i]) {
                            x[j].classList.add('inactive');
                            x[j].classList.remove('default');
                        }
                    }
                }
            }
        </script>
        <!-- Slot time js -->
        <script>
            document.querySelector('.select-field').addEventListener('click', () => {
                document.querySelector('.slotlist').classList.toggle('showlist');
                document.querySelector('.down-arrow').classList.toggle('rotate180');
                var x = document.getElementsByClassName('taskcheck');
                var meow = '';
                x.forEach
                for (var i = 0; x[i]; ++i) {
                    if (x[i].checked) {
                        meow = meow + x[i].value + " ";
                    }
                    // document.getElementsByClassName('input-selector').value = meow;

                }
                // alert(meow);
                document.getElementById('hihi').value = meow;
            });
        </script>
        <!-- categories js -->
        <script>
            document.querySelector('.select-field2').addEventListener('click', () => {
                document.querySelector('.slotlist2').classList.toggle('showlist2');
                document.querySelector('.down-arrow2').classList.toggle('rotate180');
                var x = document.getElementsByClassName('catepick');
                var meow1 = '';
                x.forEach
                for (var i = 0; x[i]; ++i) {
                    if (x[i].checked) {
                        meow1 = meow1 + x[i].value + " ";
                    }
                    // document.getElementsByClassName('input-selector').value = meow;

                }
                // alert(meow);
                document.getElementById('hihi2').value = meow1;
            });
        </script>
        <!-- privious btn -->
<!-- <div class="previous"></div>     -->

        <button class="previous">&laquo;</button>



    </div>
    <div class="right" id="right">
        <div class="tabs">
            <button onclick="opentable('content0')">FLOOR 0</button>
            <button onclick="opentable('content16')">FLOOR 1-6</button>
        </div>
        <div class="addroombtn"><button onclick="myFunction()" class="addroombtn">Add rooms</button></div>


        <div class="tab-content">
            <div id="content16" class="roomtable" style="display: none;">
                <table class="tg">
                    <thead>
                        <tr>
                            <th class="tg-0lax tblbtn default">137</th>
                            <th class="tg-baqh tblbtn default">136</th>
                            <th class="tg-0lax tblbtn default">134</th>
                            <th class="tg-0lax tblbtn default">133</th>
                            <th class="tg-0lax tblbtn default">132</th>
                            <th class="tg-0lax tblbtn default">131</th>
                            <th class="tg-0lax tblbtn default">130</th>
                            <th class="tg-0x09">stairs</th>
                            <th class="tg-0lax tblbtn default">127</th>
                            <th class="tg-0lax tblbtn default">126</th>
                            <th class="tg-0lax tblbtn default">125</th>
                            <th class="tg-0lax tblbtn default">124</th>
                            <th class="tg-0lax tblbtn default">123</th>
                            <th class="tg-0lax tblbtn default">122</th>
                            <th class="tg-0x09">stair</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tg-0x09">wc</td>
                            <td class="tg-2nhx">stairs</td>
                            <td class="tg-0lax tblbtn default">234</td>
                            <td class="tg-0lax tblbtn default">233</td>
                            <td class="tg-0lax tblbtn default">232</td>
                            <td class="tg-0lax tblbtn default">231</td>
                            <td class="tg-0lax tblbtn default">230</td>
                            <td class="tg-0x09">stairs</td>
                            <td class="tg-0lax tblbtn default">227</td>
                            <td class="tg-0lax tblbtn default">226</td>
                            <td class="tg-0lax tblbtn default">225</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09">stairs</td>
                            <td class="tg-0x09">wc</td>
                            <td class="tg-0lax tblbtn default">121</td>
                        </tr>
                        <tr>
                            <td class="tg-0x09" colspan="2" rowspan="6">LIBRARY</td>
                            <td class="tg-844l tblbtn default">LUK7</td>
                            <td class="tg-844l tblbtn default">LUK8</td>
                            <td class="tg-844l tblbtn default">LUK9</td>
                            <td class="tg-844l tblbtn default">LUK10</td>
                            <td class="tg-844l tblbtn default">LUK11</td>
                            <td class="tg-844l tblbtn default">LUK12</td>
                            <td class="tg-844l tblbtn default">LUK13</td>
                            <td class="tg-844l tblbtn default">LUK14</td>
                            <td class="tg-844l tblbtn default">LUK15</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0lax tblbtn default">315</td>
                            <td class="tg-0lax tblbtn default">224</td>
                            <td class="tg-0lax tblbtn default">120</td>
                        </tr>
                        <tr>
                            <td class="tg-844l tblbtn default">LUK6</td>
                            <td class="tg-4aw5 tblbtn default">HALL B</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-6t6o tblbtn default">HALL A</td>
                            <td class="tg-0x09">425<br>SW WS</td>
                            <td class="tg-0x09">tea break</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0lax tblbtn default">422</td>
                            <td class="tg-0lax tblbtn default">314</td>
                            <td class="tg-0lax tblbtn default">223</td>
                            <td class="tg-0lax tblbtn default">119</td>
                        </tr>
                        <tr>
                            <td class="tg-844l tblbtn default">LUK5</td>
                            <td class="tg-0lax tblbtn default">404</td>
                            <td class="tg-99c3">HALL B</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-99c3">HALL A</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0lax tblbtn default">421</td>
                            <td class="tg-0lax tblbtn default">313</td>
                            <td class="tg-0lax tblbtn default">222</td>
                            <td class="tg-0lax tblbtn default">118</td>
                        </tr>
                        <tr>
                            <td class="tg-844l tblbtn default">LUK4</td>
                            <td class="tg-0lax tblbtn default">406</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0lax tblbtn default">420</td>
                            <td class="tg-0lax tblbtn default">312</td>
                            <td class="tg-0lax tblbtn default">221</td>
                            <td class="tg-0lax tblbtn default">117</td>
                        </tr>
                        <tr>
                            <td class="tg-844l tblbtn default">LUK3</td>
                            <td class="tg-0lax tblbtn default">407</td>
                            <td class="tg-0lax tblbtn default">408</td>
                            <td class="tg-0lax tblbtn default">409</td>
                            <td class="tg-0lax tblbtn default">410</td>
                            <td class="tg-0x09">stairs</td>
                            <td class="tg-0lax tblbtn default">412</td>
                            <td class="tg-0lax tblbtn default">413</td>
                            <td class="tg-99c3">HALL C</td>
                            <td class="tg-0lax tblbtn default">419</td>
                            <td class="tg-0lax tblbtn default">311</td>
                            <td class="tg-0lax tblbtn default">220</td>
                            <td class="tg-0lax tblbtn default">116</td>
                        </tr>
                        <tr>
                            <td class="tg-844l tblbtn default">LUK2</td>
                            <td class="tg-844l tblbtn default">LUK1</td>
                            <td class="tg-0lax tblbtn default">301</td>
                            <td class="tg-0lax tblbtn default">302</td>
                            <td class="tg-0lax tblbtn default">303</td>
                            <td class="tg-0lax tblbtn default">304</td>
                            <td class="tg-0lax tblbtn default">305</td>
                            <td class="tg-0lax tblbtn default">306</td>
                            <td class="tg-0lax tblbtn default">307</td>
                            <td class="tg-99c3 tblbtn default">HALL C</td>
                            <td class="tg-0lax tblbtn default">310</td>
                            <td class="tg-0lax tblbtn default">219</td>
                            <td class="tg-0lax tblbtn default">115</td>
                        </tr>
                        <tr>
                            <td class="tg-0x09"></td>
                            <td class="tg-2nhx">201<br>GD WS</td>
                            <td class="tg-0lax tblbtn default">202</td>
                            <td class="tg-0lax tblbtn default">203</td>
                            <td class="tg-0lax tblbtn default">204</td>
                            <td class="tg-0lax tblbtn default">205</td>
                            <td class="tg-0lax tblbtn default">206</td>
                            <td class="tg-0lax tblbtn default">207</td>
                            <td class="tg-0lax tblbtn default">208</td>
                            <td class="tg-0lax tblbtn default">209</td>
                            <td class="tg-0lax tblbtn default">211</td>
                            <td class="tg-0lax tblbtn default">212</td>
                            <td class="tg-0lax tblbtn default">213</td>
                            <td class="tg-0x09"></td>
                            <td class="tg-0x09"></td>
                        </tr>
                        <tr>
                            <td class="tg-0x09">tea break</td>
                            <td class="tg-2nhx">IT SP</td>
                            <td class="tg-0lax tblbtn default">104</td>
                            <td class="tg-0lax tblbtn default">105</td>
                            <td class="tg-0lax tblbtn default">106</td>
                            <td class="tg-0x09">stairs</td>
                            <td class="tg-0lax tblbtn default">108</td>
                            <td class="tg-0lax tblbtn default">109</td>
                            <td class="tg-0lax tblbtn default">110</td>
                            <td class="tg-0lax tblbtn default">111</td>
                            <td class="tg-0lax tblbtn default">112</td>
                            <td class="tg-0x09" colspan="4"></td>
                        </tr>
                    </tbody>
                </table>

            </div>
            <div id="content0" class="roomtable">
                <table class="tg">
                    <colgroup>
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 37px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 59px">
                        <col style="width: 34px">
                        <col style="width: 34px">
                        <col style="width: 59px">
                        <col style="width: 49px">
                        <col style="width: 54px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="tg-nb2d tblbtn default">041</th>
                            <th class="tg-0pky tblbtn default">040</th>
                            <th class="tg-0pky tblbtn default">039</th>
                            <th class="tg-266k">stair</th>
                            <th class="tg-0pky tblbtn default">037</th>
                            <th class="tg-0pky tblbtn default">036</th>
                            <th class="tg-0pky tblbtn default">035</th>
                            <th class="tg-0pky tblbtn default">034</th>
                            <th class="tg-0pky tblbtn default">033</th>
                            <th class="tg-9u2q">door 2</th>
                            <th class="tg-0pky tblbtn default">029</th>
                            <th class="tg-0pky tblbtn default">028</th>
                            <th class="tg-9u2q">door 1</th>
                            <th class="tg-9u2q">711</th>
                            <th class="tg-9u2q">stair</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="tg-c3ow tblbtn default">042</td>
                            <td class="tg-266k" colspan="13"></td>
                            <td class="tg-9u2q">seats</td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q"></td>
                            <td class="tg-266k" rowspan="7"></td>
                            <td class="tg-8sb3 pick" colspan="5" rowspan="7">Lotus pond</td>
                            <td class="tg-bwtg tblbtn default" colspan="6" rowspan="7 ">Yard
                            </td>
                            <td class="tg-266k" rowspan="7"></td>
                            <td class="tg-c3ow tblbtn default">025</td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow tblbtn default">044</td>
                            <td class="tg-c3ow tblbtn default">024</td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow tblbtn default">045</td>
                            <td class="tg-c3ow tblbtn default">023</td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q">LB2</td>
                            <td class="tg-c3ow tblbtn default">022</td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q"></td>
                            <td class="tg-c3ow tblbtn default">021</td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q"></td>
                            <td class="tg-c3ow tblbtn default">020</td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q">LB1</td>
                            <td class="tg-9u2q"></td>
                        </tr>
                        <tr>
                            <td class="tg-9u2q"></td>
                            <td class="tg-266k" colspan="13"></td>
                            <td class="tg-9u2q"></td>
                        </tr>
                        <tr>
                            <td class="tg-c3ow tblbtn default"> 001</td>
                            <td class="tg-0pky tblbtn default">004</td>
                            <td class="tg-0pky tblbtn default">005</td>
                            <td class="tg-0pky tblbtn default">006</td>
                            <td class="tg-0pky tblbtn default">007</td>
                            <td class="tg-0pky tblbtn default">008</td>
                            <td class="tg-266k">stair</td>
                            <td class="tg-0pky tblbtn default">010</td>
                            <td class="tg-0pky tblbtn default">011</td>
                            <td class="tg-0pky tblbtn default">012</td>
                            <td class="tg-0pky tblbtn default">013</td>
                            <td class="tg-0pky tblbtn default">014</td>
                            <td class="tg-0pky tblbtn default">015</td>
                            <td class="tg-ho3n tblbtn default" colspan="2" rowspan="2 ">Lobby
                            </td>
                        </tr>
                        <tr>
                            <td class="tg-p8sp tblbtn default" colspan="4">Main stairs 3</td>
                            <td class="tg-p8sp tblbtn default" colspan="5 ">Main stairs 2</td>
                            <td class="tg-p8sp tblbtn default" colspan="4 ">Main stairs 1</td>
                        </tr>
                    </tbody>
                </table>

            </div>


            <!-- js xÃ¡c nháº­n phÃ²ng -->
            <script>
                function myFunction() {
                    var fullroom = "";
                    var x = document.getElementsByClassName("tblbtn tbnactive");
                    // var y = document.getElementById("rooms").value=x[i].innerHTML + ",";
                    var i;
                    for (i = 0; i < x.length; i++) {
                        fullroom = fullroom + x[i].innerHTML + "|"
                        // var y = document.getElementById("rooms").value.add=x[i].innerHTML + ",";
                    }
                    var y = document.getElementById("rooms").value = fullroom;
                    var z = document.getElementById("roomss").innerHTML = fullroom;


                }
            </script>

            <!-- js cá»§a show phÃ²ng trong 2 báº£ng-->
            <script>
                function opentable(tabName, elmnt) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("roomtable");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    // tablinks = document.getElementsByClassName("tablink");
                    // for (i = 0; i < tablinks.length; i++) {
                    //     tablinks[i].style.backgroundColor = "";
                    // }
                    document.getElementById(tabName).style.display = "block";


                }
            </script>
            <!-- js cá»§a categories -->
            <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
            <!-- <script src="/content.js"></script> -->
            <script>
                $(document).ready(function () {
                    // Country
                    var items = [
                        { value: 1, text: 'Music' },
                        { value: 2, text: 'Talk Show' },
                        { value: 3, text: 'Food' },
                        { value: 4, text: 'Club Activities' },
                        { value: 5, text: 'Meow Meow' },
                        { value: 6, text: 'Meow' },

                    ];

                    // Set a default values in list
                    var select = $('[data-access_multi_select="true"]').check_multi_select({
                        multi_select: true,
                        items: items,
                        defaults: [],
                        rtl: false
                    });

                    // Display the selected Values
                    $('#display_selected').click(function () {
                        alert(select.check_multi_select('fetch_country'))
                    });
                });
            </script>
        </div>
    </div>



</body>

</html>
</head>

<body>




</body>

</html>
