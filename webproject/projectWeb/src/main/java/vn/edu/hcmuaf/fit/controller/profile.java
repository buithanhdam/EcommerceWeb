package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.ProfileService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "profile", value = "/user/views/profile")
public class profile extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String profileFullName = request.getParameter("profileFullName");
        String profileTelephone = request.getParameter("profileTelephone");
        String profileDate = request.getParameter("profileDate");
        String profileGioiTinh = request.getParameter("profileGioiTinh");
        String profileAddress = request.getParameter("profileAddress");
        String profileCmnd = request.getParameter("profileCmnd");
        String profileUserId = request.getParameter("profileUserId");

        User b = ProfileService.getInstance().updateUserProfile(profileUserId,profileFullName,profileTelephone,profileDate,profileGioiTinh,profileAddress,profileCmnd);
        if (b != null){
            HttpSession session = request.getSession(true);
            session.removeAttribute("auth");
            session.setAttribute("auth",b);
            request.getRequestDispatcher("profile.jsp").forward(request,response);
        }
    }
}
