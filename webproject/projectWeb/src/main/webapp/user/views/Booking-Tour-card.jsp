<%@ page import="java.util.List" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <title>TraveLab - Khám phá đất nước của chúng ta</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./assets/images/favicon.png" type="image/gif" sizes="20x20">

    <link rel="stylesheet" href="./assets/css/select2.min.css">

    <link rel="stylesheet" href="./assets/css/jquery.fancybox.min.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <!-- <link href='./assets/css/boxicons.min.css' rel='stylesheet'> -->

    <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css">

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="./assets/css/animate.min.css">

    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
</head>

<body>
  <style>
      .go-tour{
          display: flex;
          justify-content: space-around;
          gap: 1rem;
      };
      .time{
       color: #2d4271;
      }
     .detail table {
    width: 100%;
};
table {
    caption-side: bottom;
    border-collapse: collapse;
    
};

  </style>

    <div class="preloader">
        <div class="loader">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>


  <%@include file="./components/header.jsp"%>


    <div class="breadcrumb breadcrumb-style-one">
        <div class="container">
            <div class="col-lg-12 text-center">
                <h2 class="breadcrumb-title">Đặt Tour</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Đặt Tour</li>
                </ul>
            </div>
        </div>
    </div>

  <%
      TourCart tc =(TourCart) session.getAttribute("tc")==null?null:(TourCart) session.getAttribute("tc");
      List<TourDetailType> tdt = (List<TourDetailType>) request.getAttribute("tdt")==null?null:(List<TourDetailType>) request.getAttribute("tdt");
      List<Voucher> voucher = (List<Voucher>) request.getAttribute("voucher")==null?null:(List<Voucher>) request.getAttribute("voucher");
        String textError = (String)request.getAttribute("textError")==null?"":(String) request.getAttribute("textError");
  %>

    <div class="error-wrapper pt-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="error-content text-center">

                        <span style="color: red;font-size: 1rem;"><%=textError%></span>

                        <h2>Thanh toán</h2>
                        <form action="/projectWeb_war/user/views/booking" method="post" id="booking-form">
                            <div class="booking-form-wrapper">
                               
                                
                                    <div class="custom-input-group ">
                                        <i class="bi bi-chevron-down"></i>
                                        <select id="hadCard"name="hadCard">
                                            <option selected value="0">Chọn thẻ</option>
                                            <%if (userHeader.getBankCard()!=null){%>
                                            <option value="<%=userHeader.getBankCard()%>"><%=userHeader.getBankCard()%></option>
                                            <%}%>

                                        </select>
                                    </div>
                                    
                                    <span style="color: black; font-weight: 500;">Hoặc thêm thẻ nếu quý khách chưa có</span>
                                   
                                    <div class="custom-input-group">
                                        <input type="text" placeholder="Tên trên thẻ" name="nameCard" id="nameCard">
                                        <input type="number" placeholder="Số thẻ" name="numberCard" id="numberCard">
                                        <input type="date" id="cardExpiredDate" name="dateCard" placeholder="MM/YY" class="form-control" aria-describedby="cardExpiredDateBlock" />
                                        <select id="card-list" name="bankCard" style="border: 1px solid #ced4da;">
                                            <option selected value="0">Chọn thẻ</option>
                                            <option value="Ngân hàng VCBank">Ngân hàng VCBank</option>
                                            <option value="Ngân hàng BIDV">Ngân hàng BIDV</option>
                                            
                                        </select>  
                                        
                                    </div>
                                <span style="color: black; font-weight: 500;">Xác nhận mật khẩu</span>

                                <div class="custom-input-group">
                                    <input type="password" placeholder="Nhập mật khẩu" name="Password" id="Password">
                                    <input type="password" placeholder="Nhập lại mật khẩu" name="rePassword" id="rePassword">
                                    <span id="checkPassword" style="display: none;color: red;font-size: 0.7rem;">Mật khẩu không khớp</span>
                                </div>
                            </div>
                              
                              
                                <div class="custom-input-group">
                                    <span id="checkFullInput" style="display: none;color: red;font-size: 0.7rem;">Bắt buộc phải nhập đầy đủ thông tin</span>
                                    <div class="submite-btn">
                                        <button type="submit" id="btn">Thanh toán</button>
                                    </div>
                                </div>
                            
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 tour-detail-booking" style="margin-left: 4rem;border: 1px solid #e0e0e0;">
                    <div class="error-content text-center ">
                        <h2>Thông tin chuyến đi</h2>
                        <div class="group-checkout">

                            <p class="package-title">Tour trọn gói <span> (<%=tc==null?"0":tc.getSOLUONG()%> khách)</span></p>
                            <div class="product" style="margin-top: 1rem;">
                                <div class="product-image">
                                    <img src="<%=tc==null?"":"../.."+tc.getImageURL()%>" class="img-fluid" alt="image">
                                </div>
                                <div class="product-content">
                                    <p class="title" style="color: #2d4271; font-weight: 600;"><%=tc==null?"":tc.getTourName()%></p>
                                </div>
                            </div>
                            <%
                                String[] startDayStringList = tc.getNgayKhoiHanh().toString().split("-");
                                String startDayString ="Ngày "+ startDayStringList[2]+" Tháng "+startDayStringList[1]+", "+startDayStringList[0];
                                String[] endDayStringList = tc.getNgayKetThuc().toString().split("-");
                                String endDayString ="Ngày "+ endDayStringList[2]+" Tháng "+endDayStringList[1]+", "+endDayStringList[0];

                                float giaVeChild= 0;
                                float giaVeAdult= 0;
                                for (TourDetailType t:
                                        tdt) {
                                    if (t.getType() == 1){
                                        giaVeAdult = t.getGiaVe();
                                    }else{
                                        giaVeChild= t.getGiaVe();
                                    }
                                }

                                Locale locale = new Locale("vi");
                                NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                String giaVeChildString = format.format(giaVeChild).split(",")[0];
                                String giaVeAdultString = format.format(giaVeAdult).split(",")[0];
                                int numAdult= tc==null?0:tc.getSOLUONG_VENGUOILON();
                                int numChild = tc==null?0:tc.getSOLUONG_VETREEM();

                                float tongTien =(numAdult*giaVeAdult)+(numChild*giaVeChild);
                                String tongTienString = format.format(tongTien).split(",")[0];
                                int voucherValue = 0;
                                if (voucher.size()==0) {
                                    voucherValue = 0;
                                }else {
                                    voucherValue = voucher.get(0).getVOUCHER_VALUE();
                                }
                                float tienKhuyenMai = (voucherValue/100)*tongTien;
                                String tienKhuyenMaiString = format.format(tienKhuyenMai).split(",")[0];
                                float thanhTien = tc==null?tongTien - tienKhuyenMai:tc.getTongTien();
                                String thanhTienString = format.format(thanhTien).split(",")[0];
                            %>
                            <div class="go-tour" >
                                <div class="start">
                                    <i class="fal fa-calendar-minus"></i>
                                    <div class="start-content">
                                        <span>Bắt đầu chuyến đi</span>
                                        <p class="time" style="color: #2d4271; font-weight: 600;"><%=startDayString%></p>
                                        <p class="from"></p>
                                    </div>
                                </div>
                                <div class="end">
                                    <i class="fal fa-calendar-minus"></i>
                                    <div class="start-content">
                                        <span >Kết thúc chuyến đi</span>
                                        <p class="time" style="color: #2d4271; font-weight: 600;"><%=endDayString%></p>
                                        <p class="from"></p>
                                    </div>
                                </div>
                            </div>

                            <div class="detail" style="display: flex;justify-content: center;align-items: center;">
                                <table style="width: 90%;">
                                    <tbody><tr>
                                        <th class="l1"></th>
                                        <th class="l2 text-right">

                                        </th>
                                    </tr>
                                    <tr>
                                        <td>Người lớn</td>
                                        <td class="t-price text-right" id="AdultPrice"><%=tc.getSOLUONG_VENGUOILON()%> x <%=giaVeAdultString%>₫</td>
                                    </tr>
                                    <tr>
                                        <td>Trẻ em</td>
                                        <td class="t-price text-right" id="ChildrenPrice"><%=tc.getSOLUONG_VETREEM()%> x <%=giaVeChildString%>₫</td>
                                    </tr>
                                    <tr>
                                        <td>Số lượng</td>
                                        <td><span class="fal fa-users" id="AmoutPerson" style="color: #2d4271; font-weight: 600;font-size: 17px;"><%=tc.getSOLUONG()%> người</span>
                                            <p class="add-more"style="font-size: 12px;" ><span id="AmoutAdult"><%=tc.getSOLUONG_VENGUOILON()%> người lớn</span> <span id="AmoutChild"><%=tc.getSOLUONG_VETREEM()%> trẻ em</span></p></td>
                                    </tr>


                                    <tr>
                                        <td>Tổng cộng</td>

                                        <td class="t-price text-right" id="tongcong"><span><%=tongTienString%></span><span>₫</span></td>
                                    </tr>

                                    <tr class="pt hardCode" id="promotiontitle">
                                        <td>Khuyến mãi</td>
                                        <td class="t-price text-right" id="GiaTriKhuyenMai"><span><%=voucherValue%></span><span>%</span></td>
                                    </tr>
                                    <td>Tiền khuyến mãi</td>
                                    <td class="t-price text-right" id="TienKhuyenMai"><span>-</span><span><%=tienKhuyenMaiString%></span><span>₫</span></td>
                                    </tr>

                                    <tr id="promotiontitletotal" style="display:none">
                                        <td>Thành tiền</td>
                                        <td class="t-price text-right" id="PromotionTotalPrice"></td>
                                    </tr>
                                    <tr style="display:none">
                                        <td id="discountTitle">noidia</td>
                                        <td id="discountPrice"></td>
                                    </tr>




                                    <tr class="total">
                                        <td style="color: #2d4271; font-weight: 600;font-size: 20px;">Thành Tiền</td>
                                        <td class="t-price text-right" id="TotalPrice" style="color: red; font-weight: 600;font-size: 18px;"><span><%=thanhTienString%></span><span>₫</span></td>
                                        <td class="t-price text-right" style="display: none;" id="TotalPricetemp">2490000</td>
                                        <td class="t-price text-right" style="display: none;" id="TotalOptionPrice"> 0</td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div>

                                </div>
                            </div>




                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>


  <%@include file="./components/footer.jsp"%>


    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="./assets/js/jquery-3.6.0.min.js"></script>
    <script src="./assets/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/chain_fade.js"></script>
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/swiper-bundle.min.js"></script>
    <script src="./assets/js/jquery.fancybox.min.js"></script>
    <script src="./assets/js/select2.min.js"></script>
    <script src="./assets/js/jquery-ui.js"></script>

    <script src="./assets/js/main.js"></script>
    <script>
        const hadCard = $('#hadCard');
        const Password = $('#Password')[0];
        const rePassword = $('#rePassword')[0];
        const nameCard = $('#nameCard')[0];
        const numberCard = $('#numberCard')[0];
        const cardExpiredDate = $('#cardExpiredDate')[0];
        const cardList = $('#card-list');
        const btn = $('#btn')[0];
        const checkFullInput = $('#checkFullInput')[0];
        const checkPassword = $('#checkPassword')[0];
        check()
       function check(){
           if(hadCard.find(":selected").val()!=="0"&&Password.value ===rePassword.value&&Password.value!==""||nameCard.value!==''&&numberCard.value!==''&&cardExpiredDate.value!==''&&cardList.find(":selected").val()!=="0"&&Password.value ===rePassword.value&&Password.value!==""){
             btn.disabled = false;
               checkFullInput.style.display = 'none';
               checkPassword.style.display = 'none';
           }else{
               btn.disabled = true;
               checkFullInput.style.display = 'block';
               checkPassword.style.display = 'block';
           }
       }

        hadCard.on('change' , function (e) {check()})
        cardList.on('change' , function (e) {check()})
        nameCard.oninput = () =>{check()}
        numberCard.oninput = () =>{check()}
        Password.oninput = () =>{check()}
        rePassword.oninput = () =>{check()}
        cardExpiredDate.oninput = () =>{check()}
    </script>
</body>

</html>