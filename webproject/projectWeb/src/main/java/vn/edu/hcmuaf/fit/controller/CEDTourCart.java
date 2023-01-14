package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.bean.TourCart;
import vn.edu.hcmuaf.fit.services.TourDetailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "CEDTourCart", value = "/user/views/CEDTourCart")
public class CEDTourCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tourId = request.getParameter("tourId");
        HttpSession session = request.getSession(true);
        Cart cart =(Cart) session.getAttribute("cart");

        cart.removeTourCart(tourId);
        response.sendRedirect("Cart.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String bookingName = request.getParameter("bookingFullName");
        String bookingEmail = request.getParameter("bookingEmail");
        String bookingPhone = request.getParameter("bookingPhone");
        String bookingDiachi = request.getParameter("bookingDiachi");
        String bookingAdultTicket = request.getParameter("bookingAdultTicket");
        String bookingChildTicket = request.getParameter("bookingChildTicket");
        String thanhTien = request.getParameter("thanhTien");
        String userId = request.getParameter("userId");
        String tourId = request.getParameter("tourId");
        String bookingDate = request.getParameter("bookingDate");
        String bookingDescription = request.getParameter("bookingDescription");
        String option = request.getParameter("option");
        //
        TourCart tc = new TourCart();
        TourDetail td = TourDetailService.getInstance().getTourDetail(tourId);
        tc.setTOUR_ID(td.getTOUR_ID());
        tc.setTourName(td.getTourName());
        tc.setTrangThaiTour(td.getTrangThai());
        tc.setNgayKhoiHanh(td.getNgayKhoiHanh());
        tc.setNgayKetThuc(td.getNgayKetThuc());
        tc.setImageURL(td.getImageURL());
        tc.setUSER_ID(userId);
        tc.setHoTen(bookingName);
        tc.setEmail(bookingEmail);
        tc.setPhone(bookingPhone);
        tc.setDiaChi(bookingDiachi);
        tc.setSOLUONG_VENGUOILON(Integer.parseInt(bookingAdultTicket));
        tc.setSOLUONG_VETREEM(Integer.parseInt(bookingChildTicket));
        tc.setSOLUONG(Integer.parseInt(bookingAdultTicket)+Integer.parseInt(bookingChildTicket));
        tc.setNgayTao(Date.valueOf(bookingDate));
        tc.setDescription(bookingDescription);
        tc.setTongTien(Float.parseFloat(thanhTien));
        HttpSession session = request.getSession(true);
        Cart cart =(Cart) session.getAttribute("cart");
        if (option.equals("addToCart")){
            cart.addTourCart(tc);
            System.out.println(cart.getListTourCart().toString());
            response.sendRedirect("Cart.jsp");
        }else if (option.equals("goToBookingCard")){
            session.removeAttribute("tc");
            session.setAttribute("tc",tc);
            List<TourDetailType> tdt = TourDetailService.getInstance().getListType(tc.getTOUR_ID());
            List<Voucher> voucher = TourDetailService.getInstance().getListVoucher(tc.getTOUR_ID());
            request.setAttribute("tdt",tdt);
            request.setAttribute("voucher",voucher);
            request.getRequestDispatcher("Booking-Tour-card.jsp").forward(request,response);
        }
    }
}
