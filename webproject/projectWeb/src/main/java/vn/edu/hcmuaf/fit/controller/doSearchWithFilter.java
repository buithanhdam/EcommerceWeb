package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

/* Servlet tìm kiếm các thông tin về 1 Tour
Được tạo bởi Bùi Thanh Đảm - 20130217

 */
@WebServlet(name = "doSearchWithFilter", value = "/user/views/doSearchWithFilter")
public class doSearchWithFilter extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchDiaDiem = request.getParameter("searchDiaDiem");
        List<Tour> list = TourService.getInstance().findListTourBySearchFilter("",searchDiaDiem,"","","","","");
        List<Tour> incommingList = TourService.getInstance().getListIncomingTour();
        List<Destination> des = DestinationService.getInstance().getDestination();
        String textHide = searchDiaDiem==""?null:" địa điểm: "+searchDiaDiem;
        request.setAttribute("destinationList",des);
        request.setAttribute("list",list);
        request.setAttribute("text",textHide);
        request.setAttribute("incommingList",incommingList);
        request.getRequestDispatcher("package-sidebar.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchText = request.getParameter("searchText");
        String searchDiaDiem = request.getParameter("searchDiaDiem");
        String searchCategory = request.getParameter("searchText");
        String searchDay = request.getParameter("searchDay");
        String searchPrice = request.getParameter("searchPrice");
        String searchPersons = request.getParameter("searchPersons");
        String searchDate = request.getParameter("searchDate");

        float giaVe= Float.parseFloat(searchPrice);
        Locale locale = new Locale("vi");
        NumberFormat format =  NumberFormat.getCurrencyInstance(locale);
        String giaVeString = format.format(giaVe).split(",")[0];

        String giaVeText = giaVe <=20000000 ?"dưới "+giaVeString:"trên "+giaVeString;

        String ttextHide = searchText==""?"":" từ khóa: "+searchText;
        String ddtextHide = searchDiaDiem==""?"":" địa điểm: "+searchDiaDiem;
        String ctextHide = searchCategory==""?"":" hạng mục: "+searchCategory;
        String dtextHide = searchDay==""?"":" số ngày: "+searchDay;
        String ptextHide = searchPrice==""?"":" giá: "+giaVeText;
        String pstextHide = searchPersons==""?"":" số người: "+searchPersons;
        String datextHide = searchDate==""?"":" ngày: "+searchDate;

        String textHide = (ttextHide+ddtextHide+ctextHide+dtextHide+ptextHide+pstextHide+datextHide).length()==0
                ?null:(ttextHide+ddtextHide+ctextHide+dtextHide+ptextHide+pstextHide+datextHide);


        List<Tour> list = TourService.getInstance().findListTourBySearchFilter(searchText,searchDiaDiem,searchCategory,searchDay,searchPrice,searchPersons,searchDate);
        List<Tour> incommingList = TourService.getInstance().getListIncomingTour();
        List<Destination> des = DestinationService.getInstance().getDestination();
        request.setAttribute("destinationList",des);
        request.setAttribute("text",textHide);
        request.setAttribute("list",list);
        request.setAttribute("incommingList",incommingList);
        request.getRequestDispatcher("package-sidebar.jsp").forward(request,response);
    }
}
