<%@ page import="vn.edu.hcmuaf.fit.services.BookingService" %>
<%@ page import="vn.edu.hcmuaf.fit.services.TourDetailService" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >

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

<%

    TourDetail tour = (TourDetail) request.getAttribute("tour")==null?null:(TourDetail) request.getAttribute("tour");
    Cart cart = (Cart) session.getAttribute("cart");

    TourCart tc =cart.findTourCartByTourId(userHeader.getUser_Id(),tour.getTOUR_ID());
    List<TourDetailType> tdt = (List<TourDetailType>) request.getAttribute("tdt")==null?null:(List<TourDetailType>) request.getAttribute("tdt");
    List<Voucher> voucher = (List<Voucher>) request.getAttribute("voucher")==null?null:(List<Voucher>) request.getAttribute("voucher");
%>
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
      int sumNum = tc==null?0:tc.getSOLUONG();
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
    <div class="error-wrapper pt-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5">
                    <div class="error-content text-center">
                        <h2>Nhập thông tin khách hàng</h2>
                        <form action="/projectWeb_war/user/views/CEDTourCart" method="post" id="booking-form">
                            <div class="booking-form-wrapper">
                                <div class="custom-input-group">
                                    <input type="text" placeholder="Họ Tên" value="<%=tc==null?"":tc.getHoTen()%>" id="inputFullName" name="bookingFullName">
                                </div>
                                <div class="custom-input-group">
                                    <input type="email" placeholder="Email"  value="<%=tc==null?"":tc.getEmail()%>" id="inputEmail" name="bookingEmail">
                                    <span style="display: none;color: red;font-size: 0.7rem;">Email không hợp lệ</span>
                                </div>
                                <div class="custom-input-group">
                                    <input type="tel" placeholder="Số Điện Thoại" value="<%=tc==null?"":tc.getPhone()%>" id="inputPhone" name="bookingPhone">
                                    <span style="display: none;color: red;font-size: 0.7rem;">Số điện thoại không hợp lệ</span>
                                </div>
                                <div class="custom-input-group">
                                    <input type="text" placeholder="Địa chỉ" value="<%=tc==null?"":tc.getDiaChi()%>" id="inputDiaChi" name="bookingDiachi">
                                </div>
                                <!-- <div class="custom-input-group">
                                    <i class="bi bi-chevron-down"></i>
                                    <select id="ticket_type">
<option selected>Loại Vé</option>
<option value="1">Tickets Type 1</option>
<option value="2">Tickets Type 2</option>
<option value="3">Tickets Type 3</option>
</select>
                                </div> -->
                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="custom-input-group">
                                            <i class="bi bi-chevron-down"></i>
                                            <select id="truist-adult" name="bookingAdultTicket">
                                                <option value="0" <%if (tc ==null||tc.getSOLUONG_VENGUOILON()==0){%>selected <%}%>
                                                >Người Lớn</option>
                                                <option value="1" <%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==1){%>selected <%}%> >1</option>
                                                <option value="2"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==2){%>selected <%}%> >2</option>
                                                <option value="3"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==3){%>selected <%}%> >3</option>
                                                <option value="4" <%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==4){%>selected <%}%>>4</option>
                                                <option value="5"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==5){%>selected <%}%> >5</option>
                                                <option value="6" <%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==6){%>selected <%}%>>6</option>
                                                <option value="7"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==7){%>selected <%}%> >7</option>
                                                <option value="8"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==8){%>selected <%}%> >8</option>
                                                <option value="9" <%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==8){%>selected <%}%>>9</option>
                                                <option value="10"<%if (tc!=null&&tc.getSOLUONG_VENGUOILON()==10){%>selected <%}%> >10</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <div class="custom-input-group ">
                                            <i class="bi bi-chevron-down"></i>
                                            <select id="tourist-child" name="bookingChildTicket">
                                            <option value="0" <%if (tc ==null||tc.getSOLUONG_VETREEM()==0){%>selected <%}%>>Trẻ Em</option>
                                            <option value="1" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==1){%>selected <%}%>>1</option>
                                            <option value="2" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==2){%>selected <%}%>>2</option>
                                            <option value="3" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==3){%>selected <%}%>>3</option>
                                            <option value="4" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==4){%>selected <%}%>>4</option>
                                            <option value="5" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==5){%>selected <%}%>>5</option>
                                            <option value="6" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==6){%>selected <%}%>>6</option>
                                            <option value="7" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==7){%>selected <%}%>>7</option>
                                            <option value="8" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==8){%>selected <%}%>>8</option>
                                            <option value="9" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==9){%>selected <%}%>>9</option>
                                            <option value="10" <%if (tc!=null&&tc.getSOLUONG_VETREEM()==10){%>selected <%}%>>10</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <input name="thanhTien" id="bookingThanhTien" value="<%=thanhTien%>" style="display: none">
                                    <input name="userId" value="<%=userHeader.getUser_Id()%>" style="display: none">
                                <input name="tourId" value="<%=tour.getTOUR_ID()%>" style="display: none">
                                <%Date currentDate = Date.valueOf(LocalDate.now());%>
                                <input type="date" name="bookingDate" style="display: none" value="<%=currentDate.toString()%>">
                                <div class="custom-input-group">
                                    <textarea cols="20" rows="7" id="inputDescription" name="bookingDescription" content="" placeholder="Tin Nhắn"><%=tc==null?"":tc.getDescription()%></textarea>

                                </div>
                                <div class="row">
                                    <span id="checkFullInput" style="display: none;color: red;font-size: 0.7rem;">Bắt buộc phải nhập đầy đủ thông tin</span>

                                    <div class="col-sm-6">
                                        <div class="custom-input-group">
                                            <div class="submite-btn" >
                                                <button type="submit" id="addToCart" name="option" value="addToCart" ><%=tc==null?"Thêm vào giỏ hàng":"Lưu Lại"%></button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-6">
                                        <div class="custom-input-group">
                                            <div class="submite-btn">
                                                <button type="submit"id="goToBookingCard" name="option" value="goToBookingCard" >Tiếp tục</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-5 tour-detail-booking" style="margin-left: 4rem;border: 1px solid #e0e0e0;">
                    <div class="error-content text-center ">
                        <h2>Thông tin chuyến đi</h2>
                        <div class="group-checkout">

                            <p class="package-title">Tour trọn gói <span> (<%=tour.getSoLuong()%> khách)</span></p>
                            <div class="product" style="margin-top: 1rem;">
                            <div class="product-image">
                                <img src="<%=tc==null?"../.."+tour.getImageURL():"../.."+tc.getImageURL()%>" class="img-fluid" alt="image">
                            </div>
                            <div class="product-content">
                            <p class="title" style="color: #2d4271; font-weight: 600;"><%=tc==null?tour.getTourName():tc.getTourName()%></p>
                            </div>
                            </div>
                            <%
                                String[] startDayStringList = tc==null?tour.getNgayKhoiHanh().toString().split("-"):tc.getNgayKhoiHanh().toString().split("-");
                                String startDayString ="Ngày "+ startDayStringList[2]+" Tháng "+startDayStringList[1]+", "+startDayStringList[0];
                                String[] endDayStringList = tc==null?tour.getNgayKetThuc().toString().split("-"):tc.getNgayKetThuc().toString().split("-");
                                String endDayString ="Ngày "+ endDayStringList[2]+" Tháng "+endDayStringList[1]+", "+endDayStringList[0];

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
                                    <td class="t-price text-right" id="AdultPrice"><%=numAdult%> x <%=giaVeAdultString%>₫</td>
                                    </tr>
                                    <tr>
                                    <td>Trẻ em</td>
                                    <td class="t-price text-right" id="ChildrenPrice"><%=numChild%> x <%=giaVeChildString%>₫</td>
                                    </tr>
                                    <tr>
                                        <td>Số lượng</td>
                                        <td><span class="fal fa-users" id="AmoutPerson" style="color: #2d4271; font-weight: 600;font-size: 17px;"><%=sumNum%> người</span>
                                        <p class="add-more"style="font-size: 12px;" ><span id="AmoutAdult"><%=numAdult%> người lớn</span> <span id="AmoutChild"><%=numChild%> trẻ em</span></p></td>
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
        jQuery(function () {
            const adultPrice = $("#AdultPrice");

            const touristAdult = $("#truist-adult");
            const touristChild = $("#tourist-child");

             let numAdult =parseInt(touristAdult.find(":selected").val());
             let numChild = parseInt(touristChild.find(":selected").val());

            const childPrice = $("#ChildrenPrice");
            const sumPerson = $("#AmoutPerson");
            const sumAdult = $('#AmoutAdult');
            const sumChild = $('#AmoutChild');
            const tongcong = $('#tongcong');
            const giaTrivoucher = $('#GiaTriKhuyenMai');
            let voucherValue = parseInt(giaTrivoucher.children()[0].innerText);
            const tienVoucher = $('#TienKhuyenMai');
            const totalPrice = $('#TotalPrice');
            const bookingThanhTien = $('#bookingThanhTien');

            let textInnerA =  adultPrice[0].innerText;
            let textListA= textInnerA.split(" ");
            let textInnerC =  childPrice[0].innerText;
            let textListC= textInnerC.split(" ");

            let childPriceValue =parseInt((textListC[2].split('₫')[0]).split(".").join(""));
            let adultPriceValue =parseInt((textListA[2].split('₫')[0]).split(".").join(""));
            let checkPhone = false;
            let checkEmail = false;
            const checkFullInput = $('#checkFullInput')[0];

            //

            const inputFullName= $('#inputFullName')[0];
            const inputEmail= $('#inputEmail')[0];
            const inputPhone= $('#inputPhone')[0];
            const inputDiaChi= $('#inputDiaChi')[0];
            let goToBookingCard = $('#goToBookingCard')[0];
            let addToCart = $('#addToCart')[0];

            //

           function checkInputValue(){

               if (inputFullName.value!==""&&inputEmail.value !==""&&checkPhone===true&&checkEmail===true&&inputPhone.value!==""&&inputDiaChi.value!==""&&numAdult!==0||numChild!==0){
                    addToCart.disabled  =false;
                    goToBookingCard.disabled  =false;
                    checkFullInput.style.display ="none";

               }else{
                   addToCart.disabled  =true;
                   goToBookingCard.disabled  =true;
                   checkFullInput.style.display ="block";
               }
           }
           checkInputValue();
            inputFullName.oninput = (e) =>{
                checkInputValue();
            }
            inputEmail.oninput = (e) =>{
                let va = e.target.value;
                var regex =/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/g;
                checkEmail = va.match(regex)?true:false;
                let spanChild =e.target.parentNode.querySelector("span");
                if (checkEmail===false){
                    spanChild.style.display = "block";
                }else{
                    spanChild.style.display = "none";
                }
                checkInputValue();
            }
            inputPhone.oninput = (e) =>{
                let va = e.target.value;
                var regex =/(84|0[3|5|7|8|9])+([0-9]{8})\b/g;
                checkPhone = va.match(regex)?true:false;
                let spanChild =e.target.parentNode.querySelector("span");
                if (checkPhone===false){
                    spanChild.style.display = "block";
                }else{
                    spanChild.style.display = "none";
                }
                checkInputValue();
            }
            inputDiaChi.oninput = (e) =>{
                checkInputValue();
            }
            touristAdult.on('change' , function (e) {
                var valueSelected = this.value;
                if (valueSelected === 'Người Lớn') {
                    let textInner =  adultPrice[0].innerHTML;
                    let textList= textInner.split(" ");
                    numAdult = 0;
                    adultPriceValue =0;

                    adultPrice[0].innerHTML = `${numAdult} ${textList[1]} ${textList[2]}`;
                    updateAmount();
                }else{
                   let textInner =  adultPrice[0].innerText;
                    let textList= textInner.split(" ");
                    numAdult = parseInt(valueSelected);
                    adultPriceValue = parseInt((textList[2].split('₫')[0]).split(".").join(""));


                    adultPrice[0].innerText = `${numAdult} ${textList[1]} ${textList[2]}`;
                    updateAmount();
                }

            });

            touristChild.on('change' , function (e) {
                var valueSelected = this.value;
                if (valueSelected === 'Trẻ Em') {
                    let textInner =  childPrice[0].innerText;
                    let textList= textInner.split(" ");
                    numChild = 0;
                    childPriceValue =0;
                    childPrice[0].innerText = `${numChild} ${textList[1]} ${textList[2]}`;
                    updateAmount();
                }else{
                   let textInner =  childPrice[0].innerText;
                    let textList= textInner.split(" ");
                    numChild = parseInt(valueSelected);
                    childPriceValue = parseInt((textList[2].split('₫')[0]).split(".").join(""));
                   
                    childPrice[0].innerText = `${numChild} ${textList[1]} ${textList[2]}`;
                    updateAmount();
                }

            });
            function updateAmount() {
                let ti =  sumPerson[0].innerText;
                let tl= ti.split(" ");
                sumPerson[0].innerText = `${numAdult+numChild} ${tl[1]}`;

                let cti =  sumChild[0].innerText;
                let ctl= cti.split(" ");
                sumChild[0].innerText = `${numChild} ${ctl[1]} ${ctl[2]}`;

                let ati =  sumAdult[0].innerText;
                let atl= ati.split(" ");
                sumAdult[0].innerText = `${numAdult} ${atl[1]} ${atl[2]}`;
               
                let tongcongtien =(numAdult * adultPriceValue)+(numChild* childPriceValue);
                let tongcongtienString = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(parseInt(tongcongtien))

                tongcong.children()[0].innerText = tongcongtienString.split("₫")[0];
                let tongtienkhuyenmai = tongcongtien * (voucherValue/100);
                let thanhtien = tongcongtien -tongtienkhuyenmai;
                let tongtienkhuyenmaiString = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(parseInt(tongtienkhuyenmai))
                let thanhtienString = new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(parseInt(thanhtien))

                tienVoucher.children()[1].innerText = tongtienkhuyenmaiString.split("₫")[0];

                totalPrice.children()[0].innerText = thanhtienString.split("₫")[0];
                bookingThanhTien[0].value = thanhtien;
                checkInputValue();
            }

        })
    </script>
</body>

</html>