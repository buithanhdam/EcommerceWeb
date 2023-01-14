package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "contact", value = "/user/views/contact")
public class contact extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String guideId = (String) request.getParameter("guideId");
        User guide = UserService.getInstance().getGuideById(guideId);
        request.setAttribute("guide",guide);
        request.getRequestDispatcher("contact.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
