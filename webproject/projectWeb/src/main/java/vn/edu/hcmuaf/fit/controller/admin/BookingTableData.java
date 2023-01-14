package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BookingTableData", value = "/admin/BookingTableData")
public class BookingTableData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Booking> bookingList = BookingService.getInstance().getListBooking();
        request.setAttribute("bookingList", bookingList);
        request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        String bookingId = request.getParameter("bookingId");
        if (option.equals("edit")) {
            Booking booking = BookingService.getInstance().getBookingById(bookingId);
            request.setAttribute("booking",booking);
            List<User> listKH = UserService.getInstance().getListKhachHang();
            List<Tour> listTour = TourService.getInstance().getListTour();
            request.setAttribute("listKH",listKH);
            request.setAttribute("listTour",listTour);
            request.getRequestDispatcher("form-add-don-hang.jsp").forward(request, response);
        } else if (option.equals("delete")) {
            boolean b = BookingService.getInstance().adminDeleteBooking(bookingId);
            if (b){
                String text = "Xóa đơn hàng "+bookingId+" thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }else{
                String text = "Xóa đơn hàng "+bookingId+" không thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }
        } else if (option.equals("submit")) {
            boolean b = BookingService.getInstance().adminSubmitBooking(bookingId);
            if (b){
                String text = "Xác nhận đơn hàng "+bookingId+" thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }else{
                String text = "Xác nhận đơn hàng "+bookingId+" không thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }
        }else if(option.equals("cancel")) {
            boolean b = BookingService.getInstance().adminCancelBooking(bookingId);
            if (b){
                String text = "Hủy đơn hàng "+bookingId+" thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }else{
                String text = "Hủy đơn hàng "+bookingId+" không thành công";
                request.setAttribute("error",text);
                List<Booking> bookingList = BookingService.getInstance().getListBooking();
                request.setAttribute("bookingList", bookingList);
                request.getRequestDispatcher("table-data-oder.jsp").forward(request,response);
            }
        } else if (option.equals("submitIndex")) {
            boolean b = BookingService.getInstance().adminSubmitBooking(bookingId);
            if (b){
                String text = "Xác nhận đơn hàng "+bookingId+"  thành công";
                request.setAttribute("error",text);
                response.sendRedirect("/projectWeb_war/admin/Index");
            }else{
                String text = "Xác nhận đơn hàng "+bookingId+" không thành công";
                request.setAttribute("error",text);
               response.sendRedirect("/projectWeb_war/admin/Index");
            }
        }
    }
}
