<%@ page import="vn.edu.hcmuaf.fit.bean.Tour" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %>

<%@ page import="java.text.NumberFormat" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Destination" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>

<head>
    <title>TravelLab - Khám phá đất nước của chúng ta</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="icon" href="assets/images/favicon.png" type="image/gif" sizes="20x20">

    <link rel="stylesheet" href="assets/css/select2.min.css">

    <link rel="stylesheet" href="assets/css/jquery.fancybox.min.css">


    <link rel="stylesheet" href="assets/css/swiper-bundle.min.css">

    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <link rel="stylesheet" href="assets/css/animate.min.css">

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">

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
                <h2 class="breadcrumb-title">Du Lịch</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Du Lịch</li>
                </ul>
            </div>
        </div>
    </div>

    <div class="package-sidebar-wrapper pt-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8" id="bound-parent">
                    <%String text = (String) request.getAttribute("text")!=null?(String) request.getAttribute("text"):null;%>
                    <%if (text != null){%>
                    <div class="row">
                        <div class="col-lg-10 right">
                            <span style="font-size: 1.5rem;font-weight: 600">Bạn đang tìm kiếm với<%=text%></span>
                        </div>
                    </div>
                    <%}%>
                    <div class="row" style="margin-bottom: 1rem;">
                        <div class="col-lg-4 right">
                            <select id="filter-sort-tour" style="border: 1px solid var(--c-primary);">

                                <option selected>Lựa chọn lọc</option>
                                <option value="price-asc">Sắp xếp theo giá tiền tăng dần</option>
                                <option value="price-desc">Sắp xếp theo giá tiền giảm dần</option>
                                <option value="new">Sắp xếp theo theo mới nhất</option>
                            </select>
                        </div>
                        
                    </div>
                    <div class="row" id="group-item">
                        <!-- 10 sp dau tien -->
                        <%
                        List<Tour> list =(List<Tour>)request.getAttribute("list");
                            for (Tour tour:list) {
                                Date curDate = new Date(System.currentTimeMillis());
                                float giaVe= tour.getGiaVe();
                                Locale locale = new Locale("vi");
                                NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                               String giaVeString = format.format(giaVe).split(",")[0];
                                boolean checkDate = curDate.getTime()-tour.getNgayTao().getTime() <=500000000?true:false;
//                                long dateLong = curDate.getTime()-tour.getNgayTao().getTime();
                                long dateLong = tour.getNgayKetThuc().getTime()-tour.getNgayKhoiHanh().getTime();
                                String dateString = ""+dateLong;
                                int dem = Integer.parseInt(dateString.substring(0,1));
                                int ngay = dem+1;
                                %>
                        <div class="col-md-6 " style="height: 450px" >
                            <div class="package-card-alpha" style="height: 450px" href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>">
                                <div class="package-thumb">
                                    <div class="is-new-tour <%=checkDate?"":"display-hide"%>" id="<%=tour.getNgayTao().toString()%>"><span >Mới</span></div>
                                    <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>"><img src="<%="../.."+tour.getImageURL()%>" alt=""></a>
                                    <p class="card-lavel">
                                        <i class="bi bi-clock"></i> <span><%=ngay%> Ngày và <%=dem%>  Đêm</span>
                                    </p>
                                </div>
                                <div class="package-card-body">
                                    <h3 class="p-card-title"><a href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>"><%=tour.getTourName()%></a></h3>
                                    <div class="p-card-bottom">
                                        <div class="book-btn">
                                            <a href="/projectWeb_war/user/views/tourDetail?tourId=<%=tour.getTour_id()%>">Đặt Ngay <i class='bx bxs-right-arrow-alt'></i></a>
                                        </div>
                                        <div class="p-card-info">
                                            <span>Số còn nhận <span style="color: var(--c-primary);"><%=tour.getSoLuong()%></span></span>
                                            <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%}%>

                      
                     
                     
                       
                      
                       
                      
                        
                        
 
                        <!-- end -->
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <nav>
                                <ul id="pagination-demo" class="pagination pagination-style-one justify-content-center pt-80">
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="package-sidebar">
                        <form action="/projectWeb_war/user/views/doSearchWithFilter"  method="post" id="blog-sidebar-search">
                            <aside class="package-widget widget-search">
                                <div class="widget-title">
                                    <h4>Tìm kiếm</h4>
                                </div>
                                <div class="widget-body">

                                        <div class="search-input-group">
                                            <input type="search" name="searchText" placeholder="Tìm Kiếm">

                                            <button type="submit">Tìm</button>
                                        </div>

                                </div>
                            </aside>
                            <aside class="package-widget widget-tour-categoris mt-30">
                                <div class="widget-title">
                                    <h4>Điểm đến</h4>
                                </div>
                                <div class="widget-body">
                                    <ul>
                                     <li>
                                        <select
                                        class="form-select"
                                        id="CountryId"
                                        name="searchDiaDiem"
                                      >
                                            <option value="" >Chọn điểm đến</option>
                                            <% List<Destination> desList  = (List<Destination>) request.getAttribute("destinationList");
                                                for (Destination des:desList
                                                     ) {

                                            %>

                                        <option value="<%=des.getDiaDiem_ID()%>" ><%=des.getTenDiaDiem()%></option>

                                            <%}%>
                                        </select>
                                     </li>
                                    </ul>
                                </div>
                            </aside>
                            <aside class="package-widget widget-tour-categoris mt-30">
                                <div class="widget-title">
                                    <h4>Phân loại</h4>
                                </div>
                                <div class="widget-body">
                                    <ul>
                                        <li>
                                            <select
                                                    class="form-select"
                                                    id="CategoryId"
                                                    name="searchCategory"
                                            >
                                                <option value="" >Chọn hạng mục</option>
                                                <option value="Phiêu Lưu" >Phiêu Lưu</option>
                                                <option value="Du Lịch" >Du Lịch</option>
                                                <option value="Du Lịch Đôi">Du Lịch Đôi</option>
                                                <option value="Du Lịch Đơn Thân" >Du Lịch Đơn Thân</option>
                                                <option value="Tuần Trăng Mật" >Tuần Trăng Mật</option>
                                                <option value="Bãi Biển" >Bãi Biển</option>
                                                <option value="Thám Hiểm Núi" >Tuần Trăng Mật</option>

                                            </select>
                                        </li>
                                    </ul>

                                </div>
                            </aside>

                            <aside class="package-widget widget-duration mt-30">
                                <div class="widget-title">
                                    <h4>Thời gian</h4>
                                </div>
                                <div class="widget-body">
                                    <div class="search-input-group">
                                        <input type="number" name="searchDay" placeholder="Nhập số lượng ngày">

                                    </div>
                                </div>
                            </aside>
                            <aside class="package-widget widget-tour-categoris mt-30">
                                <div class="widget-title">
                                    <h4>Mức giá</h4>
                                </div>
                                <div class="widget-body">
                                    <ul>
                                        <li>
                                            <select
                                                    class="form-select"
                                                    id="priceId"
                                                    name="searchPrice"
                                            >
                                                <option value="">Chọn mức giá</option>
                                                <option value="3000000" >Dưới 3 triệu</option>
                                                <option value="5000000" >Dưới 5 triệu</option>
                                                <option value="7000000" >Dưới 7 triệu</option>
                                                <option value="10000000" >Dưới 10 triệu</option>
                                                <option value="12000000" >Dưới 12 triệu</option>
                                                <option value="15000000" >Dưới 15 triệu</option>
                                                <option value="17000000" >Dưới 17 triệu</option>
                                                <option value="20000000" >Dưới 20 triệu</option>
                                                <option value="20000001" >Trên 20 triệu</option>
                                            </select>
                                        </li>
                                    </ul>


                                </div>
                            </aside>
                            <aside class="package-widget widget-duration mt-30">
                                <div class="widget-title">
                                    <h4>Số lượng người</h4>
                                </div>
                                <div class="widget-body">
                                    <div class="search-input-group">
                                        <input type="number" name="searchPersons" placeholder="Nhập số lượng người">

                                    </div>
                                </div>
                            </aside>
                            <aside class="package-widget widget-recent-package-entries mt-30">
                                <div class="widget-title">
                                    <h4>Ngày đi</h4>
                                </div>
                                <div class="widget-body">
                                    <div class="search-input-group">
                                        <input type="date" name="searchDate">

                                    </div>
                                </div>
                            </aside>
                        </form>
                        <aside class="package-widget widget-recent-package-entries mt-30">
                            <div class="widget-title">
                                <h4>Gói Du Lịch Mới Sắp tới</h4>
                            </div>
                            <div class="widget-body">
                                <ul>
                                    <% List<Tour> incommingList = (List<Tour>) request.getAttribute("incommingList");
                                    int i =0 ;
                                        for (Tour tour:
                                             incommingList) {
                                            float giaVe= tour.getGiaVe();
                                            Locale locale = new Locale("vi");
                                            NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
                                            String giaVeString = format.format(giaVe).split(",")[0];

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
                                                <h6><%=giaVeString%> ₫ <span>1 Người</span></h6>
                                            </div>
                                        </div>
                                    </li>
                                    <%
                                        i++;
                                        if (i == 4) break;
                                        }%>
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
    <script src="./assets/js/paginationJQUERY.js"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<%--    <script src="./100sp.js">--%>
        
    </script>
    <script>
        jQuery(function () {
            let list = $('#group-item');
            let listProducts = list.children();
            let boundParent = $('#bound-parent');
            let productNum = listProducts.length;
            let displayProduct = 8;
            let paginationNum =  Math.ceil(productNum / displayProduct) ;

            let ulPagination = $('#pagination-demo');
            let listIndex = ulPagination.children(".page-item-index");
            
            for (let index = 0; index < paginationNum; index++) {
                if (index ===0) {                   
                    ulPagination.append(`
                            <li class="page-item page-item-index active">
                                <a class="page-link" href="#" style="text-align: center;" >${index+1}</a>
                            </li>
                    `);
                }else{
                    ulPagination.append(`
                            <li class="page-item page-item-index">
                                <a class="page-link" href="#" style="text-align: center;" >${index+1}</a>
                            </li>
                    `);
                }
                
            };
          
                 for (let j = 0; j < listProducts.length; j++) {
                   listProducts[j].classList.add('display-hide');
                    
                };
            if (ulPagination.children().length > 6) {
                for (let index = 0; index < ulPagination.children().length; index++) {
                        ulPagination.children()[index].classList.add('display-hide')
                        
                    }
                    ulPagination.children()[0].classList.remove('display-hide');
                    ulPagination.children()[ulPagination.children().length-1].classList.remove('display-hide');
                    ulPagination.children()[1].classList.remove('display-hide');
            }
            function displayItem(listProducts,list,displayProduct,page) {
                page--;
                for (let j = 0; j < listProducts.length; j++) {
                   listProducts[j].classList.remove('display-hide');
                    
                }
                for (let j = 0; j < listProducts.length; j++) {
                   listProducts[j].classList.add('display-hide');
                    
                }
                let loop_start = displayProduct * page;
                let renderItem = listProducts.slice(loop_start,loop_start+displayProduct);
                for (let index = 0; index < renderItem.length; index++) {
                    renderItem[index].classList.toggle('display-hide');   
                }
            };
            displayItem(listProducts,list,displayProduct,1);
           
            jQuery(function () {
          
            jQuery(".page-item-index").click(function (e) {
                let len = ulPagination.children().length;
                let eIndex = 0;
                if (len > 6){
                    for (let index = 0; index < len; index++) {
                        ulPagination.children()[index].classList.add('display-hide')
                        if (ulPagination.children()[index].isEqualNode(e.currentTarget)) {
                            eIndex = index; 
                        }
                    }
                    if (eIndex > 0 && eIndex < len-1) {
                        
                        ulPagination.children()[0].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                        ulPagination.children()[eIndex -1].classList.remove('display-hide');
                        ulPagination.children()[eIndex+1].classList.remove('display-hide');
                    }else if(eIndex === 0 && eIndex < len-1) {
                        ulPagination.children()[eIndex+1].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                    }else if(eIndex > 0 && eIndex === len-1){
                        ulPagination.children()[0].classList.remove('display-hide');
                        ulPagination.children()[len-1].classList.remove('display-hide');
                        ulPagination.children()[eIndex].classList.remove('display-hide');
                        ulPagination.children()[eIndex -1].classList.remove('display-hide');
                        
                    }
                }
                for (let k = 0; k < ulPagination.children().length; k++) {
                ulPagination.children()[k].classList.remove('active')
                
                }
                e.currentTarget.classList.add('active')
                displayItem(listProducts,list,displayProduct,parseInt(e.currentTarget.innerText));
                 });
            });

            const filterSortTour = $('#filter-sort-tour');
            filterSortTour.on('change' , function (e) {
                var valueSelected = this.value;
                function convertToMoney(e) {
                var moneyNode = e.getElementsByClassName('p-card-info')[0];
                var moneyText = moneyNode.getElementsByTagName('h6')[0].innerText;
                var moneyTextList = moneyText.split(' ');
                var moneyTextString =parseInt(moneyTextList[0].split('.').join(''));
                return moneyTextString;
                }
                
               
                function convertToDate(e) {
                    var dateString = e.getElementsByClassName('is-new-tour')[0].id;
                    
                    
                    return Date.parse(dateString);
                }
              
                
               if (valueSelected ==='price-desc') {
                   
                   jQuery(function () {
                       const newListProducts = listProducts.sort((a,b) => convertToMoney(b) - convertToMoney(a));
                       
                       list.children().remove()
                       for (let index = 0; index < newListProducts.length; index++) {
                           //     list.append(`${listProducts[index].outerHTML}`)
                           list.children().remove()
                       }
                       for (let i = 0; i < newListProducts.length; i++) {
                           
                           list.append(newListProducts[i].outerHTML)
                           
                       }
                       listProducts = list.children();
                       displayItem(listProducts,list,displayProduct,1)
                   })
               }else if (valueSelected === 'price-asc') {
                jQuery(function () {
                       const newListProducts = listProducts.sort((a,b) => convertToMoney(a) - convertToMoney(b));
                       
                       list.children().remove()
                       for (let index = 0; index < newListProducts.length; index++) {
                           //     list.append(`${listProducts[index].outerHTML}`)
                           list.children().remove()
                       }
                       for (let i = 0; i < newListProducts.length; i++) {
                           
                           list.append(newListProducts[i].outerHTML)
                           
                       }
                       listProducts = list.children();
                       displayItem(listProducts,list,displayProduct,1)
                   })
               }else if(valueSelected === 'new'){
                 jQuery(function () {
                       const newListProducts = listProducts.sort((a,b) => convertToDate(b) - convertToDate(a));
                       
                       list.children().remove()
                       for (let index = 0; index < newListProducts.length; index++) {
                           //     list.append(`${listProducts[index].outerHTML}`)
                           list.children().remove()
                       }
                       for (let i = 0; i < newListProducts.length; i++) {
                           
                           list.append(newListProducts[i].outerHTML)
                           
                       }
                       listProducts = list.children();
                       displayItem(listProducts,list,displayProduct,1)
                   })
               }
                

            });
        });
    </script>
</body>

</html>