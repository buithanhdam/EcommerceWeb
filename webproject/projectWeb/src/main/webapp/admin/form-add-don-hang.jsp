<%@ page import="vn.edu.hcmuaf.fit.bean.Tour" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Booking" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <title>Danh sách đơn hàng | Quản trị Admin</title>
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
    <jsp:param name="isCurrent" value="orderTable"/>
  </jsp:include>

  <%
    List<Tour> listTour = (List<Tour>) request.getAttribute("listTour");
    List<User> listKH = (List<User>) request.getAttribute("listKH");
    Booking booking = request.getAttribute("booking")==null?null:(Booking) request.getAttribute("booking");
    String error = request.getAttribute("error") ==null?null:(String) request.getAttribute("error");
  %>
    <main class="app-content">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item">Danh sách đơn đặt tour</li>
          <li class="breadcrumb-item"><a href="#"><%=booking==null?"Thêm đơn hàng":"Sửa đơn hàng"%></a></li>
        </ul>
      </div>

      <div class="row">
        <div class="col-md-12">
          <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
          <div class="tile">

            <h3 class="tile-title"><%=booking==null?"Tạo mới đơn hàng":"Sửa đơn hàng"%></h3>
            <form  method="post" action="/projectWeb_war/admin/CRUDBookingTableData">
              <div class="tile-body">
                <div class="row">
                <div class="form-group  col-md-4"  style="display: <%=booking==null?"none":"block"%>">
                  <label class="control-label">ID đơn hàng ( Nếu không nhập sẽ tự động phát sinh )</label>
                  <input class="form-control" type="text" style="display: none" name="bookingId" value="<%=booking==null?"":booking.getBOOKING_ID()%>">

                  <input class="form-control" type="text" disabled value="<%=booking==null?"":booking.getBOOKING_ID()%>">
                </div>
                <div class="form-group  col-md-4">
                  <label for="khID" class="control-label">Khách hàng ID</label>
                  <select class="form-control" id="khID" name="bookingUserId" >
                    <option value="0">Không có</option>
                    <%
                      for (User u: listKH) {
                        if (booking!=null&&booking.getUSER_ID().equals(u.getUser_Id()))
                        {
                    %>
                    <option value="<%=u.getUser_Id()%>" selected><%=u.getUser_Id()%>-<%=u.getFullName()%></option>
                    <%}else{%>
                    <option value="<%=u.getUser_Id()%>" ><%=u.getUser_Id()%>-<%=u.getFullName()%></option>
                    <%}%>
                    <%}%>
                  </select>

                </div>
              <div class="form-group  col-md-4">

                <label for="" class="control-label">Tour ID</label>
                <select class="form-control" id="" name="bookingTourId" required>
                  <%
                    for (Tour tour:
                         listTour) {
                      if (booking!=null&&booking.getTOUR_ID().equals(tour.getTour_id()))
                      {
                    %>
                      <option value="<%=tour.getTour_id()%>" selected><%=tour.getTour_id()%>-<%=tour.getTourName()%></option>
                  <%}else{%>
                  <option value="<%=tour.getTour_id()%>" ><%=tour.getTour_id()%>-<%=tour.getTourName()%></option>
                  <%}%>
                  <%}%>
                </select>
              </div>
              <%Date currentDate = Date.valueOf(LocalDate.now());%>
                <div class="form-group  col-md-4" style="display: <%=booking==null?"none":"block"%>">
                  <label class="control-label">Ngày làm đơn hàng</label>
                  <input class="form-control" type="date" name="bookingDate" value="<%=booking==null?currentDate.toString():booking.getNgayTao()==null?currentDate.toString():booking.getNgayTao().toString()%>" required >
                </div>


              <div class="form-group  col-md-4">
                <label class="control-label">Họ tên</label>
                <input class="form-control" type="text" name="bookingHoTen" value="<%=booking==null?"":booking.getHoTen()==null?"":booking.getHoTen()%>" required>
              </div>

              <div class="form-group  col-md-4">
                <label class="control-label">Email</label>
                <input class="form-control" type="email" name="bookingEmail" value="<%=booking==null?"":booking.getEmail()==null?"":booking.getEmail()%>" required>
              </div>
              <div class="form-group  col-md-4">
                <label class="control-label">Số điện thoại</label>
                <input class="form-control" type="text" name="bookingPhone" value="<%=booking==null?"":booking.getPhone()==null?"":booking.getPhone()%>" required>
              </div>
              <div class="form-group  col-md-4">
                <label class="control-label">Địa chỉ</label>
                <input class="form-control" type="text" name="bookingDiaChi" value="<%=booking==null?"":booking.getDiaChi()==null?"":booking.getDiaChi()%>" required>
              </div>

              <div class="form-group  col-md-4">
                <label class="control-label">Số lượng vé người lớn</label>
                <input class="form-control" type="number" name="bookingSLVNL" value="<%=booking==null?"":booking.getSOLUONG_VENGUOILON()%>" required>
              </div>

                <div class="form-group  col-md-4">
                  <label class="control-label">Số lượng vé trẻ em</label>
                  <input class="form-control" type="number" name="bookingSLVTE" value="<%=booking==null?"":booking.getSOLUONG_VETREEM()%>" required>
                </div>

                <div class="form-group col-md-4">
                  <label for="exampleSelect1" class="control-label">Tình trạng</label>
                  <select class="form-control" id="exampleSelect1" name="bookingTrangThai" required>
                   <% if (booking!=null&&booking.getTRANGTHAI()==0){%> <option value="0" selected>Đang chờ</option><%}else {%><option value="0" >Đang chờ</option><%}%>
                    <% if (booking!=null&&booking.getTRANGTHAI()==1){%>  <option value="1" selected>Đã Hoàn thành</option><%}else {%><option value="1" >Đã Hoàn thành</option><%}%>
                    <% if (booking!=null&&booking.getTRANGTHAI()==-1){%>  <option value="-1" selected>Đã hủy</option><%}else{%> <option value="-1">Đã hủy</option> <%}%>

                  </select>
                </div>
                <div class="form-group  col-md-4">
                  <label class="control-label">Ghi chú đơn hàng</label>
                  <textarea class="form-control" rows="4" name="bookingDescription" ><%=booking==null?"":booking.getDescription()==null?"":booking.getDescription()%></textarea>
                </div>


                </div>
            </div>
              <button class="btn btn-save" type="submit">Lưu lại</button>
              <a class="btn btn-cancel" href="/projectWeb_war/admin/BookingTableData">Hủy bỏ</a>
            </form>
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
  </body>
</html>