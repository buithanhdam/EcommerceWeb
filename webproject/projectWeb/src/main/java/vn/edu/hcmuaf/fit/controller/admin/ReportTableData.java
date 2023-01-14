package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.DAO.BookingDAO;
import vn.edu.hcmuaf.fit.DAO.TourDAO;
import vn.edu.hcmuaf.fit.DAO.UserDAO;
import vn.edu.hcmuaf.fit.bean.Booking;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.BookingService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ReportTableData", value = "/admin/ReportTableData")
public class ReportTableData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listGuide = UserService.getInstance().getListGuide();
        request.setAttribute("listGuide", listGuide);

        List<Tour> listALlTour = TourService.getInstance().getAllTour();
        request.setAttribute("listAllTour", listALlTour);

        List<Booking> listBooking = BookingService.getInstance().getListBookingComplete();
        request.setAttribute("listBooking", listBooking);

        List<Tour> listTour = TourService.getInstance().getListTour();
        request.setAttribute("listTour", listTour);

        List<User> listKhachHang = UserService.getInstance().getListKhachHang();
        request.setAttribute("listKhachHang", listKhachHang);

        List<Tour> listPopularTour = TourService.getInstance().getListPopularTour();
        request.setAttribute("listPopularTour", listPopularTour);

        List<Tour> listSoldOutTour = TourService.getInstance().getSoldOutTour();
        request.setAttribute("listSoldOutTour", listSoldOutTour);

        List<Tour> listNewTour = TourService.getInstance().getNewTour();
        request.setAttribute("listNewTour", listNewTour);

        request.getRequestDispatcher("quan-ly-bao-cao.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
