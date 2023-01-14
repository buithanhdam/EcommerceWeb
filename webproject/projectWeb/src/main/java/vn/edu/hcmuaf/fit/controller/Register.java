package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/* Servlet Đăng ký
Được tạo bởi Bùi Thanh Đảm - 20130217

 */
@WebServlet(name = "Register", value = "/user/views/doRegister")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String confirm = request.getParameter("repeat-password");

        boolean check = UserService.getInstance().register(username,email,password,confirm);
        if (check){
            request.setAttribute("success", "Đã đăng ký thành công");
            request.setAttribute("route","sign");
            request.getRequestDispatcher("sign.jsp").forward(request, response);
        }else{
            request.setAttribute("errorRegister", "Tên người dùng hoặc email đã tồn tại");
            request.setAttribute("route","register");
            request.getRequestDispatcher("sign.jsp").forward(request, response);
        }
    }
}
