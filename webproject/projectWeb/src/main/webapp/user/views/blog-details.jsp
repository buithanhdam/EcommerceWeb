<%@ page import="vn.edu.hcmuaf.fit.bean.*" %>

<%@ page import="java.sql.Date" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.util.*" %>
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

    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/style.css">
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
                <h2 class="breadcrumb-title">Chi tiết Blog</h2>
                <ul class="d-flex justify-content-center breadcrumb-items">
                    <li class="breadcrumb-item"><a href="/projectWeb_war/user/views/home">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Chi tiết Blog</li>
                </ul>
            </div>
        </div>
    </div>

    <%

        Blog blog = (Blog) request.getAttribute("blog");
        List<BlogImage> blogImage = (List<BlogImage>) request.getAttribute("blogImage");
        List<Comment> blogComment = (List<Comment>) request.getAttribute("blogComment");
        List<Destination> desList = (List<Destination>) request.getAttribute("destinationList");




    %>
    <div class="blog-details-wrapper pt-80">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="blog-details">
                        <div class="post-header">
                            <h2 class="post-title"><%=blog.getBLOG_TITLE()%></h2>
                            <div class="post-meta">
                                <a href="" class="blog-writer"><i class="bi bi-person-circle"></i> <%=blog.getFullName()%> </a>
                                <a href="" class="blog-comments"><i class="bi bi-calendar3"></i> <%=blog.getNgayVietBai().toString()%></a>
                                <a href="" class="blog-comments"><i class="bi bi-chat-left-quote"></i> Bình luận (<%=blogComment.size()%>)</a>
                            </div>
                        </div>
                        <div style="height: 500px" class="post-thumb">
                            <img style="height: 100%" src="<%="../.."+blog.getImageURL()%>" alt="">
                        </div>
                        <div class="post-body">

                            <p><%=blog.getDescription()%></p>
                            <%
                                for (BlogImage bi:
                                     blogImage) {

                                %>

                            <div class="post-innner-image">
                                <img style="height: 400px" src="<%=bi.getImageURL()==null?"":"../.."+bi.getImageURL()%>" alt="">
                            </div>
                            <%}%>
                        </div>
<%--                        <div class="post-footer flex-wrap flex-md-nowrap">--%>
<%--                            <a href="#" class="post-switcher prev-post"><i class="bi bi-chevron-left"></i> Trước đó</a>--%>
<%--                            <a href="#" class="next-post-link">Du lịch đảo.</a>--%>
<%--                            <a href="#" class="post-switcher next-post">Tiếp theo <i class="bi bi-chevron-right"></i></a>--%>
<%--                        </div>--%>
                    </div>
                    <div class="comment-section">
                        <h4>Bình luận (<%=blogComment.size()%>)</h4>
                        <div class="comment-list" id="group-comment">
                            <%
                                for (Comment c:
                                     blogComment) {

                                %>
                            <div class="single-comment" >
                                <div>
                                    <div class="commmentor">
                                        <img src="<%=c.getImageURL()==null?"./assets/images/userDefaultImage.png":"../.."+c.getImageURL()%>" alt="">
                                    </div>
                                    <div class="comment mt-4 mt-sm-0">
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="info">
                                                <h6><%=c.getFullName()==null?c.getUSER_ID():c.getFullName()%></h6>
                                                <span><%=c.getNgayTao()%></span>
                                            </div>

                                        </div>
                                        <p><%=c.getComment()%></p>

                                    </div>
                                </div>
                            </div>
                            <%}%>


                        </div>
                        <div class="comment-btn text-center" id="show-more-div">
                            <!-- <span id="show-more-button" style="font-weight: 500;color: var(--c-primary);cursor: pointer;">Xem Thêm Bình Luận</span> -->
                        </div>
                    </div>
                    <form action="/projectWeb_war/user/views/comment?blogId=<%=blog.getBLOG_ID()%>" id="comment_form" method="post">
                        <div class="comment-form mt-110">
                            <h4>Để Lại Bình Luận Của Bạn</h4>

                            <input type="text" style="display: none" name="userIdComment" value="<%=userHeader ==null?"123":userHeader.getUser_Id()%>" id="nameComment">

                            <input type="text" style="display: none" name="blogIdComment" value="<%=blog.getBLOG_ID()%>" id="emailComment">
                            <%Date currentDate = Date.valueOf(LocalDate.now());%>
                            <input type="date" name="dateComment" style="display: none" value="<%=currentDate.toString()%>">

                            <div class="custom-input-group">
                                <textarea cols="20" rows="7" name="Comment" placeholder="Viết Bình Luận"></textarea>
                            </div>
                            <!-- <ul class="form-rating d-flex">
                                <li><i class="bi bi-star"></i></li>
                                <li><i class="bi bi-star"></i></li>
                                <li><i class="bi bi-star"></i></li>
                                <li><i class="bi bi-star"></i></li>
                                <li><i class="bi bi-star"></i></li>
                            </ul> -->
                            <div class="custom-input-group">
                                <div class="submite-btn">
                                    <button type="submit">Bình Luận</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-lg-4">
                    <form action="/projectWeb_war/user/views/blog" method="post" id="blog-sidebar-search">
                        <div class="blog-sidebar ">
                            <aside class="blog-widget widget-search">
                                <div class="widget-title">
                                    <h4>Tìm Kiếm</h4>
                                </div>
                                <div class="widget-body">

                                    <div class="search-input-group">
                                        <input type="text" name="searchBlogText" placeholder="Tìm kiếm tin tức">
                                        <button type="submit">Tìm</button>
                                    </div>

                                </div>
                            </aside>
                            <aside class="blog-widget widget-categories mt-30">
                                <div class="widget-title">
                                    <h4>Điểm đến</h4>
                                </div>
                                <ul class="widget-body">
                                    <li>
                                        <select
                                                class="form-select"
                                                id="CountryId"
                                                name="searchBlogDiaDiem"
                                        >
                                            <option value="" >Chọn điểm đến</option>
                                            <%
                                                for (Destination des:desList
                                                ) {

                                            %>

                                            <option value="<%=des.getDiaDiem_ID()%>" ><%=des.getTenDiaDiem()%></option>

                                            <%}%>
                                        </select>
                                    </li>

                                </ul>
                            </aside>

                            <aside class="blog-widget widget-tag-cloud mt-30">
                                <div class="widget-title">
                                    <h4>Hạng mục</h4>
                                </div>
                                <div class="tag-cloud widget-body">
                                    <ul>
                                        <li>
                                            <select
                                                    class="form-select"
                                                    id="CategoryId"
                                                    name="searchBlogCategory"
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
                            <aside class="blog-widget widget-recent-entries-custom mt-30">
                                <div class="widget-title">
                                    <h4>Bài Viết Mới</h4>
                                </div>
                                <ul class="widget-body">
                                    <% List<Blog> ran = (List<Blog>) request.getAttribute("ranBlogs");
                                        for (Blog blogr:
                                                ran) {


                                    %>
                                    <li class="clearfix">
                                        <div class="wi"><a href="/projectWeb_war/user/views/blogDetail?blogId=<%=blogr.getBLOG_ID()%>"><img src="<%="../.."+blogr.getImageURL()%>" alt=""></a></div>
                                        <div class="wb">
                                            <h6><a href="/projectWeb_war/user/views/blogDetail?blogId=<%=blogr.getBLOG_ID()%>"><%=blogr.getBLOG_TITLE()%></a></h6>
                                            <div class="wb-info">
                                                <span class="post-date"> <i class="bi bi-person-circle"></i><%=blogr.getFullName()%> </span>
                                                <span class="post-date"> <i class="bi bi-calendar3"></i> <%=blogr.getNgayVietBai().toString()%></span>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
                                </ul>
                            </aside>


                        </div>
                    </form>
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
              
            
              
            console.log(listComment)
          
                 for (let j = 0; j < listComment.length; j++) {
                     listComment[j].classList.add('display-hide');
                     console.log(listComment[j])
                    
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