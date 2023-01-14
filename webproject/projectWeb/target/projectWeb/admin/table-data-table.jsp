<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
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
  <
  <jsp:include page="leftSideBar.jsp">
    <jsp:param name="isCurrent" value="guideTable"/>
  </jsp:include>

  <%
    List<User> guideList = (List<User>) request.getAttribute("guideList");
    String error = request.getAttribute("error") ==null?null:(String) request.getAttribute("error");
  %>
  <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb side">
        <li class="breadcrumb-item active"><a href="#"><b>Danh sách hướng dẫn viên</b></a></li>
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

                <a class="btn btn-add btn-sm" href="/projectWeb_war/admin/CRUDGuideData" title="Thêm"><i class="fas fa-plus"></i>
                  Tạo mới Huớng dẫn viên</a>
              </div>
             
             
<%--              <div class="col-sm-2">--%>
<%--                <a class="btn btn-delete btn-sm" type="button" title="Xóa" onclick="myFunction(this)"><i--%>
<%--                    class="fas fa-trash-alt"></i> Xóa tất cả </a>--%>
<%--              </div>--%>
          </div>
            <table class="table table-hover table-bordered js-copytextarea" cellpadding="0" cellspacing="0" border="0"
              id="sampleTable">
              <thead>
                <tr>
                  <th width="10"><input type="checkbox" id="all"></th>
                  <th width="50">ID hướng dẫn viên</th>
                  <th width="150">Họ và tên</th>
                  <th width="20">Ảnh đại diện</th>
                  <th width="200">Địa chỉ</th>
                  <th width="60">Ngày sinh</th>
                  <th width="20">Giới tính</th>
                  <th width="60">SĐT</th>
                  <th width="150">Email</th>
                  <th width="70">CMND</th>
                  <th width="100">Tính năng</th>
                </tr>
              </thead>
              <tbody>
              <%

                for (User g:
                     guideList) {

              %>
                <tr>
                  <td width="10"><input type="checkbox" name="check<%=g.getUser_Id()%>" value="<%=g.getUser_Id()%>"></td>
                  <td><%=g.getUser_Id()%></td>
                  <td><%=g.getFullName()==null?"Chưa có":g.getFullName()%></td>
                  <td><img class="img-card-person" src="<%=g.getImageURL()==null?"":".."+g.getImageURL()%>" alt=""></td>
                  <td><%=g.getDiaChi()==null?"Chưa có":g.getDiaChi()%></td>
                  <td><%=g.getBirth() ==null?"Chưa có":g.getBirth().toString()%></td>
                  <td><%=g.getGioiTinh()==null?"Chưa có":g.getGioiTinh()%></td>
                  <td><%=g.getPhone() ==null? "Chưa có":g.getPhone()%></td>
                  <td><%=g.getEmail() == null?"Chưa có":g.getEmail()%></td>
                  <td><%=g.getCMND()==null ?"Chưa có":g.getCMND()%></td>
                  <td class="table-td-center">
                    <form action="/projectWeb_war/admin/GuideTableData" id="form" method="post">
                      <input style="display: none" name="guideId" value="<%=g.getUser_Id()%>">
                      <button class="btn btn-primary btn-sm trash" type="submit"name="option" value="delete" title="Xóa"
                              ><i class="fas fa-trash-alt"></i>
                      </button>
                      <button class="btn btn-primary btn-sm edit" name="option" value="edit" type="submit" title="Sửa"
                              ><i class="fas fa-edit"></i>
                      </button>
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

  <!--
  MODAL
-->
<%--  <%--%>
<%--    for (User gm:--%>
<%--         guideList) {--%>
<%--    %>--%>
<%--  <div class="modal fade" id="ModalUP<%=gm.getUser_Id()%>" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static"--%>
<%--    data-keyboard="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--      <div class="modal-content">--%>

<%--        <div class="modal-body">--%>
<%--          <div class="row">--%>
<%--            <div class="form-group  col-md-12">--%>
<%--              <span class="thong-tin-thanh-toan">--%>
<%--                <h5>Chỉnh sửa thông tin hướng dẫn viên</h5>--%>
<%--              </span>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <div class="row">--%>
<%--            <div class="form-group col-md-6">--%>
<%--              <label class="control-label">ID Huớng Dẫn Viên</label>--%>
<%--              <input class="form-control" type="text" required value="<%=gm.getUser_Id()%>" disabled>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--              <label class="control-label">Họ và tên</label>--%>
<%--              <input class="form-control" type="text" required value="Võ Trường">--%>
<%--            </div>--%>
<%--            <div class="form-group  col-md-6">--%>
<%--              <label class="control-label">Số điện thoại</label>--%>
<%--              <input class="form-control" type="number" required value="09267312388">--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--              <label class="control-label">Địa chỉ email</label>--%>
<%--              <input class="form-control" type="text" required value="truong.vd2000@gmail.com">--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--              <label class="control-label">Ngày sinh</label>--%>
<%--              <input class="form-control" type="date" value="15/03/2000">--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-6">--%>
<%--              <label class="control-label">Giới tính</label>--%>
<%--              <select class="form-control" id="exampleSelect2" required>--%>
<%--                <option>-- Chọn giới tính --</option>--%>
<%--                <option>Nam</option>--%>
<%--                <option>Nữ</option>--%>
<%--              </select>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-4">--%>
<%--              <label class="control-label">Địa chỉ thường trú</label>--%>
<%--              <input class="form-control" type="text" required>--%>
<%--            </div>--%>
<%--          </div>--%>
<%--          <!-- <BR>--%>
<%--          <a href="#" style="    float: right;--%>
<%--        font-weight: 600;--%>
<%--        color: #ea0000;">Chỉnh sửa nâng cao</a>--%>
<%--          <BR> -->--%>
<%--          <BR>--%>
<%--          <button class="btn btn-save" type="button">Lưu lại</button>--%>
<%--          <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>--%>
<%--          <BR>--%>
<%--        </div>--%>
<%--        <div class="modal-footer">--%>
<%--        </div>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--  <%}%>--%>
  <!--
  MODAL
-->


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
      jQuery("").click(function () {
        swal({
          title: "Cảnh báo",
         
          text: "Bạn có chắc chắn là muốn xóa nhân viên này?",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
          .then((willDelete) => {
            if (willDelete) {

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