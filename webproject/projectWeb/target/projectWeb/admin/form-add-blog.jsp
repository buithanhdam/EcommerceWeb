<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Destination" %>
<%@ page import="java.util.List" %>
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

<body onload="time()" class="app sidebar-mini rtl">
  <!-- Navbar-->
  <%@include file="header.jsp"%>
  <!-- Sidebar menu-->
  <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
  <jsp:include page="leftSideBar.jsp">
    <jsp:param name="isCurrent" value="blogTable"/>
  </jsp:include>
  <%
    Blog blog = (Blog) request.getAttribute("blog")==null?null:(Blog) request.getAttribute("blog");
    String error = request.getAttribute("error") ==null?null:(String) request.getAttribute("error");
    List<Destination> listDes = (List<Destination>) request.getAttribute("listDes");
  %>
    <main class="app-content">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item">Danh sách Blog</li>
          <li class="breadcrumb-item"><a href="#"><%=blog==null?"Thêm Blog":"Sửa Blog"%></a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
          <div class="tile">
<%--            enctype="multipart/form-data"--%>
            <form  method="post" action="/projectWeb_war/admin/CRUDBlogData" enctype="multipart/form-data">
            <h3 class="tile-title"><%=blog==null?"Thêm Blog":"Sửa Blog"%></h3>
            <div class="tile-body">
                <div class="row">
                <div class="form-group  col-md-4" style="display: <%=blog==null?"none":"block"%>">
                  <label class="control-label">ID Blog</label>
                  <input class="form-control" type="text" style="display: none" name="blogID" value="<%=blog==null?"":blog.getBLOG_ID()%>">

                  <input class="form-control" type="text" disabled value="<%=blog==null?"":blog.getBLOG_ID()%>">
                </div>

                  <input class="form-control" type="text" style="display: none" name="blogUserId" value="<%=user==null?"guide002":user.getUser_Id()%>" >

              <div class="form-group  col-md-4">
                <label class="control-label">Địa điểm</label>
                <select class="form-control" name="blogDiaDiem" id="deatination_drop" required>
                  <%
                    for (Destination des:
                         listDes) {

                    %>
                  <option value="<%=des.getDiaDiem_ID()%>" ><%=des.getTenDiaDiem()%></option>
                  <%}%>
                </select>
              </div>
                <div class="form-group  col-md-4">
                  <label class="control-label">Tiêu đề</label>
                  <input class="form-control" type="text" name="blogTitle" value="<%=blog==null?"":blog.getBLOG_TITLE()==null?"":blog.getBLOG_TITLE()%>" required>
                </div>
              <%Date currentDate = Date.valueOf(LocalDate.now());%>
                <div class="form-group  col-md-4" style="display: <%=blog==null?"none":"block"%>">
                  <label class="control-label">Ngày viết bài</label>
                  <input class="form-control" type="date" name="blogDate" value="<%=blog==null?currentDate.toString():blog.getNgayVietBai()==null?currentDate.toString():blog.getNgayVietBai().toString()%>" required>
                </div>
                
                <div class="form-group  col-md-4">
                  <label class="control-label">Nội dung</label>
                  <textarea class="form-control" name="blogDescription"  required ><%=blog==null?"":blog.getDescription()==null?"":blog.getDescription()%></textarea>
                </div>
              <div class="form-group  col-md-4">
                <label class="control-label">Hạng mục</label>
                <select class="form-control" id="exampleSelect2" name="blogCategory" required>
                  <option value="Phiêu Lưu" >Phiêu Lưu</option>
                  <option value="Du Lịch" >Du Lịch</option>
                  <option value="Du Lịch Đôi">Du Lịch Đôi</option>
                  <option value="Du Lịch Đơn Thân" >Du Lịch Đơn Thân</option>
                  <option value="Tuần Trăng Mật" >Tuần Trăng Mật</option>
                  <option value="Bãi Biển" >Bãi Biển</option>
                  <option value="Thám Hiểm Núi" >Thám Hiểm Núi</option>
                </select>
              </div>

              <div class="form-group col-md-12">


                <label class="control-label">Ảnh Blog</label>
                <div id="myfileupload">
                  <input  type="file" accept="image/*" id="uploadfile"  name="ImageUpload"  onchange="readURL(this);" />
                </div>
                <div id="thumbbox">
                  <img height="300" width="300" alt="Thumb image" src="<%=blog==null?"":blog.getImageURL()==null?"":".."+blog.getImageURL()%>" id="thumbimage" style="display: none" />
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
          <a class="btn btn-cancel" href="/projectWeb_war/admin/BlogTableData">Hủy bỏ</a>

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