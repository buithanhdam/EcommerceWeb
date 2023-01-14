<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
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

    <%User guide = (User) request.getAttribute("guide");

    %>

    <div class="breadcrumb breadcrumb-style-one">
        <div class="container">
            <div class="col-lg-12 text-center">
                <h2 class="breadcrumb-title">Liên Hệ</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Liên Hệ</li>
                </ul>
            </div>
        </div>
    </div>


    <div class="contact-wrapper pt-100">
        <div class="container">
            <div class="row align-items-center justify-content-lg-center gy-5">
                <div class="col-lg-6">
                    <div class="contatc-intro-figure">
                        <img src="<%="../.."+guide.getImageURL()%>" alt="" class="img-fluid">
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="contact-info">
                        <h3>Thông Tin Liên Hệ</h3>
                        <ul>
                            <li>
                                <h6>Thông tin cá nhân</h6>
                                <a href=""><%=guide.getFullName()%></a>
                                <br>
                                <a href=""><%=guide.getBirth()%></a>
                                <br>
                                <a href=""><%=guide.getGioiTinh()%></a>

                            </li>
                            <li>
                                <h6>Vị Trí</h6>
                                <a href=""><%=guide.getDiaChi()%></a>
                            </li>
                            <li>
                                <h6>Hãy liên hệ</h6>
                                <a href="/cdn-cgi/l/email-protection#325b5c545d72574a535f425e571c515d5f"><span class="__cf_email__" data-cfemail="244d4a424b64415c45495448410a474b49"><%=guide.getEmail()%></span></a>
                                <a href="tel:<%=guide.getPhone()%>"><%=guide.getPhone()%></a>
                                <a href="#">Facebook: https://www.facebook.com/egenslab</a>

                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container-fluid p-0">
            <div class="contact-map mt-120">
                <div class="mapouter">
                    <div class="gmap_canvas">
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31346.67534157675!2d106.74835890118793!3d10.862149119112894!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3174d88215693361%3A0x95009cc1803a7e51!2zTGluaCBUcnVuZywgVGjhu6cgxJDhu6ljLCBUaMOgbmggcGjhu5EgSOG7kyBDaMOtIE1pbmgsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1666747544054!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe><a href="https://123movies-to.org"></a><br>
                    </div>
                </div>
            </div>
        </div>
        <div class="container mt-120">
            <form action="#" id="contact_form">
                <div class="contact-form-wrap">
                    <h4>Gửi liên hệ trực tiếp ngay bây giờ</h4>
                    <p>Địa chỉ email của bạn sẽ không được công bố. Các trường bắt buộc được đánh dấu *</p>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="custom-input-group">
                                <label for="name">Tên</label>
                                <input type="text" placeholder="Họ Tên" id="name">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="custom-input-group">
                                <label for="email">Email</label>
                                <input type="text" placeholder="Email của bạn" id="email">
                            </div>
                        </div>
                    </div>
                    <div class="custom-input-group">
                        <textarea cols="20" rows="7" placeholder="Tin Nhắn Của Bạn"></textarea>
                    </div>
                    <div class="custom-input-group">
                        <div class="submite-btn">
                            <button type="submit">Gửi Tin Nhắn</button>
                        </div>
                    </div>
                </div>
            </form>
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
</body>

</html>