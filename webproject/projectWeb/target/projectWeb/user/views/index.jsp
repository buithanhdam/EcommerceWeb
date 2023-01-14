<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.Set" %>
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


    <%@include file="./components/IndexHeader.jsp"%>

<%

        List<Tour> popularTourList = (List<Tour>) request.getAttribute("popularTourList") ==null?null:(List<Tour>) request.getAttribute("popularTourList");
        List<Destination> desList = (List<Destination>) request.getAttribute("desList") ==null?null:(List<Destination>) request.getAttribute("desList");
    List<Tour> incomTourList = (List<Tour>) request.getAttribute("incomTourList") == null?null: (List<Tour>) request.getAttribute("incomTourList");
    Map<Integer,List<Tour>> voucherTourList = (Map<Integer, List<Tour>>) request.getAttribute("voucherTourList") ==null?null:(Map<Integer, List<Tour>>) request.getAttribute("voucherTourList");
        List<User> guideList = (List<User>) request.getAttribute("guideList") ==null?null:(List<User>) request.getAttribute("guideList");
        List<Blog> blogList =(List<Blog>) request.getAttribute("blogList") ==null?null:(List<Blog>) request.getAttribute("blogList");
%>
    <div class="hero-area hero-style-four">

        <img src="./assets/images/banner/banner-plane.svg" class="img-fluid banner-plane">
        <img src="./assets/images/banner/banner-star1.svg" class="banner-star1" alt="">
        <img src="./assets/images/banner/banner-star2.svg" class="banner-star2" alt="">
        <img src="./assets/images/banner/banner-star3.svg" class="banner-star3" alt="">
        <div class="hero-main-wrapper position-relative">
            <div class="swiper hero-slider-four">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <div class="slider-bg-1">
                            <div class="container">
                                <div class="row d-flex justify-content-lg-start justify-content-center align-items-center">
                                    <div class="col-xl-7 col-lg-7">
                                        <div class="hero4-content">
                                            <h1>HÃY BẮT ĐẦU HÀNH TRÌNH CỦA BẠN CÙNG TRAVELLAB</h1>
                                            <p>Hãy cùng TRAVELLAB đi du lịch khắp đất nước Việt Nam</p>
<%--                                            <a href="#" class="button-fill-primary">ĐI THÔI NÀO !</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="slider-bg-2">
                            <div class="container">
                                <div class="row d-flex justify-content-lg-start justify-content-center align-items-center">
                                    <div class="col-xl-7 col-lg-7">
                                        <div class="hero4-content">
                                            <h1>THƯỞNG THỨC NHỮNG NGÀY NGHỈ CỦA BẠN CÙNG TRAVELLAB</h1>
                                            <p>Hãy cùng TRAVELLAB đi du lịch khắp đất nước Việt Nam</p>
<%--                                            <a href="#" class="button-fill-primary">BẮT ĐẦU NÀO !</a>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="slider-arrows text-center d-lg-flex flex-column d-none gap-5">
                <div class="hero-prev3" tabindex="0" role="button" aria-label="Previous slide"> <i class="bi bi-arrow-left"></i></div>
                <div class="hero-next3" tabindex="0" role="button" aria-label="Next slide"><i class="bi bi-arrow-right"></i></div>
            </div>
        </div>
    </div>


    <div class="searchbar-section home4">
        <div class="container">
            <div class="multi-main-searchber">
                <form action="/projectWeb_war/user/views/doSearchWithFilter" method="post" id="main_searchbar">
                    <div class="row g-4">
                        <div class="col-lg-10">
                            <div class="row gx-0 gy-4">
                                <div class="col-lg-3 col-md-6">
                                    <div class="search-box-single destination-box">
                                        <div class="searchbox-icon">
                                            <i class="bi bi-geo-alt"></i>
                                        </div>
                                        <div class="searchbox-input">
                                            <label for="deatination_drop">Điểm Đến</label>
                                            <select data-placeholder="Bạn Muốn Đi Đâu?" name="searchDiaDiem" id="deatination_drop">

                                                <%
                                                    for (Destination d:
                                                         desList) {

                                                    %>
                                                <option value="<%=d.getDiaDiem_ID()%>" ><%=d.getTenDiaDiem()%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="search-box-single type-box">
                                        <div class="searchbox-icon">
                                            <i class="bi bi-text-paragraph"></i>
                                        </div>
                                        <div class="searchbox-input">
                                            <label for="activity-dropdown">Loại Hình Du Lịch</label>
                                            <select class="defult-select-drowpown" name="searchCategory" data-placeholder="Tất Cả Hoạt Động" id="activity-dropdown">
                                                <option value="" >Chọn hạng mục</option>
                                                <option value="Phiêu Lưu" >Phiêu Lưu</option>
                                                <option value="Du Lịch" >Du Lịch</option>
                                                <option value="Du Lịch Đôi">Du Lịch Đôi</option>
                                                <option value="Du Lịch Đơn Thân" >Du Lịch Đơn Thân</option>
                                                <option value="Tuần Trăng Mật" >Tuần Trăng Mật</option>
                                                <option value="Bãi Biển" >Bãi Biển</option>
                                                <option value="Thám Hiểm Núi" >Thám Hiểm Núi</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="search-box-single type-box">
                                        <div class="searchbox-icon">
                                            <i class="bi bi-person-plus"></i>
                                        </div>
                                        <div class="searchbox-input">
                                            <label for="person-dropdown">Số Người</label>
                                            <input type="number" id="person-dropdown" name="searchPersons" placeholder="Nhập số lượng người">
                                            <%--                                        <select class="defult-select-drowpown" name="persons" id="person-dropdown">--%>
                                            <%--                                            <option selected value="0">01</option>--%>
                                            <%--                                            <option value="1">02</option>--%>
                                            <%--                                            <option value="2">03</option>--%>
                                            <%--                                            <option value="3">04</option>--%>
                                            <%--                                            <option value="4">05</option>--%>
                                            <%--                                        </select>--%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-3 col-md-6">
                                    <div class="search-box-single date-box">
                                        <div class="searchbox-icon">
                                            <i class="bi bi-capslock"></i>
                                        </div>
                                        <div class="searchbox-input date-picker-input">
                                            <label >Ngày Đi</label>
                                            <input placeholder="Hãy chọn ngày đi" type="date" name="searchDate"  >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                            <div class="main-form-submit">
                                <input style="display: none" type="text" name="searchText">
                                <input  style="display: none" type="text" name="searchDay"><input style="display: none" type="text" name="searchPrice">

                                <button type="submit">Tìm Ngay</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="package-area package-style-two pt-110 chain">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-10">
                    <div class="section-head-alpha text-center mx-auto">
                        <h2>Các Tour Phổ Biến</h2>
                        <p>Dưới đây là các tour phố biến nhất trong những ngày tháng vừa qua.</p>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-content-center g-4">
                <%
                    for (Tour pt :
                            popularTourList) {
                        Date curDate = new Date(System.currentTimeMillis());
                        float giaVe= pt.getGiaVe();
                        Locale locale = new Locale("vi");
                        NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                        String giaVeString = format.format(giaVe).split(",")[0];

//                        long dateLong = curDate.getTime()-pt.getNgayTao().getTime();
                        long dateLong = pt.getNgayKetThuc().getTime()-pt.getNgayKhoiHanh().getTime();
                        String dateString = ""+dateLong;
                        int dem = Integer.parseInt(dateString.substring(0,1));
                        int ngay = dem+1;

                %>
                <div class="col-lg-4 col-md-6 col-sm-10">
                    <div class="package-card-delta">
                        <div class="package-thumb">
                            <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=pt.getTour_id()%>"><img src="<%="../.."+pt.getImageURL()%>" alt=""></a>
                            <p class="card-lavel">
                                <i class="bi bi-clock"></i> <span><%=ngay%> Ngày và <%=dem%> Đêm</span>
                            </p>
                        </div>
                        <div class="package-card-body">
                            <h3 class="p-card-title"><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=pt.getTour_id()%>"><%=pt.getTourName()%></a></h3>
                            <div class="p-card-bottom">
                                <div class="book-btn">
                                    <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=pt.getTour_id()%>">Đặt Ngay <i class='bx bxs-right-arrow-alt'></i></a>
                                </div>
                                <div class="p-card-info">
                                    <span>Số còn nhận <span style="color: var(--c-primary);"><%=pt.getSoLuong()%></span></span>
                                    <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               <%}%>
            </div>
            <div class="package-page-btn text-center mt-60">
                <a href="/projectWeb_war/user/views/tour" class="button-fill-primary">Xem Tất Cả</a>
            </div>
        </div>
    </div>


    <div class="destination-area destination-style-two pt-110 pb-110">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-10">
                    <div class="section-head-alpha text-center mx-auto">
                        <h2>Điểm đến hàng đầu</h2>
                        <p>Dưới đây là những điểm đến hàng đầu hot nhất những ngày vừa qua.</p>
                    </div>
                </div>
            </div>
            <div class="row d-flex justify-content-center g-4">
                <%
                    for (int i = 0; i < desList.size(); i++) {


                %>
                <div class="<%=i==0||i==5?"col-lg-6 col-md-12 col-sm-10":"col-lg-3 col-md-6 col-sm-10"%>">
                    <div class="destination-item">
                        <div class="destination-img">
                            <img style="width: 630px; height: 280px;" src="<%=desList.get(i).getImageURL()%>" alt="">
                        </div>
                        <div class="destination-overlay">
                            <div class="content">
                                <a href="/projectWeb_war/user/views/doSearchWithFilter?searchDiaDiem=<%=desList.get(i).getDiaDiem_ID()%>">
                                    <h5><%=desList.get(i).getTenDiaDiem()%></h5>
                                </a>
                                <a href="/projectWeb_war/user/views/doSearchWithFilter?searchDiaDiem=<%=desList.get(i).getDiaDiem_ID()%>">
                                    <h6><%=desList.get(i).getSoluong()%> Địa điểm du lịch</h6>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <% if (i==5) break;}%>

            </div>
        </div>
    </div>


    <div class="upcoming-tour-area pt-110 pb-110 chain">
        <div class="container">
            <div class="row d-flex justify-content-center align-items-center">
                <div class="col-lg-5 d-flex justify-content-lg-start justify-content-center">
                    <div class="section-head-alpha text-lg-start text-center">
                        <h2 class="text-white">Chuyến tham quan tốt nhất sắp tới</h2>
                        <p class="text-white"></p>
                    </div>
                </div>
                <div class="col-lg-7 d-flex justify-content-lg-end justify-content-center">
                    <div class="slider-arrows text-center d-lg-flex flex-row justify-content-center d-none gap-5">
                        <div class="testi-prev4" tabindex="0" role="button" aria-label="Previous slide"><i class="bi bi-arrow-left"></i></div>
                        <div class="testi-next4" tabindex="0" role="button" aria-label="Next slide"><i class="bi bi-arrow-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-center">
                <div class="col-lg-12">
                    <div class="swiper upcoming-tour">
                        <div class="swiper-wrapper">
                            <% for (Tour inct:
                                    incomTourList) {
                                Date curDate = new Date(System.currentTimeMillis());
                                float giaVe= inct.getGiaVe();
                                Locale locale = new Locale("vi");
                                NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                String giaVeString = format.format(giaVe).split(",")[0];
                                long dateLong = inct.getNgayKetThuc().getTime()-inct.getNgayKhoiHanh().getTime();
                                String dateString = ""+dateLong;
                                int dem = Integer.parseInt(dateString.substring(0,1));
                                int ngay = dem+1;
                            %>
                            <div class="swiper-slide">
                                <div class="package-card-delta">
                                    <div class="package-thumb">
                                        <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=inct.getTour_id()%>"><img src="<%="../.."+inct.getImageURL()%>" alt=""></a>
                                        <p class="card-lavel">
                                            <i class="bi bi-clock"></i> <span><%=ngay%> Ngày và <%=dem%> Đêm</span>
                                        </p>
                                    </div>
                                    <div class="package-card-body">
                                        <h3 class="p-card-title"><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=inct.getTour_id()%>"><%=inct.getTourName()%></a></h3>
                                        <div class="p-card-bottom">
                                            <div class="book-btn">
                                                <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=inct.getTour_id()%>">Đặt Ngay <i class='bx bxs-right-arrow-alt'></i></a>
                                            </div>
                                            <div class="p-card-info">
                                                <span>Số còn nhận <span style="color: var(--c-primary);"><%=inct.getSoLuong()%></span></span>
                                                <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                            </div>
                                        </div>
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


    <div class="package-area offer-package-style-one pt-110 pb-110">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-10">
                    <div class="section-head-alpha text-center mx-auto">
                        <h2>Ưu Đãi Phút Chót</h2>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="offer-switch-button3">
                    <% Set<Integer> set = voucherTourList.keySet();
                        Object[] setArr = set.toArray();
                    %>
                    <ul class="nav nav-pills mb-3 justify-content-center gap-sm-4 gap-3" id="pills-tab" role="tablist">
                        <%
                            for (int i = 0; i < set.size(); i++){

                            %>

                            <%if (i==0){%>
                                                <li class="nav-item" role="presentation">
                                                    <button class="nav-link active" id="pills-offer<%=i+1%>" data-bs-toggle="pill" data-bs-target="#pills-offer-tab<%=i+1%>" type="button" role="tab" aria-controls="pills-offer-tab<%=i+1%>" aria-selected="true"><%=setArr[i]%>%</button>
                                                </li>
                            <%}else{%>
                            <li class="nav-item" role="presentation">
                               <button class="nav-link" id="pills-offer<%=i+1%>" data-bs-toggle="pill" data-bs-target="#pills-offer-tab<%=i+1%>" type="button" role="tab" aria-controls="pills-offer-tab<%=i+1%>" aria-selected="false"><%=setArr[i]%>%</button>
                            </li>
                            <%}%>

                        <%}%>
<%--                        <li class="nav-item" role="presentation">--%>
<%--                            <button class="nav-link active" id="pills-offer1" data-bs-toggle="pill" data-bs-target="#pills-offer-tab1" type="button" role="tab" aria-controls="pills-offer-tab1" aria-selected="true">40%</button>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item" role="presentation">--%>
<%--                            <button class="nav-link" id="pills-offer2" data-bs-toggle="pill" data-bs-target="#pills-offer-tab2" type="button" role="tab" aria-controls="pills-offer-tab2" aria-selected="false">20%</button>--%>
<%--                        </li>--%>
<%--                        <li class="nav-item" role="presentation">--%>
<%--                            <button class="nav-link" id="pills-offer3" data-bs-toggle="pill" data-bs-target="#pills-offer-tab3" type="button" role="tab" aria-controls="pills-offer-tab3" aria-selected="false">60%</button>--%>
<%--                        </li>--%>

                    </ul>
                </div>
                <div class="offer-single-tabs">
                    <div class="tab-content" id="pills-tabContent">
                        <%
                            for (int i = 0; i < setArr.length; i++){

                        %>

                        <%if (i==0){%>
                        <div class="tab-pane fade show active" id="pills-offer-tab<%=i+1%>" role="tabpanel" aria-labelledby="pills-offer<%=i+1%>">
                            <div class="row d-flex justify-content-center g-4">
                                <%
                                    for (Tour vt:
                                         voucherTourList.get(setArr[i])) {
                                        float giaVe= vt.getGiaVe();
                                        Locale locale = new Locale("vi");
                                        NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                        String giaVeString = format.format(giaVe).split(",")[0];
                                        long dateLong = vt.getNgayKetThuc().getTime()-vt.getNgayKhoiHanh().getTime();
                                        String dateString = ""+dateLong;
                                        int dem = Integer.parseInt(dateString.substring(0,1));
                                        int ngay = dem+1;
                                    %>
                                <div class="col-lg-4 col-md-6">
                                    <div class="package-card-delta">
                                        <div class="package-thumb">
                                            <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>"><img src="<%="../.."+vt.getImageURL()%>" alt=""></a>
                                            <p class="card-lavel">
                                                <i class="bi bi-clock"></i> <span><%=ngay%> Ngày và <%=dem%> Đêm</span>
                                            </p>
                                        </div>
                                        <div class="package-card-body">
                                            <h3 class="p-card-title"><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>"><%=vt.getTourName()%></a></h3>
                                            <div class="p-card-bottom">
                                                <div class="book-btn">
                                                    <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>">Đặt Ngay <i class='bx bxs-right-arrow-alt'></i></a>
                                                </div>
                                                <div class="p-card-info">
                                                    <span>Số còn nhận <span style="color: var(--c-primary);"><%=vt.getSoLuong()%></span></span>
                                                    <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%}%>

                            </div>
                            <div class="package-page-btn text-center mt-60">
                                <a href="package-sidebar.jsp" class="button-fill-primary">Xem Tất Cả</a>
                            </div>
                        </div>
                        <%}else{%>
                        <div class="tab-pane fade" id="pills-offer-tab<%=i+1%>" role="tabpanel" aria-labelledby="pills-offer<%=i+1%>">
                            <div class="row d-flex justify-content-center g-4">
                                <% for (Tour vt:
                                voucherTourList.get(setArr[i])) {
                                float giaVe= vt.getGiaVe();
                                Locale locale = new Locale("vi");
                                NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                String giaVeString = format.format(giaVe).split(",")[0];
                                long dateLong = vt.getNgayKetThuc().getTime()-vt.getNgayKhoiHanh().getTime();
                                String dateString = ""+dateLong;
                                int dem = Integer.parseInt(dateString.substring(0,1));
                                int ngay = dem+1;
                                %>
                                <div class="col-lg-4 col-md-6">
                                    <div class="package-card-delta">
                                        <div class="package-thumb">
                                            <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>"><img src="<%="../.."+vt.getImageURL()%>" alt=""></a>
                                            <p class="card-lavel">
                                                <i class="bi bi-clock"></i> <span><%=ngay%> Ngày và <%=dem%> Đêm</span>
                                            </p>
                                        </div>
                                        <div class="package-card-body">
                                            <h3 class="p-card-title"><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>"><%=vt.getTourName()%></a></h3>
                                            <div class="p-card-bottom">
                                                <div class="book-btn">
                                                    <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=vt.getTour_id()%>">Đặt Ngay <i class='bx bxs-right-arrow-alt'></i></a>
                                                </div>
                                                <div class="p-card-info">
                                                    <span>Số còn nhận <span style="color: var(--c-primary);"><%=vt.getSoLuong()%></span></span>
                                                    <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%}%>

                            </div>
                            <div class="package-page-btn text-center mt-60">
                                <a href="package-sidebar.jsp" class="button-fill-primary">Xem Tất Cả</a>
                            </div>
                        </div>
                        <%}%>

                        <%}%>



                    </div>
                </div>
            </div>
        </div>
    </div>


<%--    <div class="testimonial-area testimonial-style-three pt-110 pb-110">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row d-flex justify-content-center align-items-center">--%>
<%--                <div class="col-lg-5 col-sm-10">--%>
<%--                    <div class="section-head-alpha text-lg-start text-center">--%>
<%--                        <h2 class="text-white">Đánh Giá Về Chúng Tôi</h2>--%>
<%--                        <p class="text-white"></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-6 col-sm-10 d-flex justify-content-end">--%>
<%--                    <div class="slider-arrows text-center d-lg-flex flex-row d-none gap-5">--%>
<%--                        <div class="testi-prev4" tabindex="0" role="button" aria-label="Previous slide"> <i class="bi bi-arrow-left"></i></div>--%>
<%--                        <div class="testi-next4" tabindex="0" role="button" aria-label="Next slide"><i class="bi bi-arrow-right"></i></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="row align-items-center justify-content-center">--%>
<%--                <div class="col-lg-12">--%>
<%--                    <div class="swiper testimonial-slider-three">--%>
<%--                        <div class="swiper-wrapper">--%>
<%--                            <div class="swiper-slide">--%>
<%--                                <div class="testimonial-card-beta mx-auto">--%>
<%--                                    <div class="testimonial-quote-icon">--%>
<%--                                        <img src="./assets/images/icons/quote-review.svg" class="img-fluid" />--%>
<%--                                    </div>--%>
<%--                                    <div class="testimonial-card-body">--%>
<%--                                        <div class="testimonial-info">--%>
<%--                                            <div class="reviewr-info">--%>
<%--                                                <div class="single-thumb">--%>
<%--                                                    <img src="./assets/images/reviewer/testi31.png" alt="">--%>
<%--                                                </div>--%>
<%--                                                <div class="reviwer-info-cotn">--%>
<%--                                                    <h5 class="reviewer-name">Dương Mạnh Hùng</h5>--%>
<%--                                                    <ul class="reviewer-rating gap-2">--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="review-texts">--%>
<%--                                            <p>--%>
<%--                                                Đội ngũ tuyệt vời, các giải pháp hiệu quả giúp tối ưu hóa tìm kiếm được xếp hạng cao và xây dựng thương hiệu hấp dẫn. Điều hành khách du lịch của chúng tôi và tôi rất hài lòng và đã là một khách hàng.--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="swiper-slide">--%>
<%--                                <div class="testimonial-card-beta mx-auto">--%>
<%--                                    <div class="testimonial-quote-icon">--%>
<%--                                        <img src="./assets/images/icons/quote-review.svg" class="img-fluid" />--%>
<%--                                    </div>--%>
<%--                                    <div class="testimonial-card-body">--%>
<%--                                        <div class="testimonial-info">--%>
<%--                                            <div class="reviewr-info">--%>
<%--                                                <div class="single-thumb">--%>
<%--                                                    <img src="./assets/images/reviewer/testi32.png" alt="">--%>
<%--                                                </div>--%>
<%--                                                <div class="reviwer-info-cotn">--%>
<%--                                                    <h5 class="reviewer-name">Nguyễn Thanh Thảo</h5>--%>
<%--                                                    <ul class="reviewer-rating gap-2">--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="review-texts">--%>
<%--                                            <p>--%>
<%--                                                Đội ngũ tuyệt vời, các giải pháp hiệu quả giúp tối ưu hóa tìm kiếm được xếp hạng cao và xây dựng thương hiệu hấp dẫn. Điều hành khách du lịch của chúng tôi và tôi rất hài lòng và đã là một khách hàng.--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                            <div class="swiper-slide">--%>
<%--                                <div class="testimonial-card-beta mx-auto">--%>
<%--                                    <div class="testimonial-quote-icon">--%>
<%--                                        <img src="./assets/images/icons/quote-review.svg" class="img-fluid" />--%>
<%--                                    </div>--%>
<%--                                    <div class="testimonial-card-body">--%>
<%--                                        <div class="testimonial-info">--%>
<%--                                            <div class="reviewr-info">--%>
<%--                                                <div class="single-thumb">--%>
<%--                                                    <img src="./assets/images/reviewer/testi33.png" alt="">--%>
<%--                                                </div>--%>
<%--                                                <div class="reviwer-info-cotn">--%>
<%--                                                    <h5 class="reviewer-name">Trần Nhật Trường</h5>--%>
<%--                                                    <ul class="reviewer-rating gap-2">--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                        <li>--%>
<%--                                                            <i class="bi bi-star-fill"></i>--%>
<%--                                                        </li>--%>
<%--                                                    </ul>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="review-texts">--%>
<%--                                            <p>--%>
<%--                                                Đội ngũ tuyệt vời, các giải pháp hiệu quả giúp tối ưu hóa tìm kiếm được xếp hạng cao và xây dựng thương hiệu hấp dẫn. Điều hành khách du lịch của chúng tôi và tôi rất hài lòng và đã là một khách hàng.--%>
<%--                                            </p>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


    <div class="guide-area guide-style-one pt-110">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-head-alpha" style="text-align: center; max-width: 100%;">
                        <h2>Hướng Dẫn Viên Du Lịch</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <% for (User guide:
                        guideList) {

                %>
                <div class="col-lg-4 col-md-6">
                    <div class="guide-card-gamma">
                        <div class="guide-image">
                            <img src="<%="../.."+guide.getImageURL()%>" alt="">
                            <ul class="guide-social-links">
                                <li><a href="#"><i class='bx bxl-instagram'></i></a></li>
                                <li><a href="#"><i class='bx bxl-facebook'></i></a></li>
                                <li><a href="#"><i class='bx bxl-twitter'></i></a></li>
                            </ul>
                           <div class="contact-lavel">
                                <a href="/projectWeb_war/user/views/contact?guideId=<%=guide.getUser_Id()%>">Liên hệ</a>
                            </div>
                        </div>
                        <div class="guide-content">
                            <h4 class="guide-name"><%=guide.getFullName()%>
                            </h4>
                            <h6 class="guide-designation">Người hướng dẫn</h6>
                        </div>
                    </div>
                </div>
               <%}%>
            </div>
        </div>
    </div>


    <div class="blog-area blog-style-two pt-110 pb-110">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-sm-10">
                    <div class="section-head-alpha text-center mx-auto">
                        <h2>Bài Viết Gần Đây</h2>
                        <p>Những chuyến du lịch hành trình khám phá của chúng tôi tất cả đều ở đây.</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <% for (Blog b:
                        blogList) {

                 %>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-card-gamma">
                        <div class="blog-thumb">
                            <a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>">
                            <img src="<%="../.."+b.getImageURL()%>" alt="">
                            </a>
                          
                        </div>
                        <div class="blog-content">
                            <div class="blog-body-top">
                                <a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>" class="blog-writer"><i class="bi bi-person-circle"></i> Bởi <%=b.getFullName()%> </a>
                                <a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>" class="blog-comments"><i class="bi bi-calendar3"></i> <%=b.getNgayVietBai().toString()%></a>
                            </div>
                            <h4 class="blog-title"><a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>"><%=b.getBLOG_TITLE()%>.</a></h4>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </div>


<%--    <div class="more-update-section">--%>
<%--        <div class="container">--%>
<%--            <div class="row d-flex justify-content-center align-items-center gy-5">--%>
<%--                <div class="col-lg-6 text-lg-start text-center">--%>
<%--                    <div class="more-update-content">--%>
<%--                        <h2>HÃY THAM GIA VỚI CHÚNG TÔI ĐỂ ĐƯỢC CẬP NHẬT THÊM</h2>--%>
<%--                        <p></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="col-lg-3 text-lg-end text-center">--%>
<%--                    <button class="button-fill-primary update-btn">Tham Gia Ngay</button>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>


<%@include file="./components/footer.jsp" %>


    <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
    <script src="./assets/js/jquery-3.6.0.min.js"></script>
    <script src="./assets/js/chain_fade.js"></script>
    <script src="./assets/js/bootstrap.bundle.min.js"></script>
    <script src="./assets/js/owl.carousel.min.js"></script>
    <script src="./assets/js/swiper-bundle.min.js"></script>
    <script src="./assets/js/jquery.fancybox.min.js"></script>
    <script src="./assets/js/select2.min.js"></script>
    <script src="./assets/js/jquery-ui.js"></script>

    <script src="./assets/js/main.js"></script>
    <script src="./assets/js/custom-swiper.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
</body>

</html>