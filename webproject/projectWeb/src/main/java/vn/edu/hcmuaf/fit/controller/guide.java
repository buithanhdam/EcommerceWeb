package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "guide", value = "/user/views/guide")
public class guide extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<User> guideList = UserService.getInstance().getListGuide();
        request.setAttribute("guideList",guideList);
        request.getRequestDispatcher("guide.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
