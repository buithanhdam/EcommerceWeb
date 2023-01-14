package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "changePassword", value = "/user/views/changePassword")
public class changePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String user_id = request.getParameter("userId");
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        User curr = UserService.getInstance().getCurrentUserByIdAndPassword(user_id,oldPassword);
        if (curr != null){
            User user = UserService.getInstance().changeUserPassword(curr,newPassword);
            HttpSession session = request.getSession(true);
            session.removeAttribute("auth");
            session.setAttribute("auth",user);
            String resulText = "Đã thay đổi mật khẩu thành công";
            request.setAttribute("resultPasswordText",resulText);
            request.getRequestDispatcher("ChangePassword.jsp").forward(request,response);
        }else{
            String resulText = "Mật khẩu cũ không chính xác";
            request.setAttribute("resultPasswordText",resulText);
            request.getRequestDispatcher("ChangePassword.jsp").forward(request,response);
        }
    }
}
