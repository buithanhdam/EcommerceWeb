<%@ page import="vn.edu.hcmuaf.fit.bean.TourDetail" %>
<%@ page import="java.util.List" %>


<%@ page import="vn.edu.hcmuaf.fit.bean.Booking" %>

<%@ page import="vn.edu.hcmuaf.fit.bean.Tour" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

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
    <jsp:param name="isCurrent" value="indexTable"/>
  </jsp:include>

  <%
    List<TourDetail> listTD = (List<TourDetail>) request.getAttribute("listTD");
    List<User> listKH = (List<User>) request.getAttribute("listKH");
    List<User> listEmployee = (List<User>) request.getAttribute("listEmployee");
    List<Booking> listBM =  (List<Booking>) request.getAttribute("listBM");
    List<Tour> listT =  (List<Tour>) request.getAttribute("listT");
    List<Booking> listB =  (List<Booking>) request.getAttribute("listB");
String error = request.getAttribute("error")==null?null:(String)request.getAttribute("error");
    List<Booking> listUnSubmit = new ArrayList<Booking>();
    for (Booking b:
         listB) {
      if (b.getTRANGTHAI() ==0){
        listUnSubmit.add(b);
      }
    }
  %>
  <main class="app-content">
    <div class="row">
      <div class="col-md-12">
        <div class="app-title">
          <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#"><b>Bảng điều khiển</b></a></li>
          </ul>
          <div id="clock"></div>
        </div>
      </div>
    </div>
    <div class="row">
      <!--Left-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
       <!-- col-6 -->
       <div class="col-md-6">
        <div class="widget-small primary coloured-icon"><i class='icon bx bxs-user-account fa-3x'></i>
          <a class="info" href="/projectWeb_war/admin/CustomerDataTable">
            <h4>Tổng khách du lịch</h4>
            <p><b><%=listKH.size()%> khách du lịch</b></p>
            <p class="info-tong">Tổng số khách du lịch được quản lý.</p>
          </a>
        </div>
      </div>
       <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small info coloured-icon"><i class='icon bx bxs-data fa-3x'></i>
              <div class="info">
                <h4>Tổng Tour</h4>
                <p><b><%=listT.size()+50%> tour</b></p>
                <p class="info-tong">Tổng số Tour được quản lý.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small warning coloured-icon"><i class='icon bx bxs-shopping-bags fa-3x'></i>
              <div class="info">
                <h4>Tổng đơn đặt tour trong tháng</h4>
                <p><b><%=listBM.size()%> đơn đặt tour</b></p>
                <p class="info-tong">Tổng số hóa đơn đặt tour trong tháng.</p>
              </div>
            </div>
          </div>
           <!-- col-6 -->
          <div class="col-md-6">
            <div class="widget-small danger coloured-icon"><i class='icon bx bxs-error-alt fa-3x'></i>
              <div class="info">
                <h4>Sắp hết vé</h4>
                <p><b><%=listTD.size()%> Tour</b></p>
                <p class="info-tong">Số Tour cảnh báo hết cần nhập thêm.</p>
              </div>
            </div>
          </div>
           
            <!-- / col-12 -->
             <!-- col-12 -->
            <div class="col-md-12">
                <div class="tile">
                  <h3 class="tile-title">Nhân viên quản trị</h3>
                <div>
                  <table class="table table-hover">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Họ tên</th>
                        <th>Ngày sinh</th>
                        <th>Quyền hiện tại</th>
                        <th>Phân quyền</th>
                      </tr>
                    </thead>
                    <tbody>
<%
  for (User em:
       listEmployee) {

  %>
                      <tr>
                        <td><%=em.getUser_Id()%></td>
                        <td><%=em.getFullName()==null?"Chưa có":em.getFullName()%></td>
                        <td><%=em.getBirth()==null?"Chưa có":em.getBirth().toString()%></td>
                        <td><span class="badge <%=em.getUser_role()==1?"bg-info":em.getUser_role()==2?"bg-success":"bg-danger"%>"><%=em.getUser_role()==1?"Hướng dẫn viên":em.getUser_role()==2?"Nhân viên quản trị":"Admin"%></span></td>
                        <td>
                          <form action="/projectWeb_war/admin/Authorization"  method="post">
                            <input style="display: none" name="userId" value="<%=em.getUser_Id()%>" type="text">
                            <input style="display: none" name="userRole" value="<%=em.getUser_role()%>" type="text">
                           <% if (em.getUser_role()==2){%> <button class="btn btn-primary btn-sm trash" name="option" value="levelDown" type="submit" title="Hạ quyền"
                            ><i class="fa fa-arrow-down" ></i>
                            </button>
                            <%}%>

                            <% if (em.getUser_role()==1){%>
                            <button class="btn btn-primary btn-sm " style="background-color: #e0ffd1; color: #44d53a" name="option" value="levelUp" type="submit" title="Nâng quyền"
                              ><i class="fa fa-arrow-up"></i>
                            </button>
                            <%}%>
                          </form>

                        </td>
                      </tr>
<%}%>
                    </tbody>
                  </table>
                </div>

              </div>
            </div>
             <!-- / col-12 -->
        </div>
      </div>
      <!--END left-->
      <!--Right-->
      <div class="col-md-12 col-lg-6">
        <div class="row">
          <div class="col-md-16">
            <div class="tile">
                <h3 class="tile-title">Đơn hàng đang chờ xác nhận</h3>
              <div>
                <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
                <table class="table table-bordered">
                  <thead>
                    <tr>
                      <th>ID Booking</th>
                      <th>Số lượng</th>
                      <th>Tổng tiền</th>
                      <th>Trạng thái</th>
                      <th>Xác nhận</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%
                    for (Booking b:
                         listUnSubmit) {
                      float giaVe= b.getTongTien();
                      Locale locale = new Locale("vi");
                      NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                      String giaVeString = format.format(giaVe).split(",")[0];
                    %>
                    <tr>
                      <td><%=b.getBOOKING_ID()%></td>
                      <td><%=b.getSOLUONG()%></td>
                      <td>
                        <%=giaVeString%> đ
                      </td>
                      <td><span class="badge bg-info">Chờ xác nhận</span></td>
                      <td>
                        <form action="/projectWeb_war/admin/BookingTableData" id="form" method="post">
                          <input style="display: none" name="bookingId" value="<%=b.getBOOKING_ID()%>">
                          <button class="btn btn-primary btn-sm save" name="option" value="submitIndex" type="submit" title="Xác nhận"
                          ><i class="fas fa-check"></i>
                          </button>
                        </form>

                    </td>
                    </tr>
                  <%}%>

                
                   
                  </tbody>
                </table>
              </div>
              <!-- / div trống-->
            </div>
           </div>

          <div class="col-md-16">
            <div class="tile">
              <h3 class="tile-title">Đơn hàng trong tháng</h3>
              <a href="/projectWeb_war/admin/BookingTableData"><span style="font-size: 0.6rem;color: blue">Xem tất cả đơn hàng</span></a>

              <div>
                <table class="table table-bordered">
                  <thead>
                  <tr>
                    <th>ID Booking</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Trạng thái</th>

                  </tr>
                  </thead>
                  <tbody>
                  <%
                    for (Booking b:
                            listBM) {
                      float giaVe= b.getTongTien();
                      Locale locale = new Locale("vi");
                      NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                      String giaVeString = format.format(giaVe).split(",")[0];
                  %>
                  <tr>
                    <td><%=b.getBOOKING_ID()%></td>
                    <td><%=b.getSOLUONG()%></td>
                    <td>
                      <%=giaVeString%> đ
                    </td>
                    <td><span class="badge <%=b.getTRANGTHAI()==-1?"bg-danger":b.getTRANGTHAI()==1?"bg-success":"bg-info"%>"><%=b.getTRANGTHAI()==-1?"Đã hủy":b.getTRANGTHAI()==1?"Đã hoàn thành":"Chờ xác nhận"%></span></td>

                  </tr>
                  <%}%>



                  </tbody>
                </table>
              </div>
              <!-- / div trống-->
            </div>
          </div>
        </div>

      </div>
      <!--END right-->

    </div>


    <div class="text-center" style="font-size: 13px">
      <p><b>Copyright
          <script type="text/javascript">
            document.write(new Date().getFullYear());
          </script> Trang quản lý Admin
        </b></p>
    </div>
  </main>
  <script src="js/jquery-3.2.1.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/popper.min.js"></script>
  <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
  <!--===============================================================================================-->
  <script src="js/bootstrap.min.js"></script>
  <!--===============================================================================================-->
  <script src="js/main.js"></script>
  <!--===============================================================================================-->
  <script src="js/plugins/pace.min.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript" src="js/plugins/chart.js"></script>
  <!--===============================================================================================-->
  <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6"],
      datasets: [{
        label: "Dữ liệu đầu tiên",
        fillColor: "rgba(255, 213, 59, 0.767), 212, 59)",
        strokeColor: "rgb(255, 212, 59)",
        pointColor: "rgb(255, 212, 59)",
        pointStrokeColor: "rgb(255, 212, 59)",
        pointHighlightFill: "rgb(255, 212, 59)",
        pointHighlightStroke: "rgb(255, 212, 59)",
        data: [20, 59, 90, 51, 56, 100]
      },
      {
        label: "Dữ liệu kế tiếp",
        fillColor: "rgba(9, 109, 239, 0.651)  ",
        pointColor: "rgb(9, 109, 239)",
        strokeColor: "rgb(9, 109, 239)",
        pointStrokeColor: "rgb(9, 109, 239)",
        pointHighlightFill: "rgb(9, 109, 239)",
        pointHighlightStroke: "rgb(9, 109, 239)",
        data: [48, 48, 49, 39, 86, 10]
      }
      ]
    };
    var ctxl = $("#lineChartDemo").get(0).getContext("2d");
    var lineChart = new Chart(ctxl).Line(data);

    var ctxb = $("#barChartDemo").get(0).getContext("2d");
    var barChart = new Chart(ctxb).Bar(data);
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