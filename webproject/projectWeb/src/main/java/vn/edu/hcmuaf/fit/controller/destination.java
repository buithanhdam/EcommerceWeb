package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.services.DestinationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "destination", value = "/user/views/destination")
public class destination extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Destination> list = DestinationService.getInstance().getDestination();
        request.setAttribute("desList",list);
        request.getRequestDispatcher("destination.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
