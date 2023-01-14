package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.TourDetail;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.TourDetailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Calendar", value = "/admin/Calendar")
public class Calendar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
       User u = (User) session.getAttribute("auth");
       if (u == null){

           response.sendRedirect("/projectWeb_war/user/views/sign.jsp");
       }else{
           List<TourDetail> listTour = TourDetailService.getInstance().getListTourGuideCalendar(u.getUser_Id());
           request.setAttribute("listTour",listTour);
           request.getRequestDispatcher("page-calendar.jsp").forward(request,response);
       }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
