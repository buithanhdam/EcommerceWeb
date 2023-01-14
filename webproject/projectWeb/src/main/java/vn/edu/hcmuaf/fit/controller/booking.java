package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.bean.TourCart;
import vn.edu.hcmuaf.fit.services.BookingService;
import vn.edu.hcmuaf.fit.services.TourDetailService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "booking", value = "/user/views/booking")
public class booking extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String password = request.getParameter("Password");
        HttpSession session = request.getSession(true);
        User user =(User) session.getAttribute("auth");
        TourCart tc = (TourCart) session.getAttribute("tc");
        Cart cart =(Cart) session.getAttribute("cart");
        if (user.getUser_password().equals(UserService.getInstance().hashPassword(password))){

            boolean b = BookingService.getInstance().createBooking(tc);
            if (b==true){
                session.removeAttribute("tc");
                cart.removeTourCart(tc.getTOUR_ID());
                response.sendRedirect("/projectWeb_war/user/views/order");
            }else{
                List<TourDetailType> tdt = TourDetailService.getInstance().getListType(tc.getTOUR_ID());
                List<Voucher> voucher = TourDetailService.getInstance().getListVoucher(tc.getTOUR_ID());
                request.setAttribute("tdt",tdt);
                request.setAttribute("voucher",voucher);
                request.setAttribute("textError","Số lượng vé Tour còn lại không đủ theo yêu cầu của quý khách");
                request.getRequestDispatcher("Booking-Tour-card.jsp").forward(request,response);
            }
        }else{
            List<TourDetailType> tdt = TourDetailService.getInstance().getListType(tc.getTOUR_ID());
            List<Voucher> voucher = TourDetailService.getInstance().getListVoucher(tc.getTOUR_ID());
            request.setAttribute("tdt",tdt);
            request.setAttribute("voucher",voucher);
            request.setAttribute("textError","Mật khẩu không chính xác");
            request.getRequestDispatcher("Booking-Tour-card.jsp").forward(request,response);
        }
    }
}
