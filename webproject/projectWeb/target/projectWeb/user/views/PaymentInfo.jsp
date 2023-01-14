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
                                <jsp:param name="isCurrent" value="payment"/>
                            </jsp:include>
    
    
                            <div class="ps-md-4">
                                <div class="wrapper p-md-4">
                                    <div class="heading">
                                        <h5 class="fw-bold">Thông tin thanh toán</h5>
                                        <p class="text-muted mb-4">
                                            Thêm hoặc bỏ các phương thức thanh toán một cách bảo mật để dễ đặt hơn.
                                        </p>
                                    </div>
                                    <form class="row payment-info" id="payment-info">
                                        <div class="col-md-9 col-12">
                                            <div class="row setting-item">
                                                <div class="col-md-3 col-12 setting-label">Thẻ</div>
                                                <div class="col-md-9 col-12">
                                                    <div class="row">
                                                        <div class="col-12 col-md-12">
                                                            <div class="display-form">
                                                                <span>Thêm thẻ thanh toán</span>
                                                                <a onclick="btnHidden_payment()" class="fw-bold text-underline toggle-edit-form">Chỉnh sửa</a>
                                                            </div>
                                                            <div class="edit-form btn-hidden" id="add-card">
                                                                <div class="edit-form-wrapper">
                                                                    <div class="row">
                                                                        <div class="col-12">
                                                                            <div class="form-group">
                                                                                <label>Tên trên thẻ</label>
                                                                                <input type="text" id="cardName" class="form-control" aria-describedby="cardNameBlock" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <div class="form-group">
                                                                                <label>Số thẻ</label>
                                                                                <input type="number" id="cardNumber" class="form-control" aria-describedby="cardNumberBlock" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-6">
                                                                            <div class="form-group">
                                                                                <label>Ngày hết hạn</label>
                                                                                <input type="date" id="cardExpiredDate" placeholder="MM/YY" class="form-control" aria-describedby="cardExpiredDateBlock" />
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-12">
                                                                            <div class="form-group">
                                                                                <label>Ngân hàng</label>
                                                                                <select id="card-list" style="border: 1px solid #ced4da;">
                                                                                    <option selected>Chọn thẻ</option>
                                                                                    <option value="Ngân hàng VCBank">Ngân hàng VCBank</option>
                                                                                    <option value="Ngân hàng BIDV">Ngân hàng BIDV</option>
                                                                                    
                                                                                    </select>                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="text-end">
                                                                    <button class="
                                        btn btn-sm btn-secondary
                                        edit-form-submit
                                      ">
    Xong
    </button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
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