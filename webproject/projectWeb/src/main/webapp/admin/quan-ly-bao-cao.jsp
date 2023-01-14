<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
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
      <jsp:param name="isCurrent" value="reportTable"/>
  </jsp:include>

  <%
      List<User> listGuide = request.getAttribute("listGuide")==null?null:(List<User>) request.getAttribute("listGuide");
      List<Tour> listAllTour = request.getAttribute("listAllTour")==null?null:(List<Tour>) request.getAttribute("listAllTour");
      List<Booking> listBooking = request.getAttribute("listBooking")==null?null:(List<Booking>) request.getAttribute("listBooking");
      List<Tour> listTour = request.getAttribute("listTour")==null?null:(List<Tour>) request.getAttribute("listTour");
      List<User> listKhachHang = request.getAttribute("listKhachHang")==null?null:(List<User>) request.getAttribute("listKhachHang");
      List<Tour> listPopularTour = request.getAttribute("listPopularTour")==null?null:(List<Tour>) request.getAttribute("listPopularTour");
      List<Tour> listSoldOutTour = request.getAttribute("listSoldOutTour")==null?null:(List<Tour>) request.getAttribute("listSoldOutTour");
      List<Tour> listNewTour = request.getAttribute("listNewTour")==null?null:(List<Tour>) request.getAttribute("listNewTour");
      String error = request.getAttribute("error") ==null?null:(String) request.getAttribute("error");

      List<Booking> cancelBookings = new ArrayList<>();
      for (Booking b:
           listBooking) {
          if (b.getTRANGTHAI()==-1){
              cancelBookings.add(b);
          }
      }
  %>

  <main class="app-content">
      <div class="row">
          <div class="col-md-12">
              <div class="app-title">
                  <ul class="app-breadcrumb breadcrumb">
                      <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu    </b></a></li>
                  </ul>
                  <div id="clock"></div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-6 col-lg-3">
              <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
                  <div class="info">
                      <h4>Tổng Hướng dẫn viên</h4>
                      <p><b><%=listGuide.size()%> Hướng dẫn viên</b></p>
                  </div>
              </div>
          </div>
          <div class="col-md-6 col-lg-3">
              <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
                  <div class="info">
                      <h4>Tổng Tour du lịch</h4>
                      <p><b><%=listAllTour.size()+50%> Tour du lịch</b></p>
                  </div>
              </div>
          </div>
          <div class="col-md-6 col-lg-3">
              <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
                  <div class="info">
                      <h4>Tổng đơn đặt hàng</h4>
                      <p><b><%=listBooking.size()%> đơn đặt hàng</b></p>
                  </div>
              </div>
          </div>
          <div class="col-md-6 col-lg-3">
              <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
                  <div class="info">
                      <h4>Tour du lịch mới</h4>
                      <p><b><%=listNewTour.size()%> Tour du lịch</b></p>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <!-- <div class="col-md-6 col-lg-3">
              <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart' ></i>
                  <div class="info">
                      <h4>Tổng thu nhập</h4>
                      <p><b>104.890.000 đ</b></p>
                  </div>
              </div>
          </div> -->
          <div class="col-md-6 col-lg-3">
              <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
                  <div class="info">
                      <h4>Tổng khách hàng</h4>
                      <p><b><%=listKhachHang.size()%> khách hàng</b></p>
                  </div>
              </div>
          </div>
          <div class="col-md-6 col-lg-3">
              <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x' ></i>
                  <div class="info">
                      <h4>Hết vé Tour</h4>
                      <p><b><%=listSoldOutTour.size()%> Tour</b></p>
                  </div>
              </div>
          </div>
          <div class="col-md-6 col-lg-3">
              <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt' ></i>
                  <div class="info">
                      <h4>Đơn hàng hủy</h4>
                      <p><b><%=cancelBookings.size()%> đơn hàng</b></p>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-12">
              <div class="tile">
                  <div>
                      <h3 class="tile-title">TOUR BÁN CHẠY</h3>
                  </div>
                  <div class="tile-body">
                      <table class="table table-hover table-bordered" id="sampleTable">
                          <thead>
                          <tr>
                              <th>Mã Tour</th>
                              <th>Tên Tour</th>
                              <th>Giá tiền</th>
                              <th>Hạng mục</th>
                          </tr>
                          </thead>
                          <tbody>
                          <%
                              for (int i = 0; i < listPopularTour.size(); i++) {
                                  float tongTien =listPopularTour.get(i).getGiaVe();
                                  Locale locale = new Locale("vi");
                                  NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                  String tongTienString = format.format(tongTien).split(",")[0];
                          %>
                          <tr>
                              <td><%=listPopularTour.get(i).getTour_id()%></td>
                              <td><%=listPopularTour.get(i).getTourName()%></td>
                              <td><%=tongTienString%>đ</td>
                              <td><%=listPopularTour.get(i).getTour_category()%></td>
                          </tr>
                          <%}%>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-12">
              <div class="tile">
                  <div>
                      <h3 class="tile-title">TỔNG ĐƠN ĐẶT HÀNG</h3>
                  </div>
                  <div class="tile-body">
                      <table class="table table-hover table-bordered" id="sampleTable">
                          <thead>
                          <tr>
                              <th>ID đơn hàng</th>
                              <th>ID Khách hàng</th>
                              <th>ID Tour</th>
                              <th>Số lượng vé</th>
                              <th>Tổng tiền</th>
                          </tr>
                          </thead>
                          <tbody>
                          <%float tongCong =0;

                              for(int i = 0; i < listBooking.size(); i++){
                                  tongCong += listBooking.get(i).getTongTien();
                                  float tongTien = listBooking.get(i).getTongTien();
                                  Locale locale = new Locale("vi");
                                  NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                  String tongTienString = format.format(tongTien).split(",")[0];
                          %>
                          <tr>
                              <td><%=listBooking.get(i).getBOOKING_ID()%></td>
                              <td><%=listBooking.get(i).getUSER_ID()%></td>
                              <td><%=listBooking.get(i).getTOUR_ID()%></td>
                              <td><%=listBooking.get(i).getSOLUONG()%></td>
                              <td><%=tongTienString%>đ</td>
                          </tr>
                          <%
                              }

                              Locale locale = new Locale("vi");
                              NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                              String tongCongString = format.format(tongCong).split(",")[0];
                          %>

                          <tr>
                              <th colspan="4">Tổng cộng:</th>
                              <td><%=tongCongString%>đ</td>
                          </tr>

                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-12">
              <div class="tile">
                  <div>
                      <h3 class="tile-title">TOUR ĐÃ HẾT VÉ</h3>
                  </div>
                  <div class="tile-body">
                      <table class="table table-hover table-bordered" id="sampleTable">
                          <thead>
                          <tr>
                              <th>Mã Tour</th>
                              <th>Tên Tour</th>
                              <th>Số lượng vé</th>
                              <th>Trạng thái</th>
                              <th>Giá tiền</th>
                              <th>Hạng mục</th>
                          </tr>
                          </thead>
                          <tbody>
                          <%
                              for(int i = 0; i < listSoldOutTour.size(); i++){
                                  float giaVe = listSoldOutTour.get(i).getGiaVe();
                                  Locale locale1 = new Locale("vi");
                                  NumberFormat format1 =  NumberFormat.getCurrencyInstance(locale1);
                                  String giaVeString = format1.format(giaVe).split(",")[0];

                          %>
                          <tr>
                              <td><%=listSoldOutTour.get(i).getTour_id()%></td>
                              <td><%=listSoldOutTour.get(i).getTourName()%></td>
                              <td><%=listSoldOutTour.get(i).getSoLuong()%></td>
                              <td><span class="badge bg-danger"><%=listSoldOutTour.get(i).getTrangThai()==0?"":"Hết vé"%></span></td>
                              <td><%=giaVeString%>đ</td>
                              <td><%=listSoldOutTour.get(i).getTour_category()%></td>
                          </tr>
                          <%
                              }
                          %>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-md-12">
              <div class="tile">
                  <div>
                      <h3 class="tile-title">TOUR MỚI</h3>
                  </div>
                  <div class="tile-body">
                      <table class="table table-hover table-bordered" id="sampleTable">
                          <thead>
                          <tr>
                              <th>Mã Tour</th>
                              <th>Tên Tour</th>
                              <th>Số lượng vé</th>
                              <th>Trạng thái</th>
                              <th>Giá tiền</th>
                              <th>Hạng mục</th>
                          </tr>
                          </thead>
                          <tbody>
                          <%
                              for(int i = 0; i < listNewTour.size(); i++){
                                  float giaVe = listNewTour.get(i).getGiaVe();
                                  Locale locale1 = new Locale("vi");
                                  NumberFormat format1 =  NumberFormat.getCurrencyInstance(locale1);
                                  String giaVeString = format1.format(giaVe).split(",")[0];

                          %>
                          <tr>
                              <td><%=listNewTour.get(i).getTour_id()%></td>
                              <td><%=listNewTour.get(i).getTourName()%></td>
                              <td><%=listNewTour.get(i).getSoLuong()%></td>
                              <td><span class="badge bg-success"><%=listNewTour.get(i).getTrangThai()==1?"Đang bán":listNewTour.get(i).getTrangThai()==0?"Tạm hết bán":"Sắp bán"%></span></td>
                              <td><%=giaVeString%>đ</td>
                              <td><%=listNewTour.get(i).getTour_category()%></td>
                          </tr>
                          <%
                              }
                          %>
                          </tbody>
                      </table>
                  </div>
              </div>
          </div>
      </div>

      <div class="row">
          <div class="col-md-6">
              <div class="tile">
                  <h3 class="tile-title">DỮ LIỆU HÀNG THÁNG</h3>
                  <div class="embed-responsive embed-responsive-16by9">
                      <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                  </div>
              </div>
          </div>
          <div class="col-md-6">
              <div class="tile">
                  <h3 class="tile-title">THỐNG KÊ DOANH SỐ</h3>
                  <div class="embed-responsive embed-responsive-16by9">
                      <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                  </div>
              </div>
          </div>
      </div>

      <div class="text-right" style="font-size: 12px">
          <p><b></b></p>
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
    <script type="text/javascript" src="js/plugins/chart.js"></script>
    <script type="text/javascript">
    var data = {
      labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
      datasets: [{
          label: "Dữ liệu đầu tiên",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "black",
          pointColor: "rgb(220, 64, 59)",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81]
        },
        {
          label: "Dữ liệu kế tiếp",
          fillColor: "rgba(255, 255, 255, 0.158)",
          strokeColor: "rgb(220, 64, 59)",
          pointColor: "black",
          pointStrokeColor: "#fff",
          pointHighlightFill: "#fff",
          pointHighlightStroke: "green",
          data: [48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90]
        }
      ]
    };


        var ctxl = $("#lineChartDemo").get(0).getContext("2d");
        var lineChart = new Chart(ctxl).Line(data);

        var ctxb = $("#barChartDemo").get(0).getContext("2d");
        var barChart = new Chart(ctxb).Bar(data);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
        if (document.location.hostname == 'pratikborsadiya.in') {
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                    m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
            ga('create', 'UA-72504830-1', 'auto');
            ga('send', 'pageview');
        }
    </script>
</body>

</html>