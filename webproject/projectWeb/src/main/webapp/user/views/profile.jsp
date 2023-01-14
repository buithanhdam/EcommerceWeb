<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html >

<head>
    <title>TraveLab - Khám phá đất nước của chúng ta</title>

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

<%--    <% User user = (User) session.getAttribute("auth");--%>
<%--    %>--%>
<%----%>
    <%@include file="./components/header.jsp"%>

  <!-- col-md-3 col-12 left box-items-left  col-md-9 col-12 right ps-md-4 -->
    <div class="profile-wrapper">
        <main role="main">
            <main role="main">
              <div class="profile">
                <div class="container_profile">
                  <div class="content" style="display: flex;">


                    <jsp:include page="./components/box-left.jsp">
                      <jsp:param name="isCurrent" value="profile"/>
                    </jsp:include>
      
                    <div class="ps-md-4">
                      <div class="wrapper p-md-4">
                        <form action="/projectWeb_war/user/views/profile" method="post">


                        <div class="heading-profile">
                          <div>
                            <h5 class="fw-bold">Thông tin cá nhân</h5>
                            <p class="text-muted mb-4">
                              Cập nhật thông tin của Quý khách và tìm hiểu các thông tin
                              này được sử dụng ra sao.
                            </p>
                          </div>
                          <div style="display: flex; align-items: center; gap: 2rem">

                                                                  <a style="color: var(--c-primary)" onclick="btnOpenEdit()"
                                                                    class="fw-bold  "
                                                                    >Chỉnh sửa</a
                                                                  >
                            <button style="color: var(--c-primary)"
                               class="fw-bold  "
                            >Lưu lại</button
                            >

                          </div>
                          <input

                                  name="profileUserId"
                                  style="display: none"
                                  type="text"
                                  value="<%=userHeader==null?"":userHeader.getUser_Id()==""?"":userHeader.getUser_Id()%>"
                          />

                        </div>
                        <div class="row section-01">
                          <div class="col-md-12 col-12 setting-wrap">

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Họ và Tên
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <span><%=userHeader==null?"":userHeader.getFullName()==null?"Chưa có thông tin":userHeader.getFullName()%></span>
<%--                                      <a onclick="btnHidden1()"--%>
<%--                                        class="fw-bold text-underline toggle-edit-form"--%>
<%--                                        >Chỉnh sửa</a--%>
<%--                                      >--%>
                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_name">
                                      <div class="edit-form-wrapper">
                                        <div class="form-group">
                                          
                                          <input
                                            class="form-control"
                                            id="Fullname"
                                            name="profileFullName"
                                            placeholder="Nhập họ và tên"
                                            type="text"
                                            value="<%=userHeader==null?"":userHeader.getFullName()==null?"":userHeader.getFullName()%>"
                                          />
                                        </div>
                                      </div>
<%--                                      <div class="text-end">--%>
<%--                                        <button--%>
<%--                                          class="btn btn-sm btn-secondary edit-form-submit"--%>
<%--                                          onclick="ChangeName()"--%>
<%--                                        >--%>
<%--                                          Xong--%>
<%--                                        </button>--%>
<%--                                      </div>--%>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Hạng
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <span><%=userHeader==null?"":userHeader.getUser_role()%></span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            
                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Loại thẻ
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <span><%=userHeader==null?"":userHeader.getBankCard()==null?"Chưa có thông tin":userHeader.getBankCard()%></span>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Địa chỉ Email
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p>
                                          <a
                                            href=""
                                            class="__cf_email__"
                                            data-cfemail="432d24363a262d2b34272237727a727103242e222a2f6d202c2e"
                                            ><%=userHeader==null?"":userHeader.getEmail()==null?"[Chưa có&#160;thông tin]":userHeader.getEmail()%></a
                                          >
                                        </p>
                                        <span> </span>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Số điện thoại
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p><%=userHeader==null?"":userHeader.getPhone()==null?"Chưa có thông tin":userHeader.getPhone()%></p>
                                      </div>

                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_sdt">
                                        <div class="edit-form-wrapper">
                                          <div class="form-group">
                                            <input
                                              class="form-control"
                                              id="Telephone"
                                              name="profileTelephone"
                                              placeholder="Số điện thoại"
                                              type="text"
                                              value="<%=userHeader==null?"":userHeader.getPhone()==null?"":userHeader.getPhone()%>"
                                            />
                                          </div>
                                        </div>

                                    </div>
                                    </div>
                                </div>
                              </div>
                                <!--  -->
                            </div>

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Ngày sinh
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p><%=userHeader==null?"":userHeader.getBirth()==null?"Chưa có thông tin":userHeader.getBirth().toString()%></p>
                                      </div>

                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_birthday">
                                      <div class="edit-form-wrapper">


                                            <div class="form-group">
                                              <label>Ngày sinh</label>
                                              <input
                                                type="date"
                                                id="birthDay"
                                                placeholder=""
                                                class="form-control"
                                                aria-describedby="birthDayBlock"
                                                name="profileDate"
                                                value="<%=userHeader==null?"":userHeader.getBirth()==null?"":userHeader.getBirth().toString()%>"
                                              />
                                            </div>



                                      </div>

                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">
                                Giới tính
                              </div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p><%=userHeader==null?"":userHeader.getGioiTinh()==null?"Chưa có thông tin":userHeader.getGioiTinh()%></p>
                                      </div>

                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_gender">
                                      <div class="edit-form-wrapper">
                                        <div class="form-group">
                                          <label>Giới tính</label>
                                          <select
                                                  name="profileGioiTinh"
                                            class="form-select"
                                            id="Gender"
                                            aria-label="Default select example"
                                          >
                                            <option value="">Chọn giới tính</option>
                                            <option value="Nam">Nam</option>
                                            <option value="Nữ">Nữ</option>
                                          </select>
                                        </div>
                                      </div>

                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">Địa chỉ</div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p><%=userHeader==null?"":userHeader.getDiaChi()==null?"Chưa có thông tin":userHeader.getDiaChi()%></p>
                                      </div>

                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_address">
                                      <div class="edit-form-wrapper">
                                        <div class="row">
                                          <div class="col-12">
                                            <div class="form-group">
                                              <label>Địa chỉ</label>
                                              <input
                                                class="form-control"
                                                id="Address"
                                                name="profileAddress"
                                                type="text"
                                                value="<%=userHeader==null?"":userHeader.getDiaChi()==null?"":userHeader.getDiaChi()%>"
                                              />
                                            </div>
                                          </div>
                                          <div class="col-6">
                                            <div class="form-group">
                                              <label>Tỉnh/TP</label>
                                              <select
                                                class="form-select"
                                                id="ProvinceId"

                                                onchange="GetDistrict(this)"
                                              >
                                                <option value="">Chọn tỉnh/tp</option>
                                                <option
                                                  value="5f451d79-fc4b-4569-b3d1-fa78adc187b3"
                                                >
                                                  An Giang
                                                </option>
                                                <option
                                                  value="332a5123-f3f8-4710-9526-140691edea17"
                                                >
                                                  B&#224; Rịa - Vũng T&#224;u
                                                </option>
                                                <option
                                                  value="bd1a0a88-7f78-4f62-bb3d-d09c095d2d6b"
                                                >
                                                  Bắc Cạn
                                                </option>
                                                <option
                                                  value="475866be-d734-4d0a-a54b-33ab97c2dc93"
                                                >
                                                  Bắc Giang
                                                </option>
                                                <option
                                                  value="b9ba5121-9916-4639-8e0e-33efd20bc01b"
                                                >
                                                  Bạc Li&#234;u
                                                </option>
                                                <option
                                                  value="86e1a0a0-c8e7-4092-b042-747c49d3aaea"
                                                >
                                                  Bắc Ninh
                                                </option>
                                                <option
                                                  value="6e5896d0-8a42-4fa8-b4d9-a07e618fc2d3"
                                                >
                                                  Bảo Lộc
                                                </option>
                                                <option
                                                  value="85fae77b-f2b0-4037-9e0f-79a3393e70cf"
                                                >
                                                  Bến Tre
                                                </option>
                                                <option
                                                  value="20915c37-95a9-47b9-a796-02a74de556fc"
                                                >
                                                  B&#236;nh Định
                                                </option>
                                                <option
                                                  value="65e18960-d080-403a-8f30-aae7af47930a"
                                                >
                                                  B&#236;nh Dương
                                                </option>
                                                <option
                                                  value="682753d8-e985-4375-8fe6-18a1bb9dcb31"
                                                >
                                                  B&#236;nh Phước
                                                </option>
                                                <option
                                                  value="064844ef-5bc4-4b2a-9168-461a5ccbddeb"
                                                >
                                                  B&#236;nh Thuận
                                                </option>
                                                <option
                                                  value="b7ea1002-0ec5-4c88-be5d-3326408ad7e4"
                                                >
                                                  C&#224; Mau
                                                </option>
                                                <option
                                                  value="99faba2a-fcc5-4a00-b97f-67fa3bb5c4f4"
                                                >
                                                  Cần Thơ
                                                </option>
                                                <option
                                                  value="a11bf9f2-61e4-474e-bf64-fad0694581a4"
                                                >
                                                  Cần Thơ
                                                </option>
                                                <option
                                                  value="4f98446d-d69f-458b-b87f-c6b9db6a5d38"
                                                >
                                                  Cao Bằng
                                                </option>
                                                <option
                                                  value="7de7451c-22b2-4c51-aada-8883df39164b"
                                                >
                                                  C&#244;n Đảo
                                                </option>
                                                <option
                                                  value="c704a1a3-be74-455a-b904-10c3c0ff3c3e"
                                                >
                                                  Đ&#224; Lạt
                                                </option>
                                                <option
                                                  value="5f4520e7-c63b-4c57-b417-d91091c2093a"
                                                >
                                                  Đ&#224; Nẵng
                                                </option>
                                                <option
                                                  value="27c6682f-c691-45e4-99b2-3c58ca24b5aa"
                                                >
                                                  Đắc Lắc
                                                </option>
                                                <option
                                                  value="5cc99b24-d2f9-4e38-8ee6-5b19159a4a3d"
                                                >
                                                  Đắc N&#244;ng
                                                </option>
                                                <option
                                                  value="77260d33-69e4-4d89-95fb-bc4c5e90b6f3"
                                                >
                                                  Đak Lak
                                                </option>
                                                <option
                                                  value="8bbe6159-4460-431f-9da1-bd7d1f29afc5"
                                                >
                                                  Điện Bi&#234;n
                                                </option>
                                                <option
                                                  value="ac91dfcc-3b79-4f5f-8c91-9c64731acee5"
                                                >
                                                  Đồng Nai
                                                </option>
                                                <option
                                                  value="7ee6a48a-51fe-40ef-ab42-cbb693c73c0d"
                                                >
                                                  Đồng Th&#225;p
                                                </option>
                                                <option
                                                  value="a6d7dba7-ee6c-4319-b068-cb019ee2faca"
                                                >
                                                  Gia Lai
                                                </option>
                                                <option
                                                  value="162ebfb2-bfd8-40a1-b170-cfdb192c8015"
                                                >
                                                  H&#224; Bắc
                                                </option>
                                                <option
                                                  value="cacc6309-2ba1-4997-b415-f89a184ff2e2"
                                                >
                                                  H&#224; Giang
                                                </option>
                                                <option
                                                  value="e1c0aaca-911e-4d79-aab5-3520002cad67"
                                                >
                                                  Hạ Long
                                                </option>
                                                <option
                                                  value="15ca14bc-e0fe-454e-82af-9157a8715b1f"
                                                >
                                                  H&#224; Nam
                                                </option>
                                                <option
                                                  value="c5fe8aff-4c66-4907-954d-a3d9577cfd09"
                                                >
                                                  H&#224; Nội
                                                </option>
                                                <option
                                                  value="3bbf16ad-5c91-41c4-879e-1660dae60ed8"
                                                >
                                                  H&#224; T&#226;y
                                                </option>
                                                <option
                                                  value="9854121c-3454-4b7b-a8e4-dacde80ac6b0"
                                                >
                                                  H&#224; Ti&#234;n
                                                </option>
                                                <option
                                                  value="2ec66fe1-8de7-4c49-abc1-16ead51c4423"
                                                >
                                                  H&#224; Tĩnh
                                                </option>
                                                <option
                                                  value="615048b8-3ebb-4ea3-ab57-c120d961459b"
                                                >
                                                  Hải Dương
                                                </option>
                                                <option
                                                  value="30fd906d-bbb2-47a5-82bc-7c9d5684bb88"
                                                >
                                                  Hải Ph&#242;ng
                                                </option>
                                                <option
                                                  value="64eb29e6-aed7-4876-aab0-93d157601062"
                                                >
                                                  HẬU GIANG
                                                </option>
                                                <option
                                                  value="76002619-5294-4ab4-a219-3be78868d550"
                                                >
                                                  Ho&#224; B&#236;nh
                                                </option>
                                                <option
                                                  value="825ca4ef-452e-48ba-be6a-1ff11519db98"
                                                >
                                                  Huế
                                                </option>
                                                <option
                                                  value="d9efa23a-a991-4d37-9b07-a262c732df90"
                                                >
                                                  Hưng Y&#234;n
                                                </option>
                                                <option
                                                  value="b584f16c-8dd4-48b8-9164-0ae324380dd0"
                                                >
                                                  Kh&#225;nh H&#242;a
                                                </option>
                                                <option
                                                  value="8137f0bf-8151-4fe3-809e-0fc4e91e3de7"
                                                >
                                                  Ki&#234;n Giang
                                                </option>
                                                <option
                                                  value="79fff2ae-c3df-4044-be83-284013477a07"
                                                >
                                                  Kom Tum
                                                </option>
                                                <option
                                                  value="ddb6abcc-8f5f-4443-8dcb-0a95453ed926"
                                                >
                                                  Lai Ch&#226;u
                                                </option>
                                                <option
                                                  value="5588580e-8662-4598-b51e-9c1057bd065c"
                                                >
                                                  L&#226;m Đồng
                                                </option>
                                                <option
                                                  value="0d454c8b-70e2-4cb3-9a90-c88564d05508"
                                                >
                                                  Lạng Sơn
                                                </option>
                                                <option
                                                  value="fdfb5f4c-6919-4d81-9fd2-c56be90a57f4"
                                                >
                                                  L&#224;o Cai
                                                </option>
                                                <option
                                                  value="50a18de1-c425-4874-a85f-bd23dc76a394"
                                                >
                                                  Long An
                                                </option>
                                                <option
                                                  value="0e1787bc-bdd6-4e14-a2d0-569abe01651f"
                                                >
                                                  Nam Định
                                                </option>
                                                <option
                                                  value="8e90a3bc-9d42-4f33-a2fc-33a9e218e814"
                                                >
                                                  Nghệ An
                                                </option>
                                                <option
                                                  value="05edcf1f-c950-4465-addc-10f6827ab752"
                                                >
                                                  Nha Trang
                                                </option>
                                                <option
                                                  value="2ba10470-dd7d-42ff-8e23-37430c19e801"
                                                >
                                                  Ninh B&#236;nh
                                                </option>
                                                <option
                                                  value="e68a2c40-095a-4cf3-a3ec-3c9c1af2de25"
                                                >
                                                  Ninh Thuận
                                                </option>
                                                <option
                                                  value="5c5837db-4eb6-4e44-a486-54d29d65d8dd"
                                                >
                                                  Phan Thiết
                                                </option>
                                                <option
                                                  value="80aaad72-03c8-449c-97ad-cfb26a1a215a"
                                                >
                                                  Ph&#250; Quốc
                                                </option>
                                                <option
                                                  value="60e66f73-241a-41ad-8b6b-3763ca9e0526"
                                                >
                                                  Ph&#250; Thọ
                                                </option>
                                                <option
                                                  value="5e4f05c1-d47a-4960-8c9d-d8e17b81b7d7"
                                                >
                                                  Ph&#250; Y&#234;n
                                                </option>
                                                <option
                                                  value="a51cccff-021d-4263-9aca-eb25d5bf0c16"
                                                >
                                                  Quảng B&#236;nh
                                                </option>
                                                <option
                                                  value="78327897-79b0-4226-8e9e-cf1288cfbde3"
                                                >
                                                  Quảng Nam
                                                </option>
                                                <option
                                                  value="6ca1ad59-801a-4a44-b0bf-f19051e70c82"
                                                >
                                                  Quảng Ng&#227;i
                                                </option>
                                                <option
                                                  value="e0f8e055-aecd-4a3a-a22b-2bd236de12fe"
                                                >
                                                  Quảng Ninh
                                                </option>
                                                <option
                                                  value="64e253f2-391d-4eb6-95ea-7d18d3cc3cab"
                                                >
                                                  Quảng Trị
                                                </option>
                                                <option
                                                  value="4506c020-f5ff-4357-89d2-0d1d6cfc98b7"
                                                >
                                                  Quy Nhơn
                                                </option>
                                                <option
                                                  value="aafe978d-81da-463a-ae08-fe79ce33be67"
                                                >
                                                  Rạch Gi&#225;
                                                </option>
                                                <option
                                                  value="a8ca2519-c622-4eb1-84ae-ec7aa608df3a"
                                                >
                                                  Sapa
                                                </option>
                                                <option
                                                  value="7f8f443e-9f45-42c5-9aec-1a0272b0264b"
                                                >
                                                  S&#243;c Trăng
                                                </option>
                                                <option
                                                  value="d1e70950-fb48-459a-9a56-956073ee8bfa"
                                                >
                                                  Sơn La
                                                </option>
                                                <option
                                                  value="cca87935-5033-4845-b570-112be4c001ea"
                                                >
                                                  T&#226;y Ninh
                                                </option>
                                                <option
                                                  value="ef2d6ac5-fbe5-48c3-a6c5-25e39fad27b5"
                                                >
                                                  Th&#225;i B&#236;nh
                                                </option>
                                                <option
                                                  value="55837ba0-6a83-4010-ae1e-91e1e522ccb8"
                                                >
                                                  Th&#225;i Nguy&#234;n
                                                </option>
                                                <option
                                                  value="6d910462-7f5e-4272-8c1c-7c84bcaaf03d"
                                                >
                                                  Thanh Ho&#225;
                                                </option>
                                                <option
                                                  value="33371d95-ad67-4e76-bc04-c8d23cdd3fcf"
                                                >
                                                  Tiền Giang
                                                </option>
                                                <option
                                                  value="ce934e15-eb2e-454c-8235-2d5bef57a855"
                                                >
                                                  TP. Hồ Ch&#237; Minh
                                                </option>
                                                <option
                                                  value="fa715535-a149-489c-bb68-85a954c6454c"
                                                >
                                                  Tr&#224; Vinh
                                                </option>
                                                <option
                                                  value="f5a5f58a-276b-4c46-924a-a97e6cb7ef39"
                                                >
                                                  Tr&#234;n t&#224;u hỏa
                                                </option>
                                                <option
                                                  value="3706319d-296d-4130-9f4d-899393521007"
                                                >
                                                  Trường Sa
                                                </option>
                                                <option
                                                  value="9e274bbf-621f-4656-b902-636a8699a75c"
                                                >
                                                  Tuy&#234;n Quang
                                                </option>
                                                <option
                                                  value="a671267e-92e7-46a5-9c8e-841ee5aa4a3d"
                                                >
                                                  Vĩnh Long
                                                </option>
                                                <option
                                                  value="d43f22b2-92a6-4e3c-ad27-38901996b2ae"
                                                >
                                                  Vĩnh Ph&#250;c
                                                </option>
                                                <option
                                                  value="f7ca90bc-bef8-41dc-9702-265f588f011b"
                                                >
                                                  Y&#234;n B&#225;i
                                                </option>
                                              </select>
                                            </div>
                                          </div>

                                        </div>
                                      </div>

                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="row setting-item">
                              <div class="col-md-3 col-12 setting-label">CMND</div>
                              <div class="col-md-9 col-12">
                                <div class="row">
                                  <div class="col-12 col-md-12">
                                    <div class="display-form">
                                      <div class="display-form-content">
                                        <p><%=userHeader==null?"":userHeader.getCMND()==null?"Chưa có thông tin":userHeader.getCMND()%></p>
                                      </div>

                                    </div>
                                    <div class="edit-form btn-hidden" id="edit_cmnd">
                                      <div class="edit-form-wrapper">
                                        <div class="row">
                                          <div class="col-12">
                                            <div class="form-group">
                                              <label>CMND/CCCD</label>
                                              <input
                                                class="form-control"
                                                id="IdCard"
                                                name="profileCmnd"
                                                type="text"
                                                value="<%=userHeader==null?"":userHeader.getCMND()==null?"":userHeader.getCMND()%>"
                                              />
                                            </div>
                                          </div>
                                          <div class="col-6">
                                            <div class="form-group">
                                              <label>Ngày cấp</label>
                                              <input
                                                class="form-control"
                                                data-val="true"
                                                data-val-date="The field DateOfIssueIdCard must be a date."
                                                id="DateOfIssueIdCard"
                                                max="2022-10-29"

                                                placeholder="DD/MM/YYYY"
                                                type="date"
                                                value="2022-10-29"
                                              />
                                            </div>
                                          </div>
                                          <div class="col-6">
                                            <div class="form-group">
                                              <label>Nơi cấp</label>
                                              <input
                                                class="form-control"
                                                id="PlaceOfIssueIdCard"

                                                type="text"
                                                value=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                      </div>

                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>

                          </div>
                          <div
                            class="col-md-3 col-3 my-auto right mx-auto text-center d-none"
                          >
                            <div class="mb-3 profile-picture mx-auto">
                              <a href="#">
                                <img
                                  src="../../images/mock-avatar.png"
                                  class="circle w-100"
                                />
                              </a>
                            </div>
                            <div class="file btn btn-outline-secondary mb-3">
                              Chọn ảnh
                              <input type="file"  />
                            </div>
                            <div class="text-center">
                              Dung lượng file tối da 1 MB <br />Định dạng: .JPEG, .PNG
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
            <script
              data-cfasync="false"
              src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
            ></script>
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

    <script>
      function btnHidden2() {
        var x = document.getElementById("edit_sdt");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }

      function btnHidden3() {
        var x = document.getElementById("edit_birthday");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }

      function btnHidden4() {
        var x = document.getElementById("edit_gender");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }


      function btnHidden6() {
        var x = document.getElementById("edit_address");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }

      function btnHidden7() {
        var x = document.getElementById("edit_cmnd");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
      }
      function btnOpenEdit() {
        console.log("open")
        var x = document.getElementById("edit_name");
        if (x.style.display === "none") {
          x.style.display = "block";
        } else {
          x.style.display = "none";
        }
        btnHidden2();
        btnHidden3();
        btnHidden4();
        btnHidden6();
        btnHidden7();
      }
    </script>
    <script src="./assets/js/main.js"></script>
    <script src="./assets/js/profile.js"></script>
</body>

</html>