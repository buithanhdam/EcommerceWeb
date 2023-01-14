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

@WebServlet(name = "tour", value = "/user/views/tour")
public class tour extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Tour> list = TourService.getInstance().getListTour();
        List<Tour> incommingList = TourService.getInstance().getListIncomingTour();
        List<Destination> des = DestinationService.getInstance().getDestination();
        request.setAttribute("list",list);
        request.setAttribute("incommingList",incommingList);

        request.setAttribute("destinationList",des);
        request.getRequestDispatcher("package-sidebar.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String text = (String) request.getParameter("search");
        List<Tour> incommingList = TourService.getInstance().getListIncomingTour();
        List<Destination> des = DestinationService.getInstance().getDestination();

        if (text !=null){
            String textHide = text==""?null:" từ khóa: "+text;
            List<Tour> list = TourService.getInstance().getListBySearchText(text);
            request.setAttribute("list",list);
            request.setAttribute("text",textHide);

            request.setAttribute("destinationList",des);
            request.setAttribute("incommingList",incommingList);
            request.getRequestDispatcher("package-sidebar.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }

    }
}
