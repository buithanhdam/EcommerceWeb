package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Booking;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BookingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "order", value = "/user/views/order")
public class order extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        String cancel = request.getParameter("cancel");
        if (cancel !=null) {
            boolean b = BookingService.getInstance().cancelBooking(cancel,user.getUser_Id());

        }

        List<Booking> listBooking = BookingService.getInstance().getListBookingByUserId(user.getUser_Id());
        request.setAttribute("listBooking",listBooking);
        request.getRequestDispatcher("Order.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
