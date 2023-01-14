<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >

<head>
    <title>TravelLab - Khám phá đất nước của chúng ta</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./assets//images/favicon.png" type="image/gif" sizes="20x20">

    <link rel="stylesheet" href="./assets//css/select2.min.css">

    <link rel="stylesheet" href="./assets//css/jquery.fancybox.min.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="./assets//css/swiper-bundle.min.css">

    <link rel="stylesheet" href="./assets//css/bootstrap.min.css">

    <link rel="stylesheet" href="./assets//css/animate.min.css">

    <link rel="stylesheet" href="./assets//css/style.css">
    <link rel="stylesheet" href="./assets//css/responsive.css">
    <link rel="stylesheet" href="./assets//css/profile.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
    <STYLE>
        .isCurrent{
            color: #009b77;
        }
    </STYLE>
</head>

<body>





<% User userBox = (User)session.getAttribute("auth")==null?null:(User) session.getAttribute("auth"); %>

<%
    String isCurrent = request.getParameter("isCurrent");
%>


<%--<div class="form-group col-md-12">--%>
<%--    <label class="control-label">Ảnh sản phẩm</label>--%>
<%--    <div id="myfileupload">--%>
<%--        <input type="file" id="uploadfile" name="ImageUpload"  onchange="readURL(this);" />--%>
<%--    </div>--%>
<%--    <div id="thumbbox">--%>
<%--        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />--%>
<%--        <a class="removeimg" href="javascript:"></a>--%>
<%--    </div>--%>
<%--    <div id="boxchoice">--%>
<%--        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>--%>
<%--        <p style="clear:both"></p>--%>
<%--    </div>--%>

<%--</div>--%>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="post" action="/projectWeb_war/user/views/UploadProfileImage" enctype="multipart/form-data">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Cập nhật ảnh</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group col-md-12">
                    <input type="text" style="display: none" name="userId" value="<%=userBox.getUser_Id()%>">
                    <label class="control-label">Ảnh sản phẩm</label>
                    <div id="myfileupload">
                        <input accept="image/*" type="file" id="uploadfile" name="ImageUpload"  onchange="readURL(this);" />
                    </div>
                    <div id="thumbbox">
                        <img height="450" width="400" alt="Thumb image" id="thumbimage" style="display: none" />
                        <a class="removeimg" href="javascript:"></a>
                    </div>
                    <div id="boxchoice">
                        <a href="javascript:" class="Choicefile"><i class="fas fa-cloud-upload-alt"></i> Chọn ảnh</a>
                        <p style="clear:both"></p>
                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="submit" class="btn btn-primary">Lưu lại</button>
            </div>
        </div>
        </form>
    </div>
</div>



                            <div class="box-items-left">
                                <div class="wrapper p-4 box-items">
                                  <div class="info d-flex align-items-center mb-md-3">
                                    <div class="image me-3">
<%--                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--                                            Launch demo modal--%>
<%--                                        </button>--%>

                                        <!-- Modal -->
                                      <a class="btn btn-primary" style="background-color: transparent" data-toggle="modal" data-target="#exampleModal">

                                        <img style="width: 43px; height: 43px"
                                          src="<%=userBox==null?"":userBox.getImageURL()==null?"./assets/images/userDefaultImage.png":"../.."+userBox.getImageURL()%>"
                                          class="rounded-circle"
                                        />
                                      </a>
                                    </div>
                                    <div class="info-wrapper">
                                      <div>
                                        <h5 class="fw-bold"><%=userBox==null?"User":userBox.getFullName()==null?"":userBox.getFullName()%></h5>
                                        <small
                                          ><a
                                            href="/"
                                            class="__cf_email__"
                                            data-cfemail="83ede4f6fae6edebf4e7e2f7b2bab2b1c3e4eee2eaefade0ecee"
                                            ><%=userBox==null?"[Email chưa&#160;tồn tại]":userBox.getEmail()%></a
                                          ></small
                                        >
                                      </div>
                                      <span id="toggle-profile-menu" class="d-lg-none">
                                        <i class="icon icon--chevron-down"></i>
                                      </span>
                                    </div>
                                  </div>
                                  <nav class="profile-links py-3">
                                    <ul class="list-unstyled mb-0 py-3 pt-md-1">
                                      <li class="mb-1">
                                        <a
                                          class="d-inline-flex align-items-center rounded collapsed"
                                          data-bs-toggle="collapse"
                                          data-bs-target="#getting-started-collapse"
                                          aria-expanded="false"
                                        >
                                          <h6 class="fw-bold <%=isCurrent.equals("profile")?"isCurrent":""%>">Tài khoản</h6>
                                        </a>
                                        <div
                                          class="collapse "
                                          id="getting-started-collapse"
                                        >
                                          <ul class="list-unstyled fw-normal pb-1 small">
                                            <li>
                                              <a
                                                href="profile.jsp"
                                                class="d-inline-flex align-items-center rounded active <%=isCurrent.equals("profile")?"isCurrent":""%>"
                                              >
                                                Thông tin cá nhân
                                              </a>
                                            </li>
                                            <li>
                                              <a
                                                href="ChangePassword.jsp"
                                                class="d-inline-flex align-items-center rounded <%=isCurrent.equals("password")?"isCurrent":""%>"
                                              >
                                                Đổi mật khẩu
                                              </a>
                                            </li>
                                            <li>
                                              <a
                                                href="PaymentInfo.jsp"
                                                class="d-inline-flex align-items-center rounded <%=isCurrent.equals("payment")?"isCurrent":""%>"
                                              >
                                                Thông tin thanh toán
                                              </a>
                                            </li>
                                            <li>
                                              <a
                                                href="/projectWeb_war/user/views/signout"

                                                class="d-inline-flex align-items-center rounded"
                                              >
                                                Đăng xuất
                                              </a>
                                            </li>
<%--                                            <li>--%>
<%--                                              <a--%>
<%--                                                href="#"--%>
<%--                                                id="deleteAccount"--%>
<%--                                                data-bs-toggle="modal"--%>
<%--                                                data-bs-target="#deleteAccountModal"--%>
<%--                                                class="d-inline-flex align-items-center rounded"--%>
<%--                                              >--%>
<%--                                                Yêu cầu xóa tài khoản--%>
<%--                                              </a>--%>
<%--                                            </li>--%>
                                          </ul>
                                        </div>
                                      </li>
                                      <li class="mb-1">
                                        <a
                                          class="d-inline-flex align-items-center rounded"
                                          href="/projectWeb_war/user/views/order"
                                        >
                                          <h6 class="fw-bold <%=isCurrent.equals("order")?"isCurrent":""%>">Đơn đặt chỗ</h6>
                                        </a>
                                      </li>
                                        <li class="mb-1">
                                            <a
                                                    class="d-inline-flex align-items-center rounded"
                                                    href="Cart.jsp"
                                            >
                                                <h6 class="fw-bold <%=isCurrent.equals("cart")?"isCurrent":""%>">Giỏ hàng</h6>
                                            </a>
                                        </li>
                                      <li class="mb-1">
                                        <a
                                          class="d-inline-flex align-items-center rounded"
                                          href="/projectWeb_war/user/views/SavedCart"
                                        >
                                          <h6 class="fw-bold <%=isCurrent.equals("saved")?"isCurrent":""%>">Yêu thích đã lưu</h6>
                                        </a>
                                      </li>
                                      <li class="mb-1 d-none">
                                        <a
                                          class="d-inline-flex align-items-center rounded"
                                          href="Compared.html"
                                        >
                                          <h6 class="fw-bold">Sản phẩm đã so sánh</h6>
                                        </a>
                                      </li>
                                      <li class="mb-1 d-none">
                                        <a
                                          class="d-inline-flex align-items-center rounded"
                                          href="Voucher.html"
                                        >
                                          <h6 class="fw-bold">
                                            Voucher khuyến mãi của Quý khách
                                          </h6>
                                        </a>
                                      </li>
                                      <li class="mb-1 d-none">
                                        <a
                                          class="d-inline-flex align-items-center rounded"
                                          href="Promotion.html"
                                        >
                                          <h6 class="fw-bold">Chương trình ưu đãi cho user</h6>
                                        </a>
                                      </li>
                                    </ul>
                                  </nav>
                                </div>
                              </div>
                            <div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="supportModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">GỬI YÊU CẦU XÓA TÀI KHOẢN</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row g-3">
                                                <div class="col-12">
                                                    <label for="ReasonName" class="form-label">Lý do<span class="required-star">*</span></label>
                                                    <input type="text" class="form-control" id="ReasonName" placeholder="Lý do" value="" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="submit" id="btnSendRequest" class="btn btn-primary">Gửi đi</button>
                                        </div>
                                    </div>
                                    }
                                </div>
                            </div>
                            <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
                            <script>
                                function LogoutAccount() {
                                    if (!confirm("Xác nhận đăng xuất?")) {
                                        return false;
                                    }
                                    //Logout action
                                    $.ajax({
                                        url: '/AccountMember/LogoutAccount',
                                        type: 'POST',
                                        contentType: 'json',
                                        data: {},
                                        success: function(result) {
                                            if (result.length > 0) {
                                                alert(result);
                                                location.href = '/AccountMember/Login';
                                            }
                                        },
                                        error: function() {
                                            alert("Không thực hiện được");
                                        }
    
                                    })
                                };
    
                                var myModal = new bootstrap.Modal(document.getElementById('deleteAccountModal'), {
                                    keyboard: false
                                })
    
                                $("#deleteAccount").click(function() {
                                    event.preventDefault();
                                    myModal.show();
                                });
    
                                $("#btnSendRequest").click(function() {
                                    event.preventDefault();
                                    var ReasonName = $("#ReasonName").val();
                                    if (ReasonName === "") {
                                        alert("Vui lòng nhập lý do");
                                    } else {
                                        $.ajax({
                                            url: '/Profile/DeleteAccount',
                                            type: 'GET',
                                            /*contentType: 'json',*/
                                            data: {
                                                Reason: ReasonName
                                            },
                                            success: function(result) {
                                                if (result.length > 0) {
                                                    alert(result);
                                                    location.href = '/AccountMember/Login';
                                                } else {
                                                    alert("Xóa tài khoản không thành công");
                                                }
                                            },
                                            error: function() {
                                                alert("Không thực hiện được");
                                            }
    
                                        })
                                    }
                                });
                            </script>
    
    




    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="../assets//js/jquery-3.6.0.min.js"></script>
    <script src="../assets//js/bootstrap.bundle.min.js"></script>
    <script src="../assets//js/chain_fade.js"></script>
    <script src="../assets//js/owl.carousel.min.js"></script>
    <script src="../assets//js/swiper-bundle.min.js"></script>
    <script src="../assets//js/jquery.fancybox.min.js"></script>
    <script src="../assets//js/select2.min.js"></script>
    <script src="../assets//js/jquery-ui.js"></script>

    <script src="../assets//js/main.js"></script>
    <script src="../assets//js/profile.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>