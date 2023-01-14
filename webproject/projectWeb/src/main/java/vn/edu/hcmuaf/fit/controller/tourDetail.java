package vn.edu.hcmuaf.fit.controller;


import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.TourPackage;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.TourDetailService;
import vn.edu.hcmuaf.fit.services.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "tourDetail", value = "/user/views/tourDetail")
public class tourDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tour_id = request.getParameter("tourId");
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        boolean isLike = false;
        if (user != null){
            isLike = TourDetailService.getInstance().getLikedTourDetail(user.getUser_Id(),tour_id);
        }

        TourPackage tp = TourDetailService.getInstance().getTourPackageDetail(tour_id);
        List<Tour> ranlist = TourService.getInstance().getRandomListTour();
        if (tp == null){
            response.sendRedirect("/projectWeb_war/user/views/tour");
        }
        request.setAttribute("isLike",isLike);
        request.setAttribute("tourdetail",tp);
        request.setAttribute("tourrandom",ranlist);
        request.getRequestDispatcher("package-details.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
