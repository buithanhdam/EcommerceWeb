<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html >

<head>
  <title>Thêm sản phẩm | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Main CSS-->
  <link rel="stylesheet" type="text/css" href="css/main.css">
  <!-- Font-icon css-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
  <!-- or -->
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
  <link rel="stylesheet" type="text/css"
    href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  <script src="http://code.jquery.com/jquery.min.js" type="text/javascript"></script>
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
    <jsp:param name="isCurrent" value="tourTable"/>
  </jsp:include>


  <%
    TourPackage tour = request.getAttribute("tour")==null?null:(TourPackage) request.getAttribute("tour");
    String error = request.getAttribute("error")==null?null:(String) request.getAttribute("error");

    List<User> guides = (List<User>) request.getAttribute("guides");
    List<Voucher> vouchers = (List<Voucher>) request.getAttribute("vouchers");
    List<Destination> dess = (List<Destination>) request.getAttribute("dess");
    List<User> guideBusys = (List<User>) request.getAttribute("guideBusys");


    for (User u:
            guides) {
      if (guideBusys.contains(u)){
        guides.remove(u);
      }
    }
  %>
  <main class="app-content">
    <div class="app-title">
      <ul class="app-breadcrumb breadcrumb">
        <li class="breadcrumb-item">Danh sách Tour</li>
        <li class="breadcrumb-item"><a href="#"><%=tour==null?"Thêm Tour du lịch":"Sửa Tour du lịch"%></a></li>
      </ul>
    </div>
    <div class="row">
      <div class="col-md-12">
        <span style="font-size: 1rem;color: red"><%=error==null?"":error%></span>
        <div class="tile">
          <form method="post" action="/projectWeb_war/admin/CRUDTourData"  enctype="multipart/form-data">
<%--            modal--%>
<%--            modal--%>


    <div class="modal fade" id="addtinhtrang" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới Voucher</h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <label class="control-label">Nhập ID Voucher mới</label>
                            <select class="form-control"  name="tourDetailVoucher"  >
                                <option value="none">Không</option>
                                <% for (Voucher v:
                                        vouchers) {
                                    if (tour !=null ){

                                    if (tour.getVoucherList().size() != 0 &&tour.getVoucherList().get(0).getVOUCHER_ID().equals(v.getVOUCHER_ID())){


                                %>
                                <option selected value="<%=v.getVOUCHER_ID()%>"><%=v.getVOUCHER_ID()%>-<%=v.getVOUCHER_VALUE()%></option>
                                <%}else {%>
                                <option value="<%=v.getVOUCHER_ID()%>"><%=v.getVOUCHER_ID()%>-<%=v.getVOUCHER_VALUE()%></option>
                               <% }
                                }else{%>
                                <option value="<%=v.getVOUCHER_ID()%>"><%=v.getVOUCHER_ID()%>-<%=v.getVOUCHER_VALUE()%></option>
                                <%}
                                   }%>
                            </select>
                        </div>
                    </div>
                    <BR>
                    <button class="btn btn-save" data-dismiss="modal" type="button">Lưu lại</button>

                    <BR>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
         data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">

                <div class="modal-body">
                    <div class="row">
                        <div class="form-group  col-md-12">
              <span class="thong-tin-thanh-toan">
                <h5>Thêm mới hướng dẫn viên </h5>
              </span>
                        </div>
                        <div class="form-group col-md-12">
                            <input style="display: none" class="form-control" name="tourDetailCountGuide" value="<%=guides.size()%>" type="number">

                            <label class="control-label">Chọn hướng dẫn viên</label>
                            <div class="col-md-10">
                                <%
                                    for (int i = 0; i < guides.size(); i++) {
                                        int j =i +1;
                                        boolean b = false;
                                        if (tour !=null )
                                        {
                                            for (TourGuide g:
                                                    tour.getGuideList()) {

                                                if (g.getUser_id().equals(guides.get(i).getUser_Id())){

                                                            b = true;
                                %>
                                <input type="checkbox" checked  id="guide<%=j%>" name="tourDetailGuide<%=j%>" value="<%=guides.get(i).getUser_Id()%>">
                                <label for="guide<%=j%>"><%=guides.get(i).getUser_Id()%>-<%=guides.get(i).getFullName()%></label><br>
                                <%}%>


                                <%
                                            }
                                            if (b==false){%>
                                <input type="checkbox"  id="guide<%=j%>" name="tourDetailGuide<%=j%>" value="<%=guides.get(i).getUser_Id()%>">
                                <label for="guide<%=j%>"><%=guides.get(i).getUser_Id()%>-<%=guides.get(i).getFullName()%></label><br>
                                <%
                                    } }
                                        else{%>
                                <input type="checkbox"  id="guide<%=j%>" name="tourDetailGuide<%=j%>" value="<%=guides.get(i).getUser_Id()%>">
                                <label for="guide<%=j%>"><%=guides.get(i).getUser_Id()%>-<%=guides.get(i).getFullName()%></label><br>
                                <%}}%>
                            </div>

                        </div>

                    </div>
                    <BR>
                    <button class="btn btn-save" data-dismiss="modal" type="button">Lưu lại</button>

                    <BR>
                </div>
                <div class="modal-footer">
                </div>
            </div>
        </div>
    </div>


<%--            end modal--%>
<%--            --%>
          <h3 class="tile-title"><%=tour==null?"Tạo mới Tour du lịch":"Sửa Tour du lịch"%></h3>
          <div class="tile-body">

            <div class="row element-button">
<%--              <div class="col-sm-2">--%>
<%--                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#exampleModalCenter"><i--%>
<%--                    class="fas fa-folder-plus"></i> Thêm hình ảnh</a>--%>
<%--              </div>--%>
              <div class="col-sm-2">
                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#adddanhmuc"><i
                    class="fas fa-folder-plus"></i> Thêm hướng dẫn viên</a>
              </div>
              <div class="col-sm-2">
                <a class="btn btn-add btn-sm" data-toggle="modal" data-target="#addtinhtrang"><i
                    class="fas fa-folder-plus"></i> Thêm mã giảm giá</a>
              </div>
            </div>
            <div class="row">
              <input class="form-control" type="text" style="display: none" name="tourDetailId" value="<%=tour==null?"":tour.getTourDetail().getTOUR_ID()==null?"":tour.getTourDetail().getTOUR_ID()%>" placeholder="">

              <div class="form-group col-md-3" style="display: <%=tour==null?"none":"block"%>">
                <label class="control-label">Mã Tour </label>
                <input class="form-control" type="text" disabled value="<%=tour==null?"":tour.getTourDetail().getTOUR_ID()==null?"":tour.getTourDetail().getTOUR_ID()%>" placeholder="">
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Tên Tour</label>
                <input class="form-control" name="tourDetailName"  value="<%=tour==null?"":tour.getTourDetail().getTourName()==null?"":tour.getTourDetail().getTourName()%>" type="text">
              </div>
              <div class="form-group col-md-3">
                <label  class="control-label">Địa điểm</label>
                <select class="form-control"  name="tourDetailDiaDiem">
                  <%
                    for (Destination d:
                         dess) {
                      if (tour!=null&&tour.getDestination().getDiaDiem_ID().equals(d.getDiaDiem_ID()))
                      {
                    %>
                  <option selected value="<%=d.getDiaDiem_ID()%>"><%=d.getTenDiaDiem()%></option>
                  <%}else{%>
                  <option value="<%=d.getDiaDiem_ID()%>"><%=d.getTenDiaDiem()%></option>
                  <%}
                    }%>
                </select>
              </div>


              <div class="form-group  col-md-3">
                <label class="control-label">Số lượng</label>
                <input class="form-control"  name="tourDetailSoLuong" value="<%=tour==null?"":tour.getTourDetail().getSoLuong()%>" type="number" >
              </div>
              <div class="form-group col-md-3 ">
                <label class="control-label">Trạng thái</label>
                <select class="form-control"  name="tourDetailTrangThai">

              <% if (tour != null){%>
                  <%if (tour.getTourDetail().getTrangThai()==1){%>
                    <option selected value="1">Đang bán</option>
                  <option  value="0">Tạm hết bán</option>
                  <%}else if (tour != null && tour.getTourDetail().getTrangThai()==2){%>
                  <option selected value="2">Sắp bán</option>
                  <option  value="1">Đang bán</option>
                  <%}else if (tour != null && tour.getTourDetail().getTrangThai()==0){%>
                  <option selected value="0"> Tạm hết bán</option>
                  <option  value="1">Đang bán</option>
                  <option   value="-1">Ngừng kinh doanh</option>
                  <%}else if (tour != null && tour.getTourDetail().getTrangThai()==-1){%>
                  <option  selected value="-1">Ngừng kinh doanh</option>
                  <option  value="1">Đang bán</option>
                  <%}}else{%>
                  <option  value="1">Đang bán</option>
                  <option  value="0">Tạm hết bán</option>
                  <option   value="-1">Ngừng kinh doanh</option>
                  <option  value="2">Sắp bán</option>
                  <%}%>

                </select>
              </div>
             
              <div class="form-group col-md-12">
                <label class="control-label">Ảnh sản phẩm</label>
                <div id="myfileupload">
                  <input type="file"  accept="image/*" id="uploadfile" name="ImageUpload"  onchange="readURL(this);" />
                </div>
                <div id="thumbbox">
                  <img height="450" width="400" alt="Thumb image" src="<%=tour==null?"":tour.getTourDetail().getImageURL()==null?"":".."+tour.getTourDetail().getImageURL()%>" id="thumbimage" style="display: none" />
                  <a class="removeimg" href="javascript:"></a>
                </div>
                <div id="boxchoice">
                  <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                  <p style="clear:both"></p>
                </div>

              </div>
              <div class="form-group col-md-12">
                <label class="control-label">Mô tả sản phẩm</label>
                <textarea class="form-control"  name="tourDetailDescription"  id="mota"><%=tour ==null?"":tour.getTourDetail().getDescription()==null?"":tour.getTourDetail().getDescription()%></textarea>
                <!-- <script>CKEDITOR.replace('mota');</script> -->
              </div>
              <div class="form-group col-md-12" style="font-weight: bold;font-size: 1rem;">
                Loại vé
                <div style="width: 99%;background-color: var(--primary);padding: 0.05rem 0.1rem;"></div>
              </div>
              <div class="form-group col-md-3">
                <span>Vé người lớn (trên 18 tuổi)</span>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Giá vé người lớn</label>
                <input class="form-control"  name="tourDetailSLVNL" value="<%=tour==null?0:tour.getTypeList().get(0).getType()==1?tour.getTypeList().get(0).getGiaVe():tour.getTypeList().get(1).getGiaVe()%>" type="number" placeholder="">
              </div>
              <br>
              <br>
              <div class="form-group col-md-3">
                <span>Vé trẻ em (dưới 18 tuổi)</span>
              </div>
              <div class="form-group col-md-3">
                <label class="control-label">Giá vé trẻ em</label>
                <input class="form-control"  name="tourDetailSLVTE" value="<%=tour==null?0:tour.getTypeList().get(0).getType()==0?tour.getTypeList().get(0).getGiaVe():tour.getTypeList().get(1).getGiaVe()%>" type="number" placeholder="">
              </div>
              <br>
              <br>

              <div class="form-group col-md-12" style="font-weight: bold;font-size: 1rem;">
                Chi tiết Tour
                <div style="width: 99%;background-color: var(--primary);padding: 0.05rem 0.1rem;"></div>
              </div>
              <div class="form-group col-md-4">
                <label class="control-label">Ngày khởi hành</label>
                <input class="form-control"  name="tourDetailStartDate" value="<%=tour==null?"":tour.getTourDetail().getNgayKhoiHanh()%>" type="date">
              </div>
            <%Date currentDate = Date.valueOf(LocalDate.now());%>
            <input style="display: none" class="form-control" name="tourDetailCreateDate" value="<%=tour==null?currentDate:tour.getTourDetail().getNgayTao()%>" type="date">
              <div class="form-group col-md-4">
                <label class="control-label">Ngày kết thúc</label>
                <input class="form-control"  type="date" value="<%=tour==null?"":tour.getTourDetail().getNgayKetThuc()%>" name="tourDetailEndDate">
              </div>
              <div class="form-group col-md-3">
                <label  class="control-label">Nơi khởi hành</label>
                <select class="form-control"  name="tourDetailStartDiaDiem">
                  <%
                  for (Destination d:
                          dess) {
                  if (tour != null && tour.getTourDetail().getNoiKhoiHanh().equals(d.getTenDiaDiem())){


                %>
                  <option selected value="<%=d.getTenDiaDiem()%>"><%=d.getTenDiaDiem()%></option>
                  <%}else{%>
                  <option value="<%=d.getTenDiaDiem()%>"><%=d.getTenDiaDiem()%></option>
                  <%}


                  }%>
                </select>
              </div>
              <div class="form-group col-md-4">
                <label  class="control-label">Phương tiện di chuyển</label>
                <select class="form-control"  name="tourDetailVehicle">

                  <%if (tour != null && tour.getTourDetail().getPhuongTienDiChuyen().equals("Máy bay")){%><option selected value="Máy bay">Máy bay</option><%}else{%><option  value="Máy bay">Máy bay</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getPhuongTienDiChuyen().equals("Xe khách")){%> <option selected value="Xe khách">Xe khách</option><%}else{%><option  value="Xe khách">Xe khách</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getPhuongTienDiChuyen().equals("Du thuyền")){%><option selected value="Du thuyền">Du thuyền</option><%}else{%><option  value="Du thuyền">Du thuyền</option> <%}%>



                </select>
              </div>
              <div class="form-group col-md-4">
                <label  class="control-label">Hạng mục Tour</label>
                <select class="form-control"  name="tourDetailCategory">

                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Phiêu lưu")){%><option selected value="Phiêu lưu">Phiêu lưu</option><%}else{%><option value="Phiêu lưu">Phiêu lưu</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Du lịch")){%><option selected value="Du lịch">Du lịch</option><%}else{%><option value="Du lịch">Du lịch</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Du lịch đôi")){%><option selected value="Du lịch đôi">Du lịch đôi</option><%}else{%><option value="Du lịch đôi">Du lịch đôi</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Du lịch đơn thân")){%><option selected value="Du lịch đơn thân">Du lịch đơn thân</option><%}else{%> <option value="Du lịch đơn thân">Du lịch đơn thân</option><%}%>
                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Tuần trăng mật")){%><option selected value="Tuần trăng mật">Tuần trăng mật</option><%}else{%><option value="Tuần trăng mật">Tuần trăng mật</option> <%}%>
                  <%if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Bãi biển")){%><option selected value="Bãi biển">Bãi biển</option><%}else{%><option value="Bãi biển">Bãi biển</option> <%}%>
                  <% if (tour != null && tour.getTourDetail().getTOUR_CATEGORY().equals("Thám hiểm núi")){%><option selected value="Thám hiểm núi">Thám hiểm núi</option><%}else{%><option value="Thám hiểm núi">Thám hiểm núi</option> <%}%>



                </select>
              </div>
              <br>
              <br>


              <div class="form-group col-md-12" style="font-weight: bold;font-size: 1rem;">
                Kế hoạch chi tiết từng ngày
                <div class="col-sm-2" style="float: right;">
                  <input style="display: none" class="form-control" id="tourDetailCountDay" name="tourDetailCountDay" value="<%=tour==null?0:tour.getDayList().size()%>"  type="number">
                  <button class="btn btn-primary btn-sm success add_day" type="button" title="Thêm ngày" >
                    <i class="fas fa-plus"></i>
                  </button>
                </div>
                <div style="margin-top: 0.7rem;width: 99%;background-color: var(--primary);padding: 0.05rem 0.1rem;"></div>
              </div>
              <ul style="list-style: none;width: 100%;" id="group_tour_per_day" >
               <%if (tour != null){
                 for (TourDetailDays tdd:
                      tour.getDayList()) {


               %>
                <li id="item_tour_per_day">
                  <div class="form-group col-md-12"  style="display: flex;">

                    <div class="form-group col-md-1">
                      <label class="control-label">Ngày </label>
                      <input  type="number" name="tourDetailDay<%=tdd.getNgay()%>" style="display: none" value="<%=tdd.getNgay()%>" >
                      <input class="form-control" id="item_tour_per_day_value"  type="number" value="<%=tdd.getNgay()%>" disabled>
                    </div>
                    <div class="form-group col-md-3">
                      <label class="control-label">Tiêu đề của ngày</label>
                      <input class="form-control" id="item_tour_per_day_title"  name="tourDetailDayTitle<%=tdd.getNgay()%>"  value="<%=tdd.getTitle()%>" type="text">
                    </div>
                    <div class="form-group col-md-7">
                      <label class="control-label">Mô tả ngày</label>
                      <textarea class="form-control" name="tourDetailDayMoTa<%=tdd.getNgay()%>"  id="m"><%=tdd.getDescription()%></textarea>

                    </div>
                    <div class="form-group col-md-0.5">
                      <button class="btn btn-primary btn-sm trash" type="button" title="Xóa ngày"
                      ><i class="fas fa-trash-alt"></i>
                      </button>
                    </div>
                  </div>
                </li>
                <%}}%>
              </ul>
             
              <br>

          </div>
          <button class="btn btn-save" type="submit">Lưu lại</button>
          <a class="btn btn-cancel" href="/projectWeb_war/admin/TourTableData">Hủy bỏ</a>

          </div>
          </form>
        </div>
      </div>
    </div>
  </main>


  <!--
  MODAL CHỨC VỤ 
-->
<%--  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"--%>
<%--    data-backdrop="static" data-keyboard="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--      <div class="modal-content">--%>

<%--        <div class="modal-body">--%>
<%--          <div class="row">--%>
<%--            <div class="form-group  col-md-12">--%>
<%--              <span class="thong-tin-thanh-toan">--%>
<%--                <h5>Thêm mới nhà cung cấp</h5>--%>
<%--              </span>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-12">--%>
<%--              <label class="control-label">Nhập tên chức vụ mới</label>--%>
<%--              <input class="form-control" type="text" >--%>
<%--            </div>--%>
<%--          </div>--%>
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
  <!--
MODAL
-->



  <!--
  MODAL huong dan vien
-->
<%--  <div class="modal fade" id="adddanhmuc" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"--%>
<%--    data-backdrop="static" data-keyboard="false">--%>
<%--    <div class="modal-dialog modal-dialog-centered" role="document">--%>
<%--      <div class="modal-content">--%>

<%--        <div class="modal-body">--%>
<%--          <div class="row">--%>
<%--            <div class="form-group  col-md-12">--%>
<%--              <span class="thong-tin-thanh-toan">--%>
<%--                <h5>Thêm mới hướng dẫn viên </h5>--%>
<%--              </span>--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-12">--%>
<%--              <label class="control-label">Nhập ID hướng dẫn viên</label>--%>
<%--              <input class="form-control" type="text" >--%>
<%--            </div>--%>
<%--            <div class="form-group col-md-12">--%>
<%--              <label class="control-label">Hướng dẫn viên hiện đang có</label>--%>
<%--              <ul style="padding-left: 20px;">--%>
<%--                <li>hà</li>--%>
<%--              <li>Meo</li>--%>
<%--              --%>
<%--              </ul>--%>
<%--            </div>--%>
<%--          </div>--%>
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
  <!--
MODAL
-->




  <!--
  MODAL ma giam gia
-->
  <!--
MODAL
-->



   <!-- Essential javascripts for application to work-->
   <script src="js/jquery-3.2.1.min.js"></script>
   <script src="js/popper.min.js"></script>
   <script src="js/bootstrap.min.js"></script>
   <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
   <!-- <script src="src/jquery.table2excel.js"></script> -->
   <script src="js/main.js"></script>
   <!-- The javascript plugin to display page loading on top-->
   <script src="js/plugins/pace.min.js"></script>
   <!-- Page specific javascripts-->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.js"></script>
   <!-- Data table plugin-->
   <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
   <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
  <script type="text/javascript">
    
    
    
    const listDay = $("#group_tour_per_day");

    jQuery(function () {

      jQuery(".trash").click(function (e) {

        swal({
          title: "Cảnh báo",
          text: "Bạn có chắc chắn là muốn xóa ngày này?",
          buttons: ["Hủy bỏ", "Đồng ý"],
        })
                .then((willDelete) => {

                  if (willDelete) {

                    var i = e.currentTarget.parentNode.parentNode.parentNode;
                    //  console.log(i)
                    listDay.children("#item_tour_per_day").map((index,node) => {
                      if (node.querySelector("#item_tour_per_day_value").value === i.querySelector("#item_tour_per_day_value").value) {
                        node.remove();
                        let tourDetailCountDay = $("#tourDetailCountDay");
                        tourDetailCountDay[0].value =  tourDetailCountDay[0].value -1;
                      }
                    })
                    listDay.children("#item_tour_per_day").map((index,node) => {
                      node.querySelector("#item_tour_per_day_value").value = index +1;
                    })
                    swal("Đã xóa thành công.!", {

                    });
                  }
                });
      });
    });
    jQuery(function () {         
      jQuery(".add_day").click(function (e) {  
        var listChildren = listDay.children("#item_tour_per_day");
        let tourDetailCountDay = $("#tourDetailCountDay");
        tourDetailCountDay[0].value = listChildren.length+1
console.log(tourDetailCountDay[0].value)
            listDay.append(`
            <li id="item_tour_per_day">
                  <div class="form-group col-md-12"  style="display: flex;">
                    
                    <div class="form-group col-md-1">
                      <label class="control-label">Ngày </label>
                      <input type="number" name="tourDetailDay${listChildren.length+1}" style="display: none" value=${listChildren.length+1} >
                      <input  class="form-control" id="item_tour_per_day_value" type="number" value=${listChildren.length+1} disabled>
                    </div>
                    <div class="form-group col-md-3">
                      <label class="control-label">Tiêu đề của ngày</label>
                      <input class="form-control" id="item_tour_per_day_title"  name="tourDetailDayTitle${listChildren.length+1}"  value="" type="text">
                    </div>
                    <div class="form-group col-md-7">
                      <label class="control-label">Mô tả ngày</label>
                      <textarea class="form-control"  name="tourDetailDayMoTa${listChildren.length+1}" value="" id="mota"></textarea>

                    </div>
                    <div class="form-group col-md-0.5">                     
                      <button class="btn btn-primary btn-sm trash" type="button" title="Xóa ngày"
                                            ><i class="fas fa-trash-alt"></i> 
                      </button>
                    </div>
                  </div>
                </li>
            `);
              
            jQuery(function () {
          
          jQuery(".trash").click(function (e) {
            
              swal({
                  title: "Cảnh báo",
                  text: "Bạn có chắc chắn là muốn xóa ngày này?",
                  buttons: ["Hủy bỏ", "Đồng ý"],
              })
                  .then((willDelete) => {
                    
                      if (willDelete) {
                        
                        var i = e.currentTarget.parentNode.parentNode.parentNode;
                      //  console.log(i) 
                       listDay.children("#item_tour_per_day").map((index,node) => {
                          if (node.querySelector("#item_tour_per_day_value").value === i.querySelector("#item_tour_per_day_value").value) {
                            node.remove();
                            let tourDetailCountDay = $("#tourDetailCountDay");
                            tourDetailCountDay[0].value =  tourDetailCountDay[0].value -1;
                          }
                       })
                       listDay.children("#item_tour_per_day").map((index,node) => {
                          node.querySelector("#item_tour_per_day_value").value = index +1;
                       })
                          swal("Đã xóa thành công.!", {
                            
                          });
                      }
                  });
          });
      });
          });
      });
     
    //   const inpFile = document.getElementById("inpFile");
    // const loadFile = document.getElementById("loadFile");
    // const previewContainer = document.getElementById("imagePreview");
   
    // const previewImage = previewContainer.querySelector(".image-preview__image");
    // const previewDefaultText = previewContainer.querySelector(".image-preview__default-text");
    // inpFile.addEventListener("change", function () {
    //   const file = this.files[0];
    //   if (file) {
    //     const reader = new FileReader();
    //     previewDefaultText.style.display = "none";
    //     previewImage.style.display = "block";
    //     reader.addEventListener("load", function () {
    //       previewImage.setAttribute("src", this.result);
    //     });
    //     reader.readAsDataURL(file);
    //   }
    // });

  </script>
</body>

</html>