package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.services.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TourTableData", value = "/admin/TourTableData")
public class TourTableData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tour> tourList = TourService.getInstance().getAllTour();
        request.setAttribute("tourList", tourList);
        request.getRequestDispatcher("table-data-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        String tourId = request.getParameter("tourId");
        if (option.equals("edit")){
            TourPackage tour = TourDetailService.getInstance().getTourPackageDetail(tourId);
            request.setAttribute("tour",tour);
            List<User> guides = UserService.getInstance().getListGuide();
            List<Voucher> vouchers = VoucherService.getInstance().getVoucherList();
            List<Destination> dess = DestinationService.getInstance().getDestination();
            List<User> guideBusys = UserService.getInstance().getListGuideOnBusy();

            request.setAttribute("guides",guides);
            request.setAttribute("vouchers",vouchers);
            request.setAttribute("dess",dess);
            request.setAttribute("guideBusys",guideBusys);

            request.getRequestDispatcher("form-add-san-pham.jsp").forward(request, response);
        } else if (option.equals("delete")) {
            boolean b = TourDetailService.getInstance().deleteTour(tourId);
            if (b){
                String text = "Xóa thành công";
                request.setAttribute("error",text);
                List<Tour> tourList = TourService.getInstance().getAllTour();
                request.setAttribute("tourList", tourList);
                request.getRequestDispatcher("table-data-product.jsp").forward(request,response);
            }else{
                String text = "Xóa không thành công";
                request.setAttribute("error",text);
                List<Tour> tourList = TourService.getInstance().getAllTour();
                request.setAttribute("tourList", tourList);
                request.getRequestDispatcher("table-data-product.jsp").forward(request,response);
            }
        }else if (option.equals("sell")){

        }
    }
}
