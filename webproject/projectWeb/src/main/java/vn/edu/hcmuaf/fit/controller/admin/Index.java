package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Booking;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.TourDetail;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BookingService;
import vn.edu.hcmuaf.fit.services.TourDetailService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Index", value = "/admin/Index")
public class Index extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<TourDetail> listTD = TourDetailService.getInstance().getListIncomingSoldOutTour();
        List<User> listKH = UserService.getInstance().getListKhachHang();
        List<Booking> listBM = BookingService.getInstance().getListBookingByMonth();
        List<Tour> listT = TourService.getInstance().getListTour();
        List<Booking> listB = BookingService.getInstance().getListBooking();
        List<User> listEmployee = UserService.getInstance().getListEmployee();
        request.setAttribute("error",request.getAttribute("error"));
        request.setAttribute("listTD",listTD);
        request.setAttribute("listKH",listKH);
        request.setAttribute("listB",listB);
        request.setAttribute("listT",listT);
       request.setAttribute("listBM",listBM);
       request.setAttribute("listEmployee",listEmployee);
       request.setAttribute("error",request.getAttribute("error"));
       request.getRequestDispatcher("index.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
