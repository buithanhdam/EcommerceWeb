package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.Booking;
import vn.edu.hcmuaf.fit.services.BookingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CalendarDetail", value = "/admin/CalendarDetail")
public class CalendarDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tourId = request.getParameter("tourId");
        List<Booking> listBooking = BookingService.getInstance().getListBookingByTourId(tourId);
        request.setAttribute("listBooking",listBooking);
        request.getRequestDispatcher("page-calendar-detail.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
