

<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page import="java.util.Random" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
  <title>Thêm nhân viên | Quản trị Admin</title>
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
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <script>
    function readURL(input, thumbimage) {
      if (input.files && input.files[0]) { //Sử dụng  cho Firefox - chrome
        var reader = new FileReader();
        reader.onload = function (e) {
          $("#thumbimage").attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
      else { // Sử dụng cho IE
        $("#thumbimage").attr('src', input.value);
      }
      $("#thumbimage").show();
      $('.filename').text($("#uploadfile").val());
      $('.Choicefile').css('background', '#14142B');
      $('.Choicefile').css('cursor', 'default');
      $(".removeimg").show();
      $(".Choicefile").unbind('click');
    }
    $(document).ready(function () {
      $(".Choicefile").bind('click', function () {
        $("#uploadfile").click();
      });
      $(".removeimg").click(function () {
        $("#thumbimage").attr('src', '').hide();
        $("#myfileupload").html('<input type="file" id="uploadfile"  onchange="readURL(this);" />');
        $(".removeimg").hide();
        $(".Choicefile").bind('click', function () {
          $("#uploadfile").click();
        });
        $('.Choicefile').css('background', '#14142B');
        $('.Choicefile').css('cursor', 'pointer');
        $(".filename").text("");
      });
    })
  </script>
</head>

<body class="app sidebar-mini rtl">
<style>
  .Choicefile {
    display: block;
    background: #14142B;
    border: 1px solid #fff;
    color: #fff;
    width: 150px;
    text-align: center;
    text-decoration: none;
    cursor: pointer;
    padding: 5px 0px;
    border-radius: 5px;
    font-weight: 500;
    align-items: center;
    justify-content: center;
  }
  .Choicefile:hover {
    text-decoration: none;
    color: white;
  }
  #uploadfile,
  .removeimg {
    display: none;
  }
  #thumbbox {
    position: relative;
    width: 100%;
    margin-bottom: 20px;
  }
  .removeimg {
    height: 25px;
    position: absolute;
    background-repeat: no-repeat;
    top: 5px;
    left: 5px;
    background-size: 25px;
    width: 25px;
    /* border: 3px solid red; */
    border-radius: 50%;
  }
  .removeimg::before {
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
    content: '';
    border: 1px solid red;
    background: red;
    text-align: center;
    display: block;
    margin-top: 11px;
    transform: rotate(45deg);
  }
  .removeimg::after {
    /* color: #FFF; */
    /* background-color: #DC403B; */
    content: '';
    background: red;
    border: 1px solid red;
    text-align: center;
    display: block;
    transform: rotate(-45deg);
    margin-top: -2px;
  }
</style>
<!-- Navbar-->
<%@include file="header.jsp"%>
<!-- Sidebar menu-->
<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
<jsp:include page="leftSideBar.jsp">
  <jsp:param name="isCurrent" value="guideTable"/>
</jsp:include>

<%
  User guide = request.getAttribute("guide")==null?null:(User) request.getAttribute("guide");
  String error = request.getAttribute("error")==null?null:(String) request.getAttribute("error");
%>
<main class="app-content">
  <div class="app-title">
    <ul class="app-breadcrumb breadcrumb">
      <li class="breadcrumb-item">Danh sách hướng dẫn viên</li>
      <li class="breadcrumb-item"><a href="#"><%=guide==null?"Thêm hướng dẫn viên":"Sửa hướng dẫn viên"%></a></li>
    </ul>
  </div>
  <div class="row">
    <div class="col-md-12">
      <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
      <div class="tile">

        <h3 class="tile-title"><%=guide==null?"Tạo mới hướng dẫn viên":"Sửa hướng dẫn viên"%></h3>
        <form method="post" action="/projectWeb_war/admin/CRUDGuideData" enctype="multipart/form-data" >
          <div class="tile-body">
            <div class="row element-button">

            </div>
            <div class="row">
              <input class="form-control" style="display: none" type="text" value="<%=guide==null?"":guide.getUser_Id()%>" name="idGuide"  >

              <div class="form-group col-md-4" style="display: <%=guide==null?"none":"block"%>">
                <label class="control-label">ID hướng dẫn viên</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getUser_Id()%>" disabled >
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Họ và tên</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getFullName()==null?"":guide.getFullName()%>" name="fullNameGuide" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Địa chỉ email</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getEmail()==null?"":guide.getEmail()%>" name="emailGuide" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Username</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getUsername()==null?"":guide.getUsername()%>"name="usernameGuide" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Password</label>
                <input class="form-control" type="password" value="<%=guide==null?"":guide.getUser_password()==null?"":guide.getUser_password()%>" name="passwordGuide" required>
              </div>

              <div class="form-group col-md-4">
                <label class="control-label">Địa chỉ thường trú</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getDiaChi()==null?"":guide.getDiaChi()%>" name="diachiGuide" required>
              </div>
              <div class="form-group  col-md-4">
                <label class="control-label">Số điện thoại</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getPhone()==null?"":guide.getPhone()%>" name="phoneGuide" required>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Ngày sinh</label>
                <input class="form-control" type="date" value="<%=guide==null?"":guide.getBirth()==null?"":guide.getBirth().toString()%>" name="birthGuide">
              </div>

              <div class="form-group col-md-3">
                <label class="control-label">Số CMND</label>
                <input class="form-control" type="text" value="<%=guide==null?"":guide.getCMND()==null?"":guide.getCMND()%>" name="cmndGuide" required>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Ngày cấp</label>
                <input class="form-control" type="date" required>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Nơi cấp</label>
                <input class="form-control" type="text" required>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Giới tính</label>
                <select class="form-control" id="exampleSelect2" name="gioiTinhGuide" required>
                  <option value=""  >-- Chọn giới tính --</option>
                  <option value="Nam">Nam</option>
                  <option value="Nữ" >Nữ</option>
                </select>
              </div>

              <div class="form-group col-md-12">


                <label class="control-label">Ảnh 3x4 nhân viên</label>
                <div id="myfileupload">
                  <input type="file" accept="image/*" id="uploadfile"  name="ImageUpload"  onchange="readURL(this);" />
                </div>
                <div id="thumbbox">
                  <img height="300" width="300" alt="Thumb image" src="<%=guide==null?"":guide.getImageURL()==null?"":".."+guide.getImageURL()%>" id="thumbimage" style="display: none" />
                  <a class="removeimg" href="javascript:"></a>
                </div>
                <div id="boxchoice">
                  <a href="javascript:" class="Choicefile"><i class='bx bx-upload'></i></a>
                  <p style="clear:both"></p>
                </div>

              </div>



            </div>
          </div>
          <button class="btn btn-save" type="submit">Lưu lại</button>
          <a class="btn btn-cancel" href="/projectWeb_war/admin/GuideTableData">Hủy bỏ</a>
        </form>

      </div>
    </div>
  </div>
</main>


<!--
MODAL
-->
<div class="modal fade" id="ModalUP" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
     data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <form method="post" action="/projectWeb_war/admin/Upload" enctype="multipart/form-data">
      <div class="modal-body">
        <div class="row">
          <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm ảnh mới</h5>
              </span>
          </div>

        </div>
        <BR>
        <button class="btn btn-save" type="submit">Lưu lại</button>
        <a class="btn btn-cancel" data-dismiss="modal" href="#">Hủy bỏ</a>
        <BR>
      </div>
      </form>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
<!--
MODAL
-->


<!-- Essential javascripts for application to work-->
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
<!-- The javascript plugin to display page loading on top-->
<script src="js/plugins/pace.min.js"></script>

</body>

</html>
