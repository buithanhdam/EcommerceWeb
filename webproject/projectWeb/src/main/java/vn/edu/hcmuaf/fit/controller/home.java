package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet(name = "home", value = "/user/views/home")
public class home extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tour> popularTourList = TourService.getInstance().getListPopularTour();
        List<Destination> desList = DestinationService.getInstance().getDestination();
        List<Tour> incomTourList = TourService.getInstance().getListIncomingTour();
        Map<Integer,List<Tour>> voucherTourList = TourService.getInstance().getMapVoucherTour();
        List<User> guideList = UserService.getInstance().getListGuide();
        List<Blog> blogList = BlogService.getInstance().getListRecentBlog();


        request.setAttribute("popularTourList",popularTourList);
        request.setAttribute("desList",desList);
        request.setAttribute("incomTourList",incomTourList);
        request.setAttribute("voucherTourList",voucherTourList);
        request.setAttribute("guideList",guideList);
        request.setAttribute("blogList",blogList);

        request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
