<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >

<head>
    <title>TravelLab - Khám phá đất nước của chúng ta</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="../assets/images/favicon.png" type="image/gif" sizes="20x20">

    <link rel="stylesheet" href="../assets/css/select2.min.css">

    <link rel="stylesheet" href="../assets/css/jquery.fancybox.min.css">

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="../assets/css/swiper-bundle.min.css">

    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="../assets/css/animate.min.css">

    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/responsive.css">
</head>

<body>

<% User userHeader = (User) session.getAttribute("auth")==null?null:(User) session.getAttribute("auth");
%>

    <div class="main-searchbar-wrapper">
        <div class="container">
            <div class="multi-main-searchber">
                <div class="main-searchbar-close search-toggle">
                    <i class="bi bi-x-lg"></i>
                </div>
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
                                            <option value="">Bạn Muốn Đi Đâu?</option>
                                            <option value="TPHCM" >Tp.Hồ Chí Minh</option>
                                            <option value="HANOI" >Hà Nội</option>
                                            <option value="NHATRANG">Nha Trang</option>
                                            <option value="DANANG" >Đà Nẵng</option>
                                            <option value="LAMDONG" >Lâm Đồng</option>
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
    <div class="category-sidebar-wrapper">
        <div class="category-sidebar">
            <div class="category-header d-flex justify-content-between align-items-center">
                <h4>Hạng mục</h4>
                <div class="category-toggle">
                    <i class="bi bi-x-lg"></i>
                </div>
            </div>
            <div class="row row-cols-lg-3 row-cols-2 gy-5 mt-3">
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Phiêu lưu">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate1.svg" alt="">
                        </div>
                        <h5>Phiêu Lưu</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Du lịch">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate2.svg" alt="">
                        </div>
                        <h5>Du Lịch</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Du lịch đôi">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate3.svg" alt="">
                        </div>
                        <h5>Du Lịch Đôi</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Du lịch đơn thân">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate4.svg" alt="">
                        </div>
                        <h5>Du Lịch Đơn Thân</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Tuần trăng mật">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate5.svg" alt="">
                        </div>
                        <h5>Tuần Trăng Mật</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Bãi biển">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate6.svg" alt="">
                        </div>
                        <h5>Bãi Biển</h5>
                    </a>
                </div>
                <div class="col">
                    <a class="category-box" href="/projectWeb_war/user/views/categorySearch?searchCategory=Thám hiểm núi">
                        <div class="cate-icon mx-auto">
                            <img src="./assets/images/icons/cate7.svg" alt="">
                        </div>
                        <h5>Thám Hiểm Núi</h5>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <header>
        <div class="header-area header-style-one">
            <div class="container">
                <div class="row">
                    <div class="col-xl-2 col-lg-12 col-md-12 col-sm-12 col-xs-12 align-items-center d-xl-flex d-lg-block">
                        <div class="nav-logo d-flex justify-content-between align-items-center">
                            <a href="/projectWeb_war/user/views/home"><img src="./assets/images/logo.png" alt="logo"></a>
                            <div class="d-flex align-items-center gap-4">
                                <div class="nav-right d-xl-none">
                                    <ul class="nav-actions">
                                        <li class="category-toggle">
                                            <i class='bx bx-category'></i>
                                        </li>
                                        <li class="search-toggle">
                                            <i class='bx bx-search-alt'></i>
                                        </li>
                                    </ul>
                                </div>
                                <div class="mobile-menu d-flex ">
                                    <a href="javascript:void(0)" class="hamburger d-block d-xl-none">
<span class="h-top"></span>
<span class="h-middle"></span>
<span class="h-bottom"></span>
</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-8 col-md-8 col-sm-6 col-xs-6">
                        <nav class="main-nav float-end">
                            <div class="inner-logo d-xl-none text-center">
                                <a href="#"><img src="../assets/images/logo.png" alt=""></a>
                            </div>
                            <ul>
                                <li>
                                    <a href="/projectWeb_war/user/views/home"><span style="font-size: 15px;">Trang Chủ</span></a>
                                </li>
                                <li><a href="/projectWeb_war/user/views/aboutUs"><span style="font-size: 15px;">Về Chúng Tôi</span></a></li>
                                <li >
                                    <a href="/projectWeb_war/user/views/destination"><span style="font-size: 15px;">Điểm Đến</span></a>
                                    
                                </li>
                                <li >
                                    <a href="/projectWeb_war/user/views/tour"><span style="font-size: 15px;">Du Lịch</span></a>
                                </li>
                                <li >
                                    <a href="/projectWeb_war/user/views/blog"><span style="font-size: 15px;">Tin tức</span></a>
                                
                                </li>
                                <li><a href="/projectWeb_war/user/views/guide"><span style="font-size: 15px;">Hướng Dẫn Viên</span></a></li>

                            </ul>
                            <div class="inner-contact-options d-xl-none">
                                <div class="contact-box-inner"><i class="bi bi-telephone-fill"></i> <a href="tel:+17632275032">+1 763-227-5032</a></div>
                                <div class="contact-box-inner"><i class="bi bi-envelope-fill"></i> <a href="/cdn-cgi/l/email-protection#4b22252d240b2e332a263b272e65282426"><span class="__cf_email__" data-cfemail="dcb5b2bab39cb9a4bdb1acb0b9f2bfb3b1">[email&#160;protected]</span></a></div>
                            </div>
                        </nav>
                    </div>
                    <div class="col-xl-2">
                        <div class="nav-right float-end d-xl-flex d-none ">
                            <ul class="nav-actions">
                                <li class="category-toggle">
                                    <i class='bx bx-category'></i>
                                </li>
                                <li class="search-toggle">
                                    <i class='bx bx-search-alt'></i>
                                </li>
                                <li class="profile-toggle">
                                    <a href="<%= userHeader != null?"profile.jsp":"sign.jsp"%>"><i class='bx bx-user' ></i></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </header>


    
</body>

</html>