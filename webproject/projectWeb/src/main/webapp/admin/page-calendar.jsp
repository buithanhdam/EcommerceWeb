<%@ page import="vn.edu.hcmuaf.fit.bean.TourDetail" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
  <title>Danh sách nhân viên | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">

</head>

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <%@include file="header.jsp"%>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <jsp:include page="leftSideBar.jsp">
    <jsp:param name="isCurrent" value="calendarTable"/>
  </jsp:include>

  <% List<TourDetail> listTour = (List<TourDetail>) request.getAttribute("listTour");%>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Lịch công tác</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="tile">
          <div class="tile-body">
          <div class="row">
            <div class="col-md-3">
              <div id="external-events">
                <h4 class="mb-4">Sự kiện</h4>
                <div class="fc-event"><b>Họp công ty</b></div>
<%--                <div class="fc-event"><b>Họp báo</b></div>--%>
<%--                <div class="fc-event"><b>Mừng sinh nhật</b></div>--%>
                <div class="fc-event"><b>Nghĩ lễ</b></div>
<%--                <div class="fc-event"><b>Đi công tác</b></div>--%>
                <div class="fc-event"><b>Gặp khách hàng</b></div>
                <div class="fc-event"><b>Tổ chức du lịch</b></div>
<%--                <p class="animated-checkbox mt-20">--%>
<%--                  <label>--%>
<%--                    <input id="drop-remove" type="checkbox"><span class="label-text">Hủy bỏ sau khi thả</span>--%>
<%--                  </label>--%>
<%--                </p>--%>
              </div>
            </div>
            <div class="col-md-9">
<%--              <div id="calendar"></div>--%>
                <div class="tile">
                  <div>
                    <h3 class="tile-title">Lịch công tác</h3>
                  </div>
                  <div class="tile-body">
                    <table class="table table-hover table-bordered" id="sampleTable">
                      <thead>
                      <tr>
                        <th>ID tour</th>
                        <th>Tên tour</th>
                        <th>Ngày khởi hành</th>
                        <th>Ngày kết thúc</th>
                        <th>Nơi khởi hành</th>
                        <th>Phương tiện di chuyển</th>
                        <th></th>
                      </tr>
                      </thead>
                      <tbody>
                  <%
                    for (TourDetail tour:
                         listTour) {
                      String[] st = tour.getNgayKhoiHanh().toString().split("-");
                      String ngayKhoiHanhString = st[2]+" tháng "+st[1]+" năm "+st[0];

                      String[] stt = tour.getNgayKetThuc().toString().split("-");
                      String ngayKTString = stt[2]+" tháng "+stt[1]+" năm "+stt[0];
                    %>
                      <tr>
                        <td><%=tour.getTOUR_ID()%></td>
                        <td><%=tour.getTourName()%></td>
                        <td><%=ngayKhoiHanhString%></td>
                        <td><%=ngayKTString%></td>
                        <td><%=tour.getNoiKhoiHanh()%>đ</td>
                        <td><%=tour.getPhuongTienDiChuyen()%></td>
                        <td>
                          <a href="/projectWeb_war/admin/CalendarDetail?tourId=<%=tour.getTOUR_ID()%>"><span style="color: #5454f3;font-size: 1rem">Xem chi tiết</span></a>
                        </td>
                      </tr>

                  <%}%>


                      </tbody>
                    </table>
                  </div>
                </div>
            </div>
          </div>
        </div>
      </div>
      </div>
    </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="js/plugins/moment.min.js"></script>
    <script type="text/javascript" src="js/plugins/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="js/plugins/fullcalendar.min.js"></script>
    <script type="text/javascript">
      $(document).ready(function() {
      
      	$('#external-events .fc-event').each(function() {
      
      		// store data so the calendar knows to render an event upon drop
      		$(this).data('event', {
      			title: $.trim($(this).text()), // use the element's text as the event title
      			stick: true // maintain when user navigates (see docs on the renderEvent method)
      		});
      
      		// make the event draggable using jQuery UI
      		$(this).draggable({
      			zIndex: 999,
      			revert: true,      // will cause the event to go back to its
      			revertDuration: 0  //  original position after the drag
      		});
      
      	});
      
      	$('#calendar').fullCalendar({
      		header: {
      			left: 'prev,next today',
      			center: 'title',
      			right: 'month,agendaWeek,agendaDay'
      		},
      		editable: true,
      		droppable: true, // this allows things to be dropped onto the calendar
      		drop: function() {
      			// is the "remove after drop" checkbox checked?
      			if ($('#drop-remove').is(':checked')) {
      				// if so, remove the element from the "Draggable Events" list
      				$(this).remove();
      			}
      		}
      	});
      
      
      });
    </script>
    <script type="text/javascript">
      //Thời Gian
      function time() {
        var today = new Date();
        var weekday = new Array(7);
        weekday[0] = "Chủ Nhật";
        weekday[1] = "Thứ Hai";
        weekday[2] = "Thứ Ba";
        weekday[3] = "Thứ Tư";
        weekday[4] = "Thứ Năm";
        weekday[5] = "Thứ Sáu";
        weekday[6] = "Thứ Bảy";
        var day = weekday[today.getDay()];
        var dd = today.getDate();
        var mm = today.getMonth() + 1;
        var yyyy = today.getFullYear();
        var h = today.getHours();
        var m = today.getMinutes();
        var s = today.getSeconds();
        m = checkTime(m);
        s = checkTime(s);
        nowTime = h + " giờ " + m + " phút " + s + " giây";
        if (dd < 10) {
          dd = '0' + dd
        }
        if (mm < 10) {
          mm = '0' + mm
        }
        today = day + ', ' + dd + '/' + mm + '/' + yyyy;
        tmp = '<span class="date"> ' + today + ' - ' + nowTime +
          '</span>';
        document.getElementById("clock").innerHTML = tmp;
        clocktime = setTimeout("time()", "1000", "Javascript");
  
        function checkTime(i) {
          if (i < 10) {
            i = "0" + i;
          }
          return i;
        }
      }
    </script>
  </body>
</html>