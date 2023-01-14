<%@ page import="vn.edu.hcmuaf.fit.bean.User" %><%--
  Created by IntelliJ IDEA.
  User: MyPC
  Date: 12/16/2022
  Time: 2:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head>
<body>
<% User user =(User) session.getAttribute("auth");%>
<header class="app-header">
    <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
                                    aria-label="Hide Sidebar"></a>
    <!-- Navbar Right Menu-->
    <ul class="app-nav">
        <li title="Đăng xuất" ><a class="app-nav__item" style="background-color: var(--primary);color: white;" href="/projectWeb_war/user/views/signout"><i class="fa-solid fa-right-from-bracket"></i></a>

        </li>
        <li><a class="app-nav__item" style="background-color: var(--primary);color: white;" ><i class="fa-regular fa-comment"></i> </a></li>
        <li><a class="app-nav__item" style="background-color: var(--primary);color: white;" ><i class="fa-regular fa-bell"></i> </a></li>
        <div class="col-divide" style="background-color: rgb(185, 185, 185); width: 0.05rem;height: 100%; margin-right: 1rem;"></div>
        <li>
            <div class="app-header_user">
                <span class="app-header_user-name"><b><%=user==null?"":user.getFullName()==null?"Chưa có thông tin":user.getFullName()%></b></span>
                <img style="width: 40px; height: 40px" class="app-header_user-avatar" src="<%=user.getImageURL()==null?"./css/userDefaultImage.png":".."+user.getImageURL()%>"
                     alt="User Image">


            </div>
        </li>

        <!-- User Menu-->
    </ul>
</header>


</body>
</html>
