<%@ page import="vn.edu.hcmuaf.fit.bean.AboutUs" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.services.UserService" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Tour" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Blog" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

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

<%
    AboutUs au = (AboutUs) request.getAttribute("au");
    List<AboutUs> lau = (List<AboutUs>) request.getAttribute("lau");
    List<Tour> lt = (List<Tour>) request.getAttribute("lt");
    List<Blog> lb = (List<Blog>) request.getAttribute("lb");
    List<User> lu = (List<User>) request.getAttribute("lu");

%>
    <div class="breadcrumb breadcrumb-style-one">
        <div class="container">
            <div class="col-lg-12 text-center">
                <h2 class="breadcrumb-title">Về Chúng Tôi</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Về Chúng Tôi</li>
                </ul>
            </div>
        </div>
    </div>


    <div class="about-main-wrappper pt-100">
        <div class="container">
            <div class="about-tab-wrapper">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-6">
                        <div class="about-tab-image-grid text-center">
                            <div class="about-video d-inline-block">
                                <img src="<%=au.getAboutus_image()==null?"./assets/images/about/about-g2.jpg":"../.."+au.getAboutus_image()%>" alt="">

                            </div>
                            <div class="row float-images g-4">
                                <%
                                    for (int i = 0; i < 2; i++) {
                                       AboutUs a = lau.get(i);
                                    %>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <div class="about-image">
                                        <img src="<%=a.getAboutus_image()==null?"./assets/images/about/about-g1.jpg":"../.."+a.getAboutus_image()%>" alt="">
                                    </div>
                                </div>

                                <%}%>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 mt-5 mt-lg-0">
                        <div class="about-tab-wrap">
                            <h2 class="about-wrap-title">
                                Giới thiệu về công ty của chúng tôi và những gì chúng tôi cung cấp.
                            </h2>
                            <div class="about-tab-switcher">
                                <ul class="nav nav-pills mb-3 justify-content-md-between justify-content-center" id="about-tab-pills" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <div class="nav-link active" id="pills-about1" data-bs-toggle="pill" data-bs-target="#about-pills1" role="tab" aria-controls="about-pills1" aria-selected="true">
                                            <h3>1</h3>
                                            <h6>Năm Kinh Nghiệm</h6>
                                        </div>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <div class="nav-link" >
                                            <h3><%=lt.size()%>+</h3>
                                            <h6>Tour du lịch</h6>
                                        </div>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <div class="nav-link" >
                                            <h3><%=lu.size()%>+</h3>
                                            <h6>Kết nối khách du lịch</h6>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content about-tab-content" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="about-pills1" role="tabpanel" aria-labelledby="pills-about1">
                                    <p>
<%=au.getAboutus_description()%>    <br>

                                    </p>
                                </div>
<%--                                <div class="tab-pane fade" id="about-pills2" role="tabpanel" aria-labelledby="pills-about2">--%>
<%--                                    <p> Cho đến nay TRAVELLAB đã có 2 chi nhánh tại thành phố Hồ Chí Minh và Đà Lạt với gần 100 nhân viên gồm đội ngũ điều hành, tư vấn viên, nhân viên kinh doanh và hướng dẫn viên du lịch có trình độ chuyên môn cao được đào tạo và tuyển chọn chuyên nghiệp.--%>
<%--                                        <br>--%>
<%--                                        Với đội ngũ quản lý điều hành có nhiều kinh nghiệm và chuyên môn cao trong quản lý – điều hành dịch vụ du lịch và lực lượng lao động có trình độ chuyên môn cao được đào tạo và tuyển chọn chuyên nghiệp TRAVELLAB luôn cam kết mang đến cho Quý khách hàng và đối tác các sản phẩm dịch vụ chất lượng và lợi ích tốt nhất, cùng với đội ngũ nhân viên được đào tạo chuyên nghiệp có kinh nghiệm trong lĩnh vực du lịch lữ hành.--%>
<%--                                        <br>--%>
<%--                                        Công ty luôn tập trung xây dựng, liên kết và phát triển đội ngũ nhân viên kinh doanh, hướng dẫn viên chuyên nghiệp và lành nghề nhằm mang đến cho du khách sự hài lòng nhất về chất lượng và dịch vụ. Hệ thống các nhà cung cấp dịch vụ gồm các đối tác trong nước và quốc tế luôn duy trì các hoạt động cung cấp dịch vụ ổn định hàng năm. Hệ thống cơ sở vật chất và các đơn vị thành viên luôn sẵn sàng đáp ứng các dịch vụ du lịch lữ hành của Công ty.--%>
<%--                                    </p>--%>
<%--                                </div>--%>
<%--                                <div class="tab-pane fade" id="about-pills3" role="tabpanel" aria-labelledby="pills-about3">--%>
<%--                                    <p>Nhờ vào sự nỗ lực không ngừng của tập thể vững mạnh TRAVELLAB và sự tin yêu tín thác của Quý khách. Năm 2018 doanh nghiệp đã tổ chức cho 3811 khách đi du lịch Hàn Quốc, 3800 khách đi Đài Loan, 3524 khách đi Thái Lan,... và hàng ngàn lượt khách du lịch trong và ngoài nước. Các tour khởi khành đều đặn hằng tháng với lượt khách ổn định. Với gần 20.000 lượt khách du lịch, hàng trăm đoàn khách du lịch quốc tế khởi hành mỗi năm thương hiệu TRAVELLAB đã và đang được khẳng định mạnh mẽ trong nước và quốc tế. --%>
<%--                                    </p>--%>
<%--                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row pt-100 align-items-center">
                <div class="col-lg-6">
                    <div class="achievement-counter-wrap">
                        <h2 class="about-wrap-title">
                            Tại sao phải đặt gói với
                            <br>
                            <span>TRAVELLAB</span>
                        </h2>
                        <div class="achievement-counter-cards">
                            <%
                                for (AboutUs a:
                                     lau) {

                                %>
                            <div class="achievement-counter-card flex-sm-row flex-column text-sm-start text-center ">
                                <div class="counter-box mb-sm-0 mb-3">
                                    <h2><%=a.getAboutus_title()%></h2>
                                </div>
                                <h5 class="about_h5_box3"><%=a.getAboutus_description()%></h5>
                            </div>
                            <%}%>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <%
                        for (AboutUs a:
                                lau) {

                    %>
                    <div class="about-image-group mt-5 mt-lg-0">
                        <img src="<%=a.getAboutus_image()==null?"./assets/images/about/about-image-group2.jpg":"../.."+a.getAboutus_image()%>" alt="" class="img-fluid">
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </div>








    <div class="blog-area blog-style-two pt-120">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                    <div class="section-head-alpha text-start">
                        <h2>Tin tức mới nhất</h2>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="blog-btn text-lg-end"><a href="/projectWeb_war/user/views/blog" class="button-fill-round">Xem tất cả Tin tức</a></div>
                </div>
            </div>
            <div class="row">
                <%
                    for (Blog b:
                         lb) {

                    %>
                <div class="col-lg-4 col-md-6">
                    <div class="blog-card-gamma">
                        <div class="blog-thumb" style="height: 250px">
                            <a style="height: 100%" href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>">
<img style="height: 100%" src="../..<%=b.getImageURL()%>" alt="">
</a>
                            
                        </div>
                        <div class="blog-content">
                            <div class="blog-body-top">
                                <a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>" class="blog-writer"><i class="bi bi-person-circle"></i> By <%=b.getFullName()%> </a>
                                <a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>" class="blog-comments"><i class="bi bi-calendar3"></i> <%=b.getNgayVietBai().toString()%> </a>
                            </div>
                            <h4 class="blog-title"><a href="/projectWeb_war/user/views/blogDetail?blogId=<%=b.getBLOG_ID()%>"><%=b.getBLOG_TITLE()%></a></h4>
                        </div>
                    </div>
                </div>
                <%}%>
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
</body>

</html>