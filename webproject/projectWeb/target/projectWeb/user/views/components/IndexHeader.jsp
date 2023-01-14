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

<% User user = (User) session.getAttribute("auth")==null?null:(User) session.getAttribute("auth");
%>



<div class="mobile-search">
    <div class="container">
        <div class="row d-flex justify-content-center">

            <div class="col-md-11">

                <label>Bạn Đang Tìm Kiếm Điều Gì?</label>
                <form action="/projectWeb_war/user/views/tour" method="post">

                    <input type="text" name="search" placeholder="Tìm Kiếm Địa điểm, Vé du lịch , Hạng mục...">

                </form>
            </div>
            <div class="col-1 d-flex justify-content-end align-items-center">
                <div class="search-cross-btn">

                    <i class="bi bi-x"></i>
                </div>
            </div>


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
    <div class="header-area header-style-four position-absolute w-100">
        <div class="container-fluid">
            <div class="row">
                <div class="col-xxl-2 col-xl-2 col-lg-12 col-md-12 col-sm-12 col-xs-12 align-items-center d-xl-flex d-lg-block">
                    <div class="nav-logo d-flex justify-content-between align-items-center">
                        <a href="/projectWeb_war/user/views/home"><img src="./assets/images/logo-w.png" alt="logo"></a>
                        <div class="mobile-menu d-flex ">
                            <div class="d-flex align-items-center">
                                <div class="nav-right-icons d-xl-none d-flex align-items-center ">
                                    <div class="user-dropdown">
                                        <i class='bx bx-user-circle'></i>
                                        <ul class="user-drop-list">
                                            <li><a href="#">My Account</a></li>
                                            <li><a href="#">Login</a></li>
                                            <li><a href="#">Registration</a></li>
                                            <li><a href="#">Setting</a></li>
                                        </ul>
                                    </div>
                                    <div class="category-toggle"><i class='bx bx-category'></i></div>
                                </div>
                                <a href="javascript:void(0)" class="hamburger d-block d-xl-none">
                                    <span class="h-top"></span>
                                    <span class="h-middle"></span>
                                    <span class="h-bottom"></span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xxl-7 col-xl-8 col-lg-9 col-md-8 col-sm-6 col-xs-6">
                    <nav class="main-nav index-main-nav">
                        <div class="inner-logo d-xl-none text-center">
                            <a href="#"><img src="./assets/images/logo.png" alt=""></a>
                        </div>
                        <ul >
                            <li>
                                <a href="/projectWeb_war/user/views/home">Trang Chủ</a>
                            </li>
                            <li><a href="/projectWeb_war/user/views/aboutUs">Về Chúng Tôi</a></li>
                            <li >
                                <a href="/projectWeb_war/user/views/destination">Điểm Đến</a>

                            </li>
                            <li >
                                <a href="/projectWeb_war/user/views/tour" >Du Lịch</a>
                            </li>
                            <li >
                                <a href="/projectWeb_war/user/views/blog">Tin tức</a>

                            </li>
                            <li><a href="/projectWeb_war/user/views/guide">Hướng Dẫn Viên</a></li>

                        </ul>
                        <div class="inner-contact-options d-xl-none">
                            <div class="contact-box-inner"><i class="bi bi-telephone-fill"></i> <a href="tel:+17632275032">+1 763-227-5032</a></div>
                            <div class="contact-box-inner"><i class="bi bi-envelope-fill"></i> <a href="/cdn-cgi/l/email-protection#afc6c1c9c0efcad7cec2dfc3ca81ccc0c2"><span class="__cf_email__" data-cfemail="aac3c4ccc5eacfd2cbc7dac6cf84c9c5c7">[email&#160;protected]</span></a></div>
                        </div>
                    </nav>
                </div>
                <div class="col-xxl-3 col-xl-2 col-lg-1">
                    <div class="nav-right d-xl-flex d-none">
                        <div class="nav-right-icons gap-3">
                            <div class="header-search search-btn">
                                <i class='bx bx-search' ></i>
                            </div>
                            <div class="category-toggle"><i class='bx bx-category'></i></div>
                            <div class="profile-toggle">
                                <a href="<%= user != null?"profile.jsp":"sign.jsp"%>"><i class='bx bx-user' ></i></a>
                            </div>
                        </div>
                        <%--                            <div class="nav-right-hotline d-xxl-flex d-none">--%>
                        <%--                                <div class="hotline-icon">--%>
                        <%--                                    <img src="../../assets/images/icons/header-phone.svg" alt="">--%>
                        <%--                                </div>--%>
                        <%--                                <div class="hotline-info">--%>
                        <%--                                    <span>Hot Line Number</span>--%>
                        <%--                                    <h6><a href="tel:8801761111456">+880 176 1111 456</a></h6>--%>
                        <%--                                </div>--%>
                        <%--                            </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>


    
</body>

</html>