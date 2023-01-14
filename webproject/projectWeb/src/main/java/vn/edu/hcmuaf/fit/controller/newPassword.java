package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "newPassword", value = "/user/views/newPassword")
public class newPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            boolean b = UserService.getInstance().newUserPassword(email,password);
            if (b){
                HttpSession session = request.getSession(true);
                session.removeAttribute("email");
                session.removeAttribute("otb");
                response.sendRedirect("/projectWeb_war/user/views/sign.jsp");
            }else{

            }

    }
}
