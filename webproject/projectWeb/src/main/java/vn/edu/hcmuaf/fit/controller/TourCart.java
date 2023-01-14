package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.TourDetailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TourCart", value = "/user/views/TourCart")
public class TourCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tour_id = request.getParameter("tourId");

        TourDetail tour = TourDetailService.getInstance().getTourDetail(tour_id);
        List<TourDetailType> tdt = TourDetailService.getInstance().getListType(tour_id);
        List<Voucher> voucher = TourDetailService.getInstance().getListVoucher(tour_id);
        request.setAttribute("tour",tour);

        request.setAttribute("tdt",tdt);
        request.setAttribute("voucher",voucher);
        request.getRequestDispatcher("Booking-Tour.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tour_id = request.getParameter("tourId");


        TourDetail tour = TourDetailService.getInstance().getTourDetail(tour_id);
        List<TourDetailType> tdt = TourDetailService.getInstance().getListType(tour_id);
        List<Voucher> voucher = TourDetailService.getInstance().getListVoucher(tour_id);
        request.setAttribute("tour",tour);

        request.setAttribute("tdt",tdt);
        request.setAttribute("voucher",voucher);
        request.getRequestDispatcher("Booking-Tour.jsp").forward(request,response);
    }
}
