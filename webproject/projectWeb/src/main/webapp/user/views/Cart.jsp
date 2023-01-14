<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.TourCart" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Locale" %>
<%@ page import="java.text.NumberFormat" %>
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
    <link rel="stylesheet" href="./assets/css/profile.css">
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

    <div class="profile-wrapper">
        <main role="main">
            <main role="main">
                <div class="profile">
                    <div class="container_profile">
                        <div class="content">


                            <jsp:include page="./components/box-left.jsp">
                                <jsp:param name="isCurrent" value="cart"/>
                            </jsp:include>

                            <%
                                Cart cart =(Cart) session.getAttribute("cart");
                                Map<String, TourCart> mapTourCart = cart.getListTourCart();
                            %>
    
                            <div class="ps-md-4">
                                <div class="wrapper order">
                                    <div class="tab">
                                        <ul class="nav py-3 tab flex-sm-row mb-3" role="tablist">
                                            <li class="nav-item flex-sm-fill text-sm-center" style="cursor: pointer;" role="presentation">
                                                <a class="nav-link " id="pills-all-tab"  data-bs-toggle="pill" data-bs-target="#pills-all" role="tab" aria-controls="pills-all" aria-selected="true">Tất cả</a>
                                            </li>
                                            
<%--                                            <li class="nav-item flex-sm-fill text-sm-center" style="cursor: pointer;" role="presentation">--%>
<%--                                                <a class="nav-link" id="pills-wait-tab" data-bs-toggle="pill" data-bs-target="#pills-wait" role="tab" aria-controls="pills-wait" aria-selected="false">Chờ xác nhận</a>--%>
<%--                                            </li>--%>
<%--                                            <li class="nav-item flex-sm-fill text-sm-center" style="cursor: pointer;" role="presentation">--%>
<%--                                                <a class="nav-link" id="pills-complete-tab" data-bs-toggle="pill" data-bs-target="#pills-complete" role="tab" aria-controls="pills-complete" aria-selected="false">Đã đặt</a>--%>
<%--                                            </li>--%>
                                        </ul>
                                        <div class="form-search mb-4">
                                            <form action="#" method="get">
                                                <input id="myInput" onkeyup="myFunctionSearch()" class="form-control px-5" type="text" placeholder="Tìm kiếm theo tên tour/ tourCode hoặc số Cart" aria-label="default input example" />
                                                <i class="icon icon--search"></i>
                                            </form>
                                        </div>
                                        <div class="tab-content" id="pills-tabContent">
                                            <div class="tab-pane result fade show active " id="pills-all" role="tabpanel" aria-labelledby="pills-all-tab">
                                               <div class="tour-list" >
                                                   <%
                                                       Set<String> key = mapTourCart.keySet();
                                                       for (String id:
                                                            key) {
                                                        TourCart tc = mapTourCart.get(id);
                                                        String[] beginDateArr= tc.getNgayKhoiHanh().toString().split("-");
                                                        String beginDate = "Ngày "+beginDateArr[2]+" Tháng "+beginDateArr[1]+", "+beginDateArr[0];
                                                           String[] endDateArr= tc.getNgayKetThuc().toString().split("-");
                                                           String endDate = "Ngày "+endDateArr[2]+" Tháng "+endDateArr[1]+", "+endDateArr[0];
                                                           Locale locale = new Locale("vi");
                                                           NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                                           String thanhTienString = format.format(tc.getTongTien()).split(",")[0];

                                                   %>
                                                    <div class="tour-item">
                                                        <div class="tour-item-first-side">
                                                            <a style="color: #2d4271;" href="/projectWeb_war/user/views/tourDetail?tourId=<%=id%>"><span class="tour-item-first-side-id">Id Tour: <span><%=id%></span></span></a>
                                                            <a style="color: #2d4271;"href="/projectWeb_war/user/views/tourDetail?tourId=<%=id%>"> <span><%=tc.getTourName()%></span></a>
                                                        </div>
                                                        <div class="tour-item-second-side">
                                                            <div class="tour-item-second-side-start">
                                                                <span >Bắt đầu chuyến đi</span>
                                                                <p class="time" ><%=beginDate%></p>
                                                            </div>
                                                            <div class="tour-item-second-side-end">
                                                                <span >Kết thúc chuyến đi</span>
                                                                <p class="time" ><%=endDate%></p>
                                                            </div>
                                                        </div>
                                                        <div class="tour-item-third-side">
                                                            <p class="add-more"style="font-size: 12px;" ><span id=""><%=tc.getSOLUONG_VENGUOILON()%> người lớn</span> <span id=""><%=tc.getSOLUONG_VETREEM()%> trẻ em</span></p>
                                                            <span>Thành tiền: <span><%=thanhTienString%></span><span>₫</span></span>
                                                        </div>
                                                        <div class="tour-item-four-side" style="display: flex;flex-direction: column;gap: 0.5rem">
                                                            <a class="bound sua" style="background: #d8bb00" href="/projectWeb_war/user/views/TourCart?tourId=<%=id%>" >
                                                                <span>Sửa</span>
                                                            </a>
                                                            <a class="bound dahuy " href="/projectWeb_war/user/views/CEDTourCart?tourId=<%=id%>" >
                                                                <span>Xóa</span>
                                                            </a>

                                                        </div>
                                                    </div>
                                                   <%}%>

                                                   
                                                    
                                                   
                                               </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
    
                        </div>
                    </div>
                </div>
            </main>
        </main>
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
    <script src="./assets/js/profile.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>


</body>

</html>