<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >

<head>
    <title>TravelLab - Khám phá đất nước của chúng ta</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="./assets/images/favicon.png" type="image/gif" sizes="20x20">

    <link rel="stylesheet" href="./assets/css/select2.min.css">

    <link rel="stylesheet" href="./assets/css/jquery.fancybox.min.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="./assets/css/swiper-bundle.min.css">

    <link rel="stylesheet" href="./assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="./assets/css/animate.min.css">

    <link rel="stylesheet" href="./assets/css/style.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
</head>

<body>

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
                <h2 class="breadcrumb-title">Chi tiết Gói Du Lịch</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Du Lịch</li>
                    <li class="breadcrumb-item active">Chi tiết Gói Du Lịch</li>
                </ul>
            </div>
        </div>
    </div>
<%
    boolean isLike =(boolean) request.getAttribute("isLike");
    User currentUser = (User) session.getAttribute("auth");
    List<Tour> ranList = (List<Tour>) request.getAttribute("tourrandom");
    TourPackage tp = (TourPackage) request.getAttribute("tourdetail");
    TourDetail td = tp.getTourDetail();
        long dateLong = td.getNgayKetThuc().getTime() - td.getNgayKhoiHanh().getTime();
        String dateString = ""+dateLong;
        int ngay = Integer.parseInt(dateString.substring(0,1))+1;
     Destination destination = tp.getDestination();
     List<TourDetailDays> dayList = tp.getDayList();
     List<TourDetailImages> imageList = tp.getImageList();
     List<TourDetailType> typeList = tp.getTypeList();
     List<Review> reviewList = tp.getReviewList();
     List<TourGuide> guideList = tp.getGuideList();
     List<Voucher> voucherList = tp.getVoucherList();
%>
    <%Map<String,Double> map = new HashMap<String,Double>();
        map.put("Chất lượng",0.0);
        map.put("Thoải mái",0.0);
        map.put("Lòng hiếu khách",0.0);
        map.put("Đồ Ăn",0.0);


        for (Review r:
                reviewList) {
            if (map.containsKey(r.getCategory())){
                double oldPoint = map.get(r.getCategory()) ;
                double newPoint = oldPoint==0.0?r.getStars() :(oldPoint + r.getStars())/2;
                map.replace(r.getCategory(),newPoint);
            }

        }
        Set<String> set = map.keySet();
        int count = set.size();
        double countvalue = 0;
        for (String st:
                set) {
            countvalue += map.get(st);
        }
        double result = countvalue/count;
    %>
    <div class="package-details-wrapper pt-76">
        <div class="container">
            <div class="row ">
                <div class="col-lg-8">
                    <div class="tour-package-details">
                        <div class="pd-header">
                            <div class=" pd-top row row-cols-lg-4 row-cols-md-2 row-cols-2 gy-4">
                                <div class="col">
                                    <div class="pd-single-info">
                                        <div class="info-icon">
                                            <img src="./assets/images/icons/pd1.svg" alt="">
                                        </div>
                                        <div class="info">
                                            <h6>Thời Gian</h6>
                                            <span><%=ngay%> Ngày</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="pd-single-info">
                                        <div class="info-icon">
                                            <img src="./assets/images/icons/pd2.svg" alt="">
                                        </div>
                                        <div class="info">
                                            <h6>Loại Hình Du Lịch</h6>
                                            <span><%=td.getTOUR_CATEGORY()%></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="pd-single-info">
                                        <div class="info-icon">
                                            <img src="./assets/images/icons/pd3.svg" alt="">
                                        </div>
                                        <div class="info">
                                            <h6>Quy Mô Nhóm</h6>
                                            <span><%=td.getSoLuong()%> Người</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="pd-single-info">
                                        <div class="info-icon">
                                            <img src="./assets/images/icons/pd4.svg" alt="">
                                        </div>
                                        <div class="info">
                                            <h6>Hướng Dẫn Viên</h6>
                                            <span><%=guideList.size()%> Người</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 600px" class="pd-thumb">
                                <img style="height: 100%" src="<%="../.."+td.getImageURL()%>" alt="">
                            </div>
                            <div class="header-bottom">
                                <div class="pd-lavel d-flex justify-content-between align-items-center flex-wrap gap-2">
                                    <h5 class="location"><i class="bi bi-geo-alt"></i> <%=destination.getTenDiaDiem()%></h5>
                                    <ul class="d-flex align-items-center rating">
                                        <% int countStar = (int) Math.floor(result);
                                            int halfStar = (int) Math.ceil(result-countStar);
                                            int emptyStar = 5 - countStar - halfStar;
                                        %>
                                        <% for (int i = 0; i < countStar; i++) {

                                        %>

                                        <li><i class="bi bi-star-fill"></i></li>
                                        <%}%>
                                        <% for (int i = 0; i < halfStar; i++) {

                                        %>
                                        <li><i class="bi bi-star-half"></i></li>
                                        <%}%>
                                        <% for (int i = 0; i < emptyStar; i++) {

                                         %>
                                        <li><i class="bi bi-star"></i></li>
                                        <%}%>




                                    </ul>
                                </div>
                                <div class="pd-lavel d-flex justify-content-between align-items-center flex-wrap gap-2">
                                    <h2 class="pd-title"><%=td.getTourName()%></h2>
                                    <a href="/projectWeb_war/user/views/savedTour?tourId=<%=td.getTOUR_ID()%>" title="<%=isLike==false?"Thêm vào yêu thích":"Xóa khỏi yêu thích"%>" style="<%=isLike==false?"color: black;font-size: 2rem;cursor: pointer;":"color: red;font-size: 2rem;cursor: pointer;"%>"><%if(isLike==true){%><i class='bx bxs-heart'></i><%}else{%><i class='bx bx-heart'></i><%}%></a>
                                </div>
                                <span>Số còn nhận <span style="color: var(--c-primary);"><%=td.getSoLuong()%></span></span>
                            </div>
                        </div>
                        <div class="package-details-tabs">
                            <ul class="nav nav-pills tab-switchers gap-xxl-4 gap-3" id="pills-tab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="pills-package1" data-bs-toggle="pill" data-bs-target="#pill-body1" type="button" role="tab" aria-controls="pill-body1" aria-selected="true"><i class="bi bi-info-lg"></i> Thông Tin</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-package2" data-bs-toggle="pill" data-bs-target="#pill-body2" type="button" role="tab" aria-controls="pill-body2" aria-selected="false"> <i class="bi bi-file-earmark-spreadsheet"></i> Kế Hoạch</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-package3" data-bs-toggle="pill" data-bs-target="#pill-body3" type="button" role="tab" aria-controls="pill-body3" aria-selected="false"><i class="bi bi-images"></i> Hình Ảnh</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="pills-package4" data-bs-toggle="pill" data-bs-target="#pill-body4" type="button" role="tab" aria-controls="pill-body4" aria-selected="false"><i class="bi bi-person-vcard-fill"></i> Hướng Dẫn Viên</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="pills-tabContent">

                                <div class="tab-pane fade show active package-info-tab mt-3" id="pill-body1" role="tabpanel" aria-labelledby="pills-package1">
                                    <h3 class="d-subtitle">Chi tiết du lịch</h3>
                                    <p>
                                        <%=td.getDescription()%>
                                    </p>
                                    <div class="p-info-featured-img row position-relative g-4 row-cols-1 row-cols-sm-2">
                                        <% for (TourDetailImages tdi:
                                                imageList) {

                                         %>
                                        <div class="col">
                                            <div class="featured-img">
                                                <img src="<%="../.."+tdi.getImageURL()%>" alt="">
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                    <table class="table package-info-table mb-0">
                                        <tbody>
                                            <tr>
                                                <th>Địa Điểm</th>
                                                <td><%=destination.getTenDiaDiem()%></td>
                                            </tr>
                                            <tr>
                                                <th>Xuất Phát</th>
                                                <td>Bắt Buộc</td>
                                            </tr>
                                            <tr>
                                                <th>Thời Gian Xuất Phát</th>
                                                <td><%=td.getNgayKhoiHanh()%></td>
                                            </tr>
                                            <tr>
                                                <th>Thời Gian</th>
                                                <td><%=ngay%> Ngày <%=ngay-1%> Đêm</td>
                                            </tr>
<%--                                            <tr>--%>
<%--                                                <th>Đã Bao Gồm</th>--%>
<%--                                                <td>--%>
<%--                                                    <ul class="included-list">--%>
<%--                                                        <li><i class="bi bi-check2"></i> Hướng dẫn song ngữ chuyên ngành</li>--%>
<%--                                                        <li> <i class="bi bi-check2"></i> Phương tiện giao thông tư nhân</li>--%>
<%--                                                        <li><i class="bi bi-check2"></i> Phí tham quan</li>--%>
<%--                                                        <li><i class="bi bi-check2"></i> Bữa trưa, Nước, Bữa tối và Đồ ăn nhẹ</li>--%>
<%--                                                    </ul>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
<%--                                            <tr>--%>
<%--                                                <th>Không Bao Gồm</th>--%>
<%--                                                <td>--%>
<%--                                                    <ul class="excluded-list">--%>
<%--                                                        <li><i class="bi bi-x-lg"></i> Dịch vụ bổ sung</li>--%>
<%--                                                        <li> <i class="bi bi-x-lg"></i> Bảo hiểm</li>--%>
<%--                                                        <li><i class="bi bi-x-lg"></i> Đồ uống</li>--%>
<%--                                                        <li><i class="bi bi-x-lg"></i> Vé</li>--%>
<%--                                                    </ul>--%>
<%--                                                </td>--%>
<%--                                            </tr>--%>
                                            <tr>
                                                <td colspan="2" class="tour-transport-col">
                                                    <div class="tour-transport  d-flex align-items-center justify-content-center"><img src="./assets/images/icons/bus.svg" alt=""> <span>Phương Tiện: <%=td.getPhuongTienDiChuyen()%></span></div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="rating-overview">
                                        <h3 class="d-subtitle">Tổng quan</h3>
                                        <div class="rating-overview-row row g-0">

                                            <div class="col-lg-4 col-md-5 col-sm-5">
                                                <div class="total-rating d-flex justify-content-center align-items-center flex-column h-100 ">
                                                    <h3><%=result%></h3>
                                                    <h5>Điểm Đánh Giá</h5>
                                                </div>
                                            </div>
                                            <div class="col-lg-8 col-md-7 col-sm-7">
                                                <div class="rating-info">
                                                    <% for (String st:
                                                            set) {

                                                    %>
                                                    <div class="rating-box">
                                                        <h6><%=st%><span><%=map.get(st)%></span></h6>
                                                        <div class="rating-bar"></div>
                                                    </div>
                                                    <%}%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="comment-section">
                                        <div class="comment-list" id="group-comment">
                                            <%
                                                for (Review r:
                                                     reviewList) {

                                                %>
                                            <div class="single-comment " style="width: 700px">
                                                <div >
                                                    <div class="commmentor"  >
                                                        <img src="<%=r.getImageURL()==null?"./assets/images/userDefaultImage.png":"../.."+r.getImageURL()%>" alt="" style="width: 145px;height: 145px">
                                                    </div>
                                                    <div class="comment mt-4 mt-sm-0" style="width: 650px">
                                                        <div class="d-flex align-items-center justify-content-between">
                                                            <div class="info">
                                                                <h6><%=r.getFullName()==null?r.getUser_id():r.getFullName()%></h6>
                                                                <span><%=r.getNgayTao()%></span>
                                                            </div>
                                                            <div>
                                                                <ul class="rating d-flex ">
                                                                    <%
                                                                        for (int i = 0; i < r.getStars(); i++) {

                                                                    %>
                                                                    <li><i class="bi bi-star-fill"></i></li>
                                                                    <%}%>
                                                                </ul>
                                                            </div>
                                                        </div>

                                                        <p><%=r.getComment()%></p>

                                                    </div>



                                                </div>

                                            </div>
                                            <%}%>



                                        </div>
                                        <div class="comment-btn text-center" id="show-more-div">
                                            <!-- <span id="show-more-button" style="font-weight: 500;color: var(--c-primary);cursor: pointer;">Xem Thêm Bình Luận</span> -->
                                        </div>
                                    </div>
                                    <form action="/projectWeb_war/user/views/review" id="comment_form" method="post">
                                        <div class="comment-form mt-110">
                                            <h4>Để Lại Đánh Giá Của Bạn</h4>
                                            <div class="row">
                                                <div class="col-lg-6">

                                                    <div class="custom-input-group">
                                                    <select
                                                            id="type"
                                                            name="categoryComment"
                                                    >
                                                        <option value="Chất lượng" >Chất lượng</option>
                                                        <option value="Thoải mái" >Thoải mái</option>
                                                        <option value="Lòng hiếu khách" >Lòng hiếu khách</option>
                                                        <option value="Đồ Ăn" >Đồ Ăn</option>
                                                    </select>
                                                    </div>
                                                </div>
                                                <div class="col-lg-6">

                                                    <div class="custom-input-group">
                                                    <select
                                                            id="typeStar"
                                                            name="starComment"
                                                    >
                                                        <option value="1" >1 Sao</option>
                                                        <option value="2" >2 Sao</option>
                                                        <option value="3" >3 Sao</option>
                                                        <option value="4" >4 Sao</option>
                                                        <option value="5" >5 Sao</option>
                                                    </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <input type="text" style="display: none" name="userIdComment" value="<%=currentUser ==null?"":currentUser.getUser_Id()%>" id="nameComment">

                                            <input type="text" style="display: none" name="tourIdComment" value="<%=td.getTOUR_ID()%>" id="emailComment">
                                            <%Date currentDate = Date.valueOf(LocalDate.now());%>
                                            <input type="date" name="dateComment" style="display: none" value="<%=currentDate.toString()%>">

                                            <div class="custom-input-group">
                                                <textarea cols="20" rows="7" name="Comment" placeholder="Viết Bình Luận"></textarea>
                                            </div>

                                            <div class="custom-input-group">
                                                <div class="submite-btn">
                                                    <button type="submit">Bình Luận</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="tab-pane fade package-plan-tab tab-body mt-3" id="pill-body2" role="tabpanel" aria-labelledby="pills-package2">
                                    <h3 class="d-subtitle">Chi tiết </h3>
                                    <p> <%=td.getDescription()%>
                                    </p>
                                    <div class="accordion plans-accordion" id="planAccordion">
                                        <%
                                            for (int i = 0; i < dayList.size(); i++) {
                                                int index = i;
                                                int currDay = index+1;
                                                String planHead = "planHeading"+currDay;
                                                String planCollapse = "planCollapse"+currDay;

                                            %>
                                        <div class="accordion-item plans-accordion-single">
                                            <div class="accordion-header" id="<%=planHead%>">
                                                <div class="accordion-button" data-bs-toggle="collapse" data-bs-target="#<%=planCollapse%>" aria-expanded="true" role="navigation">
                                                    <div class="paln-index-circle">
                                                        <h4><%=dayList.get(i).getNgay()%></h4>
                                                    </div>
                                                    <div class="plan-title">
                                                        <h5>Ngày <%=dayList.get(i).getNgay()%> : <%=dayList.get(i).getTitle()%></h5>
                                                        <h6>08:00 - 18:00</h6>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="<%=planCollapse%>" class="accordion-collapse collapse show" aria-labelledby="<%=planHead%>" data-bs-parent="#planAccordion">
                                                <div class="accordion-body plan-info">
                                                    <p></p>
                                                    <ul>
                                                        <li><i class="bi bi-check-lg"></i> <%=dayList.get(i).getDescription()%></li>

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                        <%}%>
                                    </div>
                                </div>

                                <div class="tab-pane fade package-gallary-tab mt-3" id="pill-body3" role="tabpanel" aria-labelledby="pills-package3">
                                    <div class="row g-4">
                                        <% for (TourDetailImages tdi:
                                                imageList) {
                                        %>
                                        <div class="col-6">
                                            <div class="package-gallary-item">
                                                <a href="" data-fancybox="gallery" data-caption="Caption Here"><img src="<%="../.."+tdi.getImageURL()%>" alt=""></a>
                                            </div>
                                        </div>
                                        <%}%>

                                    </div>
                                </div>
                                <div class="tab-pane fade package-location-tab mt-3" id="pill-body4" role="tabpanel" aria-labelledby="pills-package4">
                                    <div class="row g-6">
                                        <% for (TourGuide u:
                                                guideList) {

                                         %>
                                        <div class="col-6">
                                            <div class="guide-card-gamma">
                                                <div class="guide-image">
                                                    <img style="width: 340px; height: 370px;" src="<%="../.."+u.getImageURL()%>" alt="">
                                                    <ul class="guide-social-links">
                                                        <li><a href="#"><i class='bx bxl-instagram'></i></a></li>
                                                        <li><a href="#"><i class='bx bxl-facebook'></i></a></li>
                                                        <li><a href="#"><i class='bx bxl-twitter'></i></a></li>
                                                    </ul>
                                                    <div class="contact-lavel">
                                                        <a href="/projectWeb_war/user/views/contact?guideId=<%=u.getUser_id()%>">Liên hệ</a>
                                                    </div>
                                                </div>
                                                <div class="guide-content">
                                                    <h4 class="guide-name"><%=u.getFullName()%></h4>
                                                    <h6 class="guide-designation">Hướng Dẫn Viên Du Lịch</h6>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="package-sidebar">
                        <aside class="package-widget-style-2 widget-form mt-30">
                            <div class="widget-title text-center d-flex justify-content-between">
                                <h4>Giá Từ</h4>
                                <%
                                    TourDetailType tdt1 = new TourDetailType();
                                    for (TourDetailType tdt:
                                            typeList) {
                                        if (tdt.getType() == 1) tdt1 = tdt;
                                    }
                                    float giaVe= tdt1.getGiaVe();
                                    Locale locale = new Locale("vi");
                                    NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                    String giaVeString = format.format(giaVe).split(",")[0];%>
                                <h3 class="widget-lavel"><%=giaVeString%> ₫ <span>1 Người</span></h3>
                            </div>
                            <div class="widget-body">
                                <form action="/projectWeb_war/user/views/TourCart" method="post" id="booking-form">
                                    <div class="booking-form-wrapper">
                                        <input name="tourId" value="<%=td.getTOUR_ID()%>" style="display: none">
                                        <input name="userId" value="<%=currentUser ==null?"":currentUser.getUser_Id()%>" style="display: none">
                                        <div class="custom-input-group">
                                            <div class="submite-btn">
                                                <button type="submit">Đặt Ngay</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                                
                            </div>
                        </aside>
                        <aside class="package-widget-style-2 widget-recent-package-entries mt-30">
                            <div class="widget-title text-center">
                                <h4>Bạn có thể sẽ thích</h4>
                            </div>
                            <div class="widget-body">
                                <ul>
                                    <%
                                        for (Tour tour:
                                             ranList) {
                                            float giaVeRandom= tour.getGiaVe();
                                            Locale localeRandom = new Locale("vi");
                                            NumberFormat formatRandom =  NumberFormat.getCurrencyInstance(locale);
                                            String giaVeStringRandom = format.format(giaVe).split(",")[0];
                                    %>
                                        <li class="package-sm">
                                        <div class="thumb">
                                            <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>">
                                                <img src="<%="../.."+tour.getImageURL()%>" alt="">
                                            </a>
                                        </div>
                                        <div class="info">
                                            <h6><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>"><%=tour.getTourName()%></a></h6>
                                            <div class="price">
                                                <span>Chỉ Từ</span>
                                                <h6><%=giaVeStringRandom%> ₫ <span>1 Người</span></h6>
                                            </div>
                                        </div>
                                    </li>
                                 <%}%>
                                </ul>
                            </div>
                        </aside>
                        
                       
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
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>

    <script>
        jQuery(function () {
            const list = $('#group-comment');
            const listComment = list.children();
            const displayProduct =3;
            const showMoreDiv = $('#show-more-div');
            let page =1 ;
           if (listComment.length ===0) {
            showMoreDiv.append(`
                <span id="show-more-button" style="font-weight: 500;color: var(--c-primary);;">Chưa Có Đánh Giá</span>
            `);   
           }else if (listComment.length <= 3) {
            $('#show-more-button').remove();
                  

           }else {
            showMoreDiv.append(`
                <span id="show-more-button" style="font-weight: 500;color: var(--c-primary);cursor: pointer;">Xem Thêm Đánh Giá</span>
            `); 
           }
              
            
              

          
                 for (let j = 0; j < listComment.length; j++) {
                     listComment[j].classList.add('display-hide');

                    
                };
                
            function displayItem(listComment,list,displayProduct,page) {
                page--;
                for (let j = 0; j < listComment.length; j++) {
                   listComment[j].classList.remove('display-hide');
                    
                }
                for (let j = 0; j < listComment.length; j++) {
                   listComment[j].classList.add('display-hide');
                    
                }
                let loop_end = displayProduct * page;
                let renderItem = listComment.slice(0,loop_end+displayProduct);
                for (let index = 0; index < renderItem.length; index++) {
                    renderItem[index].classList.toggle('display-hide');   
                }
                if (listComment.length === renderItem.length) {
                   $('#show-more-button').remove();
                    showMoreDiv.append(`
                        <span id="show-less-button" style="font-weight: 500;color: var(--c-primary);cursor: pointer;">Thu Gọn Đánh Giá</span>
                    `); 
                    jQuery(function () {
          
                        jQuery("#show-less-button").click(function () {
                           
                            page = 1;
                            $('#show-less-button').remove();
                            showMoreDiv.append(`
                                <span id="show-more-button" style="font-weight: 500;color: var(--c-primary);cursor: pointer;">Xem Thêm Đánh Giá</span>
                             `); 
                             jQuery(function () {
          
                                jQuery("#show-more-button").click(function () {
                                    page++;
                                    displayItem(listComment,list,displayProduct,page);
                                    });
                            });
                            displayItem(listComment,list,displayProduct,page);
                        });
                     });
                }
            };
            displayItem(listComment,list,displayProduct,page);
           
            jQuery(function () {
          
            jQuery("#show-more-button").click(function () {
                page++;
                displayItem(listComment,list,displayProduct,page);
                 });
            });
           

        });
    </script>
</body>

</html>