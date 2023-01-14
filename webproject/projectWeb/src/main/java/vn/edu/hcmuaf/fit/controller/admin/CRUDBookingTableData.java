package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.BookingService;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet(name = "CRUDBookingTableData", value = "/admin/CRUDBookingTableData")
public class CRUDBookingTableData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> listKH = UserService.getInstance().getListKhachHang();
        List<Tour> listTour = TourService.getInstance().getListTour();
        request.setAttribute("listKH",listKH);
        request.setAttribute("listTour",listTour);
        request.getRequestDispatcher("form-add-don-hang.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        String bookingUserId = request.getParameter("bookingUserId");
        String bookingTourId = request.getParameter("bookingTourId");
        String bookingDate = request.getParameter("bookingDate");
        String bookingHoTen = request.getParameter("bookingHoTen");
        String bookingEmail = request.getParameter("bookingEmail");
        String bookingPhone = request.getParameter("bookingPhone");
        String bookingDiaChi = request.getParameter("bookingDiaChi");
        String bookingSLVNL = request.getParameter("bookingSLVNL");
        String bookingSLVTE = request.getParameter("bookingSLVTE");
        String bookingTrangThai = request.getParameter("bookingTrangThai");
        String bookingDescription = request.getParameter("bookingDescription");

        Booking tc = new Booking();
        tc.setBOOKING_ID(bookingId);
        tc.setUSER_ID(bookingUserId);
        tc.setTOUR_ID(bookingTourId);
        tc.setNgayTao(Date.valueOf(bookingDate));
        tc.setHoTen(bookingHoTen);
        tc.setEmail(bookingEmail);
        tc.setPhone(bookingPhone);
        tc.setDiaChi(bookingDiaChi);
        tc.setSOLUONG_VENGUOILON(Integer.parseInt(bookingSLVNL));
        tc.setSOLUONG_VETREEM(Integer.parseInt(bookingSLVTE));
        tc.setTRANGTHAI(Integer.parseInt(bookingTrangThai));
        tc.setDescription(bookingDescription);
        tc.setSOLUONG(Integer.parseInt(bookingSLVNL)+Integer.parseInt(bookingSLVTE));
        if (bookingId.equals("")){


            boolean b = BookingService.getInstance().createBookingAdmin(tc);
            if (b){

                response.sendRedirect("/projectWeb_war/admin/BookingTableData");
            }else {
                String text = "Tạo mới không thành công vì số lượng còn lại của Tour: "+tc.getTOUR_ID()+" bé hơn số lượng vé yêu cầu "+tc.getSOLUONG();
                request.setAttribute("error",text);

                List<User> listKH = UserService.getInstance().getListKhachHang();
                List<Tour> listTour = TourService.getInstance().getListTour();
                request.setAttribute("listKH",listKH);
                request.setAttribute("listTour",listTour);
                request.getRequestDispatcher("form-add-don-hang.jsp").forward(request, response);
            }
        }else{
            boolean b = BookingService.getInstance().updateBookingAdmin(tc);
            if (b){

                response.sendRedirect("/projectWeb_war/admin/BookingTableData");
            }else {
                String text = "Sửa không thành công vì số lượng còn lại của Tour: "+tc.getTOUR_ID()+" bé hơn số lượng vé yêu cầu "+tc.getSOLUONG();
                request.setAttribute("error",text);

                List<User> listKH = UserService.getInstance().getListKhachHang();
                List<Tour> listTour = TourService.getInstance().getListTour();
                request.setAttribute("listKH",listKH);
                request.setAttribute("listTour",listTour);
                request.getRequestDispatcher("form-add-don-hang.jsp").forward(request, response);
            }
        }


    }
}
