package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.services.WriteService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "review", value = "/user/views/review")
public class review extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryComment = request.getParameter("categoryComment");
        int starComment = Integer.parseInt(request.getParameter("starComment"));
        String userIdComment = request.getParameter("userIdComment");
        String tourIdComment = request.getParameter("tourIdComment");
        String Comment = request.getParameter("Comment");
        String dateComment = request.getParameter("dateComment");
        WriteService.getInstance().writeReview(tourIdComment,userIdComment,Comment,dateComment,categoryComment,starComment);


        response.sendRedirect("/projectWeb_war/user/views/tourDetail?tourId="+tourIdComment);

    }
}
