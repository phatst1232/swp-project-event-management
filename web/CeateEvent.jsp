<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  </script>
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://cdn.tiny.cloud/1/8my3f4oobwgch3da52qojo7g9oko7704n1bu135edm12xo20/tinymce/5/tinymce.min.js"
    referrerpolicy="origin"></script>

  <script src="script.js" defer></script>
  <link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.0.0/flatly/bootstrap.min.css">
  <title>Create Event</title>
  <link rel="stylesheet" href="css/style.css">
</head>

<body>
  <div>
    <div class="left" id="left">
      <div class="createeventbox">
        <form id="createform">
          <span class="title">Enter paticipants</span> <input type="text" class="fields"
            placeholder="Enter estimated paticipants "><br>
          <span class="title">Enter Event Name</span> <input type="text" class="fields" placeholder="Event Name "><br>
          <span class="title">Categories</span>
          <div class="catecontainer">
            <div class="row">
              <div class="col-md-12">
              </div>
              <div class="col-md-12">
                <br>
                <input type="text" class="form-control" name="country" data-access_multi_select="true"
                  placeholder="Select categories">
                <br>
                <div class="text-center">
                  <!-- <button class="btn btn-success" id="display_selected">Show Selected Value</button> -->
                </div>
              </div>
            </div>
          </div>
          <span class="title">Enter Rooms</span> <input type="text" id="rooms" class="fields"
            placeholder="Event rooms"><br>
          <button onclick="showtimetable()" type="button" class="choosetimebtn">Choose time</button>
          <button type="button" onclick="showtextaria()" class="addcontent">Add content</button>


          <!-- input slot ẩn -->
          <div class="timetable">
            <table cellpadding="0" cellspacing="0" id="timepicking">
              <thead>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>
                <th class="day"></th>


              </thead>
              <tr>
                <th>Slot 1 <br> 7.00-8.30</th>
                <td class="timefield">20/10-slot1</td>
                <td class="timefield">21/10-slot1</td>
                <td class="timefield">22/10-slot1</td>
                <td class="timefield">23/10-slot1</td>
                <td class="timefield">24/10-slot1</td>
                <td class="timefield">25/10-slot1</td>
                <td class="timefield">26/10-slot1</td>

              </tr>
              <tr>
                <th>Slot 2 <br> 8.45-10.15</th>
                <td class="timefield">20/10-slot2</td>
                <td class="timefield">21/10-slot2</td>
                <td class="timefield">22/10-slot2</td>
                <td class="timefield">23/10-slot2</td>
                <td class="timefield">24/10-slot2</td>
                <td class="timefield">25/10-slot2</td>
                <td class="timefield">26/10-slot2</td>
              </tr>
              <tr>
                <th>Slot 3 <br> 10.30-12.00</th>
                <td class="timefield">20/10-slot3</td>
                <td class="timefield">21/10-slot3</td>
                <td class="timefield">22/10-slot3</td>
                <td class="timefield">23/10-slot3</td>
                <td class="timefield">24/10-slot3</td>
                <td class="timefield">25/10-slot3</td>
                <td class="timefield">26/10-slot3</td>
              </tr>
              <tr>
                <th>Slot 4 <br> 12.30-2.00</th>
                <td class="timefield">20/10-slot4</td>
                <td class="timefield">21/10-slot4</td>
                <td class="timefield">22/10-slot4</td>
                <td class="timefield">23/10-slot4</td>
                <td class="timefield">24/10-slot4</td>
                <td class="timefield">25/10-slot4</td>
                <td class="timefield">26/10-slot4</td>
              </tr>
              <tr>
                <th>Slot 5 <br> 2.15-3.45</th>
                <td class="timefield">20/10-slot5</td>
                <td class="timefield">21/10-slot5</td>
                <td class="timefield">22/10-slot5</td>
                <td class="timefield">23/10-slot5</td>
                <td class="timefield">24/10-slot5</td>
                <td class="timefield">25/10-slot5</td>
                <td class="timefield">26/10-slot5</td>
              </tr>
              <tr>
                <th>Slot 6 <br> 4.00-5.30</th>
                <td class="timefield">20/10-slot6</td>
                <td class="timefield">21/10-slot6</td>
                <td class="timefield">22/10-slot6</td>
                <td class="timefield">23/10-slot6</td>
                <td class="timefield">24/10-slot6</td>
                <td class="timefield">25/10-slot6</td>
                <td class="timefield">26/10-slot6</td>
              </tr>

            </table>
            <input type="text" id="timeline" style="display: none;">
            <button onclick="confirmdate()" type="button" class="confirmdatebtn">Confirm</button>
          </div>


          <input type="submit" value="Create Event">
          <input type="reset" class="reset" value="Reset">

          <!-- <button class="reset">Reset</button> -->
        </form>
      </div>
    </div>
    <!-- texteria -->
    <div  class="texteria default">
      <textarea>
      </textarea>
      <button type="button" onclick="showtextaria()"></button>
    </div>
    <script>
      tinymce.init({
        selector: 'textarea',

      });
      function showtextaria(){
        if($(".texteria").hasClass('default')){
          $(".texteria").removeClass('default')
          $(".texteria").addClass('texteriaactive')

        }else{
          $(".texteria").removeClass('texteriaactive')
          $(".texteria").addClass('default')
        }
      }
    </script>

    <!-- script datepick -->
    <script>
      $(function () {
        var isMouseDown = false,
          isHighlighted;
        $("#timepicking td")
          .mousedown(function () {
            isMouseDown = true;
            $(this).toggleClass("highlighted");
            isHighlighted = $(this).hasClass("highlighted");
            return false; // prevent text selection
          })
          .mouseover(function () {
            if (isMouseDown) {
              $(this).toggleClass("highlighted", isHighlighted);
            }
          })
          .bind("selectstart", function () {
            return false;
          })

        $(document)
          .mouseup(function () {
            isMouseDown = false;
          });
      });







      var myDate = new Date();
      myDate.setDate(myDate.getDate() + 1)
      var x = document.getElementsByClassName("day");
      // var y = document.getElementById("rooms").value=x[i].innerHTML + ",";
      var i;
      for (i = 1; i < x.length; i++) {
        x[i].innerHTML = myDate.getDate() + "/" + (myDate.getMonth() + 1);
        myDate.setDate(myDate.getDate() + 1)

      }



      // getvalue
      function confirmdate() {
        var timeline = "";
        var x = document.getElementsByClassName("highlighted");
        // var y = document.getElementById("rooms").value=x[i].innerHTML + ",";
        var i;
        for (i = 0; i < x.length; i++) {
          timeline = timeline + x[i].innerHTML + "|"
          // var y = document.getElementById("rooms").value.add=x[i].innerHTML + ",";
        }
        var y = document.getElementById("timeline").value = timeline;
        $(".timetable").removeClass('timeactive');
        $(".right").addClass('rightactive');
      }
      function showtimetable() {
        $(".timetable").addClass('timeactive');

      }

    </script>




  </div>
  <div class="right" id="right">
    <div class="tabs">
      <button data-tab-target="#contentnine">FLOOR 0</button>
      <button data-tab-target="#content16">FLOOR 1-6</button>

    </div>
    <div class="addroombtn"><button onclick="myFunction()" class="addroombtn">Add rooms</button></div>


    <div class="tab-content">
      <div id="content16" data-tab-content>
        <table class="tg">
          <thead>
            <tr>
              <th class="tg-0lax"><button class="tblbtn default">137</th>
              <th class="tg-baqh"><button class="tblbtn default">136</th>
              <th class="tg-0lax"><button class="tblbtn default">134</th>
              <th class="tg-0lax"><button class="tblbtn default">133</th>
              <th class="tg-0lax"><button class="tblbtn default">132</th>
              <th class="tg-0lax"><button class="tblbtn default">131</th>
              <th class="tg-0lax"><button class="tblbtn default">130</th>
              <th class="tg-0x09">stairs</th>
              <th class="tg-0lax"><button class="tblbtn default">127</th>
              <th class="tg-0lax"><button class="tblbtn default">126</th>
              <th class="tg-0lax"><button class="tblbtn default">125</th>
              <th class="tg-0lax"><button class="tblbtn default">124</th>
              <th class="tg-0lax"><button class="tblbtn default">123</th>
              <th class="tg-0lax"><button class="tblbtn default">122</th>
              <th class="tg-0x09">stair</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="tg-0x09">wc</td>
              <td class="tg-2nhx">stairs</td>
              <td class="tg-0lax"><button class="tblbtn default">234</td>
              <td class="tg-0lax"><button class="tblbtn default">233</td>
              <td class="tg-0lax"><button class="tblbtn default">232</td>
              <td class="tg-0lax"><button class="tblbtn default">231</td>
              <td class="tg-0lax"><button class="tblbtn default">230</td>
              <td class="tg-0x09">strairs</td>
              <td class="tg-0lax"><button class="tblbtn default">227</td>
              <td class="tg-0lax"><button class="tblbtn default">226</td>
              <td class="tg-0lax"><button class="tblbtn default">225</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09">stairs</td>
              <td class="tg-0x09">wc</td>
              <td class="tg-0lax"><button class="tblbtn default">121</td>
            </tr>
            <tr>
              <td class="tg-0x09" colspan="2" rowspan="6">LIBRARY</td>
              <td class="tg-844l"><button class="tblbtn default">L</td>
              <td class="tg-844l"><button class="tblbtn default">I</td>
              <td class="tg-844l"><button class="tblbtn default">T</td>
              <td class="tg-844l"><button class="tblbtn default">T</td>
              <td class="tg-844l"><button class="tblbtn default">L</td>
              <td class="tg-844l"><button class="tblbtn default">E</td>
              <td class="tg-844l"><button class="tblbtn default">-</td>
              <td class="tg-844l"><button class="tblbtn default">U</td>
              <td class="tg-844l"><button class="tblbtn default">K</td>
              <td class="tg-0x09"></td>
              <td class="tg-0lax"><button class="tblbtn default">315</td>
              <td class="tg-0lax"><button class="tblbtn default">224</td>
              <td class="tg-0lax"><button class="tblbtn default">120</td>
            </tr>
            <tr>
              <td class="tg-844l"><button class="tblbtn default">I</td>
              <td class="tg-4aw5"><button class="tblbtn default">HALL B</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-6t6o"><button class="tblbtn default">HALL A</td>
              <td class="tg-0x09">425<br>SW WS</td>
              <td class="tg-0x09">tea break</td>
              <td class="tg-0x09"></td>
              <td class="tg-0lax"><button class="tblbtn default">422</td>
              <td class="tg-0lax"><button class="tblbtn default">314</td>
              <td class="tg-0lax"><button class="tblbtn default">223</td>
              <td class="tg-0lax"><button class="tblbtn default">119</td>
            </tr>
            <tr>
              <td class="tg-844l"><button class="tblbtn default">T</td>
              <td class="tg-0lax"><button class="tblbtn default">404</td>
              <td class="tg-99c3">HALL B</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-99c3">HALL A</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0lax"><button class="tblbtn default">421</td>
              <td class="tg-0lax"><button class="tblbtn default">313</td>
              <td class="tg-0lax"><button class="tblbtn default">222</td>
              <td class="tg-0lax"><button class="tblbtn default">118</td>
            </tr>
            <tr>
              <td class="tg-844l"><button class="tblbtn default">T</td>
              <td class="tg-0lax"><button class="tblbtn default">406</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
              <td class="tg-0lax"><button class="tblbtn default">420</td>
              <td class="tg-0lax"><button class="tblbtn default">312</td>
              <td class="tg-0lax"><button class="tblbtn default">221</td>
              <td class="tg-0lax"><button class="tblbtn default">117</td>
            </tr>
            <tr>
              <td class="tg-844l"><button class="tblbtn default">L</td>
              <td class="tg-0lax"><button class="tblbtn default">407</td>
              <td class="tg-0lax"><button class="tblbtn default">408</td>
              <td class="tg-0lax"><button class="tblbtn default">409</td>
              <td class="tg-0lax"><button class="tblbtn default">410</td>
              <td class="tg-0x09">stairs</td>
              <td class="tg-0lax"><button class="tblbtn default">412</td>
              <td class="tg-0lax"><button class="tblbtn default">413</td>
              <td class="tg-99c3">HALL C</td>
              <td class="tg-0lax"><button class="tblbtn default">419</td>
              <td class="tg-0lax"><button class="tblbtn default">311</td>
              <td class="tg-0lax"><button class="tblbtn default">220</td>
              <td class="tg-0lax"><button class="tblbtn default">116</td>
            </tr>
            <tr>
              <td class="tg-844l"><button class="tblbtn default">E</td>
              <td class="tg-844l"><button class="tblbtn default">UK</td>
              <td class="tg-0lax"><button class="tblbtn default">301</td>
              <td class="tg-0lax"><button class="tblbtn default">302</td>
              <td class="tg-0lax"><button class="tblbtn default">303</td>
              <td class="tg-0lax"><button class="tblbtn default">304</td>
              <td class="tg-0lax"><button class="tblbtn default">305</td>
              <td class="tg-0lax"><button class="tblbtn default">306</td>
              <td class="tg-0lax"><button class="tblbtn default">307</td>
              <td class="tg-99c3"><button class="tblbtn default">HALL C</td>
              <td class="tg-0lax"><button class="tblbtn default">310</td>
              <td class="tg-0lax"><button class="tblbtn default">219</td>
              <td class="tg-0lax"><button class="tblbtn default">115</td>
            </tr>
            <tr>
              <td class="tg-0x09"></td>
              <td class="tg-2nhx">201<br>GD WS</td>
              <td class="tg-0lax"><button class="tblbtn default">202</td>
              <td class="tg-0lax"><button class="tblbtn default">203</td>
              <td class="tg-0lax"><button class="tblbtn default">204</td>
              <td class="tg-0lax"><button class="tblbtn default">205</td>
              <td class="tg-0lax"><button class="tblbtn default">206</td>
              <td class="tg-0lax"><button class="tblbtn default">207</td>
              <td class="tg-0lax"><button class="tblbtn default">208</td>
              <td class="tg-0lax"><button class="tblbtn default">209</td>
              <td class="tg-0lax"><button class="tblbtn default">211</td>
              <td class="tg-0lax"><button class="tblbtn default">212</td>
              <td class="tg-0lax"><button class="tblbtn default">213</td>
              <td class="tg-0x09"></td>
              <td class="tg-0x09"></td>
            </tr>
            <tr>
              <td class="tg-0x09">tea break</td>
              <td class="tg-2nhx">IT SP</td>
              <td class="tg-0lax"><button class="tblbtn default">104</td>
              <td class="tg-0lax"><button class="tblbtn default">105</td>
              <td class="tg-0lax"><button class="tblbtn default">106</td>
              <td class="tg-0x09">stairs</td>
              <td class="tg-0lax"><button class="tblbtn default">108</td>
              <td class="tg-0lax"><button class="tblbtn default">109</td>
              <td class="tg-0lax"><button class="tblbtn default">110</td>
              <td class="tg-0lax"><button class="tblbtn default">111</td>
              <td class="tg-0lax"><button class="tblbtn default">112</td>
              <td class="tg-0x09" colspan="4"></td>
            </tr>
          </tbody>
        </table>

      </div>

      <div id="contentnine" data-tab-content>
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
              <th class="tg-nb2d"><button class="tblbtn default">041</button></th>
              <th class="tg-0pky"><button class="tblbtn default">040</button></th>
              <th class="tg-0pky"><button class="tblbtn default">039</button></th>
              <th class="tg-266k">stair</th>
              <th class="tg-0pky"><button class="tblbtn default">037</button></th>
              <th class="tg-0pky"><button class="tblbtn default">036</button></th>
              <th class="tg-0pky"><button class="tblbtn default">035</button></th>
              <th class="tg-0pky"><button class="tblbtn default">034</button></th>
              <th class="tg-0pky"><button class="tblbtn default">033</button></th>
              <th class="tg-9u2q">door 2</th>
              <th class="tg-0pky"><button class="tblbtn default">029</button></th>
              <th class="tg-0pky"><button class="tblbtn default">028</button></th>
              <th class="tg-9u2q">door 1</th>
              <th class="tg-9u2q">711</th>
              <th class="tg-9u2q">stair</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td class="tg-c3ow"><button class="tblbtn default">042</button></td>
              <td class="tg-266k" colspan="13"></td>
              <td class="tg-9u2q">seats</td>
            </tr>
            <tr>
              <td class="tg-9u2q"></td>
              <td class="tg-266k" rowspan="7"></td>
              <td class="tg-8sb3 pick" colspan="5" rowspan="7">Lotus pond</td>
              <td class="tg-bwtg" colspan="6" rowspan="7"><button class="tblbtn default">Yard</button><br></td>
              <td class="tg-266k" rowspan="7"></td>
              <td class="tg-c3ow"><button class="tblbtn default">025</button></td>
            </tr>
            <tr>
              <td class="tg-c3ow"><button class="tblbtn default">044</button></td>
              <td class="tg-c3ow"><button class="tblbtn default">024</button></td>
            </tr>
            <tr>
              <td class="tg-c3ow"><button class="tblbtn default">045</button></td>
              <td class="tg-c3ow"><button class="tblbtn default">023</button></td>
            </tr>
            <tr>
              <td class="tg-9u2q">LB2</td>
              <td class="tg-c3ow"><button class="tblbtn default">022</button></td>
            </tr>
            <tr>
              <td class="tg-9u2q"></td>
              <td class="tg-c3ow"><button class="tblbtn default">021</button></td>
            </tr>
            <tr>
              <td class="tg-9u2q"></td>
              <td class="tg-c3ow"><button class="tblbtn default">020</button></td>
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
              <td class="tg-c3ow"><button class="tblbtn default"> 001</button> </button></td>
              <td class="tg-0pky"><button class="tblbtn default">004</button></td>
              <td class="tg-0pky"><button class="tblbtn default">005</button></td>
              <td class="tg-0pky"><button class="tblbtn default">006</button></td>
              <td class="tg-0pky"><button class="tblbtn default">007</button></td>
              <td class="tg-0pky"><button class="tblbtn default">008</button></td>
              <td class="tg-266k">stair</td>
              <td class="tg-0pky"><button class="tblbtn default">010</button></td>
              <td class="tg-0pky"><button class="tblbtn default">011</button></td>
              <td class="tg-0pky"><button class="tblbtn default">012</button></td>
              <td class="tg-0pky"><button class="tblbtn default">013</button></td>
              <td class="tg-0pky"><button class="tblbtn default">014</button></td>
              <td class="tg-0pky"><button class="tblbtn default">015</button></td>
              <td class="tg-ho3n" colspan="2" rowspan="2"><button class="tblbtn default">Lobby</button></td>
            </tr>
            <tr>
              <td class="tg-p8sp" colspan="4"> <button class="tblbtn default">Main stairs 3</button></td>
              <td class="tg-p8sp" colspan="5"><button class="tblbtn default">Main stairs 2</button></td>
              <td class="tg-p8sp" colspan="4"><button class="tblbtn default">Main stairs 1</button></td>
            </tr>
          </tbody>
        </table>

      </div>
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
        }
      </script>


      <!-- js của cate -->
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

  <div class="top">
    <div id="Logo">
      <img src="\image\244351476_224631916395247_2148764225629497919_n.png" height="120px" width="140px">
    </div>

    <div id="searchbar">
      <form>
        <input type="text" name="search" value="" placeholder="Search..." />
        <button type="submit"><img src="\image\search.png" width="20px" height="20px" />
        </button>
      </form>
    </div>

    <div id="category">
      <button id="categorybtn">
        <img src="\image\icons8-user-24.png">
      </button>
      <div id="category-content">
        <a href="/Login User Page/AdminPage.html">Home</a>
        <a href="/List page/ListEvent.html">Event</a>
        <a href="/Mainpage/Eventmanagement.html">Sign Out</a>
        <a href="">Edit Profile</a>

      </div>
    </div>
  </div>


</body>

</html>