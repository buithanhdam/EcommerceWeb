package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.DAO.AboutUsDAO;
import vn.edu.hcmuaf.fit.bean.AboutUs;
import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.TourDetailService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "aboutUs", value = "/user/views/aboutUs")
public class aboutUs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        AboutUs au = AboutUsDAO.getInstance().getAboutUs();
        List<AboutUs> lau = AboutUsDAO.getInstance().getListAboutUs(au.getAboutus_id());
        List<Tour> lt = TourService.getInstance().getAllTour();
        List<Blog> lb =BlogService.getInstance().getListRecentBlog();
        List<User> lu = UserService.getInstance().getListKhachHang();
        request.setAttribute("lb",lb);
        request.setAttribute("lt",lt);
        request.setAttribute("lu",lu);
        request.setAttribute("au",au);
        request.setAttribute("lau",lau);

        request.getRequestDispatcher("about.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
