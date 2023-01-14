<%@ page import="vn.edu.hcmuaf.fit.bean.Booking" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

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
    List<Booking> bookingList  = request.getAttribute("bookingList")==null?null:(List<Booking>) request.getAttribute("bookingList");
    String error = request.getAttribute("error")==null?null:(String) request.getAttribute("error");
  %>
    <main class="app-content">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item active"><a href="#"><b>Danh sách đơn đặt tour</b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
          <div class="tile">
            <div class="tile-body">
              <div class="row element-button">
                <div class="col-sm-2">
  
                  <a class="btn btn-add btn-sm" href="/projectWeb_war/admin/CRUDBookingTableData" title="Thêm"><i class="fas fa-plus"></i>
                    Tạo mới đơn đặt Tour</a>
                </div>
               
<%--               --%>
<%--                <div class="col-sm-2">--%>
<%--                  <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i--%>
<%--                      class="fas fa-trash-alt"></i> Xóa tất cả </a>--%>
<%--                </div>--%>
            </div>
              <table class="table table-hover table-bordered" id="sampleTable">
                <thead>
                  <tr>
                    <th width="10"><input type="checkbox" id="all"></th>
                    <th>ID đơn hàng</th>
                    <th>ID Khách hàng</th>
                    <th>ID Tour</th>
                    <th>Số lượng vé người lớn</th>
                    <th>Số lượng vé trẻ em</th>
                    <th>Số lượng</th>
                    <th>Tổng tiền</th>
                    <th>Ngày lập</th>
                    <th>Trạng thái</th>
                    <th>Tính năng</th>
                  </tr>
                </thead>
                <tbody>
                <% for (int i = 0; i < bookingList.size(); i++) {
                  int j = i +1;
                  float giaVe= bookingList.get(i).getTongTien();
                  Locale locale = new Locale("vi");
                  NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                  String giaVeString = format.format(giaVe).split(",")[0];
                %>
                  <tr>
                    <td width="10"><input type="checkbox" name="check<%=j%>" value="<%=j%>"></td>
                    <td><%=bookingList.get(i).getBOOKING_ID()%></td>
                    <td><%=bookingList.get(i).getUSER_ID()%></td>
                    <td><%=bookingList.get(i).getTOUR_ID()%></td>
                    <td><%=bookingList.get(i).getSOLUONG_VENGUOILON()%></td>
                    <td><%=bookingList.get(i).getSOLUONG_VETREEM()%></td>
                    <td><%=bookingList.get(i).getSOLUONG()%></td>
                    <td><%=giaVeString%>đ</td>
                    <td><%=bookingList.get(i).getNgayTao()%></td>
                    <td><span class="badge <%=bookingList.get(i).getTRANGTHAI()==-1?"bg-danger":bookingList.get(i).getTRANGTHAI()==0?"bg-info":"bg-success"%>"><%=bookingList.get(i).getTRANGTHAI()==-1?"Đã hủy":bookingList.get(i).getTRANGTHAI()==0?"Chờ xác nhận":"Hoàn thành"%></span></td>
                    <td >
                      <form action="/projectWeb_war/admin/BookingTableData" id="form" method="post">
                        <input style="display: none" name="bookingId" value="<%=bookingList.get(i).getBOOKING_ID()%>">

                       <%if (bookingList.get(i).getTRANGTHAI()==-1){%> <button class="btn btn-primary btn-sm trash" type="submit"name="option" value="delete" title="Xóa"
                        ><i class="fas fa-trash-alt"></i>
                        </button>
                        <%}%>
                        <button class="btn btn-primary btn-sm edit" name="option" value="edit" type="submit" title="Sửa"
                        ><i class="fas fa-edit"></i>
                        </button>
                        <%if (bookingList.get(i).getTRANGTHAI()==0){%><button class="btn btn-primary btn-sm " style="background-color: #d1ffd1; color: #3ad540" name="option" value="submit" type="submit" title="Xác nhận"
                                ><i class="fas fa-check"></i>
                        </button>
                        <%}%>
                        <%if (bookingList.get(i).getTRANGTHAI()==0){%> <button class="btn btn-primary btn-sm " style="background-color: #eee3e3; color: #828c82" type="submit" name="option" value="cancel" title="Hủy"
                        ><i class="fa-solid fa-xmark"></i>
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
      </div>
    </main>
    <div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"
  data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">

      <div class="modal-body">
        <div class="row">
          <div class="form-group  col-md-12">
            <span class="thong-tin-thanh-toan">
              <h5>Chỉnh sửa thông tin Đơn đặt tour</h5>
            </span>
          </div>
        </div>
        <div class="row">
          <div class="form-group col-md-6">
            <label class="control-label">ID Đơn hàng</label>
            <input class="form-control" type="text" required value="#CD2187" disabled>
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">ID Khách hàng</label>
            <input class="form-control" type="text" required value="#kh011" >
          </div>
          <div class="form-group col-md-6">
            <label class="control-label">ID Tour</label>
            <input class="form-control" type="text" required value="#kh011" >
          </div>
          <div class="form-group  col-md-6">
            <label class="control-label">Số lượng vé người lớn</label>
            <input class="form-control" type="number" required value="10">
          </div>
          <div class="form-group  col-md-6">
            <label class="control-label">Số lượng vé trẻ em</label>
            <input class="form-control" type="number" required value="10">
          </div>
          <div class="form-group  col-md-6">
            <label class="control-label">Ngày lập</label>
            <input class="form-control" type="date" required value="10">
          </div>
          
          
          <div class="form-group col-md-6">
            <label class="control-label">Trạng thái</label>
            <select class="form-control" id="exampleSelect1">
              <option>-- Chọn tình trạng --</option>
              <option>Hoàn thành</option>
              <option>Đã xử lý</option>
              <option>Đang chờ</option>
              <option>Đã hủy</option>
            </select>
          </div>
          
        </div>
        <!-- <BR>
        <a href="#" style="    float: right;
      font-weight: 600;
      color: #ea0000;">Chỉnh sửa nâng cao</a>
        <BR> -->
        <BR>
        <button class="btn btn-save" type="button">Lưu lại</button>
        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
        <BR>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
  <!-- Essential javascripts for application to work-->
  <script src="js/jquery-3.2.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  <script src="src/jquery.table2excel.js"></script>
  <script src="js/main.js"></script>
  <!-- The javascript plugin to display page loading on top-->
  <script src="js/plugins/pace.min.js"></script>
  <!-- Page specific javascripts-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
  <!-- Data table plugin-->
  <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
  <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
  <script type="text/javascript">$('#sampleTable').DataTable();</script>
  <script>
    function deleteRow(r) {
      var i = r.parentNode.parentNode.rowIndex;
      document.getElementById("myTable").deleteRow(i);
    }
    jQuery(function () {
      jQuery(".trash").click(function () {
        swal({
          title: "Cảnh báo",
         
          text: "Bạn có chắc chắn là muốn xóa đơn hàng này?",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
          .then((willDelete) => {
            if (willDelete) {
              swal("Đã xóa thành công.!", {
                
              });
            }
          });
      });
    });
    oTable = $('#sampleTable').dataTable();
    $('#all').click(function (e) {
      $('#sampleTable tbody :checkbox').prop('checked', $(this).is(':checked'));
      e.stopImmediatePropagation();
    });

    //EXCEL
    // $(document).ready(function () {
    //   $('#').DataTable({

    //     dom: 'Bfrtip',
    //     "buttons": [
    //       'excel'
    //     ]
    //   });
    // });


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
    //In dữ liệu
    var myApp = new function () {
      this.printTable = function () {
        var tab = document.getElementById('sampleTable');
        var win = window.open('', '', 'height=700,width=700');
        win.document.write(tab.outerHTML);
        win.document.close();
        win.print();
      }
    }
    //     //Sao chép dữ liệu
    //     var copyTextareaBtn = document.querySelector('.js-textareacopybtn');

    // copyTextareaBtn.addEventListener('click', function(event) {
    //   var copyTextarea = document.querySelector('.js-copytextarea');
    //   copyTextarea.focus();
    //   copyTextarea.select();

    //   try {
    //     var successful = document.execCommand('copy');
    //     var msg = successful ? 'successful' : 'unsuccessful';
    //     console.log('Copying text command was ' + msg);
    //   } catch (err) {
    //     console.log('Oops, unable to copy');
    //   }
    // });


    //Modal
    $("#show-emp").on("click", function () {
      $("#ModalUP").modal({ backdrop: false, keyboard: false })
    });
  </script>
</body>

</html>