package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "categorySearch", value = "/user/views/categorySearch")
public class categorySearch extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchCategory = request.getParameter("searchCategory");
        List<Tour> list = TourService.getInstance().findListTourBySearchFilter("","",searchCategory,"","","","");
        List<Tour> incommingList = TourService.getInstance().getListIncomingTour();
        List<Destination> des = DestinationService.getInstance().getDestination();
        String textHide = searchCategory==""?null:" hạng mục: "+searchCategory;
        request.setAttribute("destinationList",des);
        request.setAttribute("list",list);
        request.setAttribute("text",textHide);
        request.setAttribute("incommingList",incommingList);
        request.getRequestDispatcher("package-sidebar.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
