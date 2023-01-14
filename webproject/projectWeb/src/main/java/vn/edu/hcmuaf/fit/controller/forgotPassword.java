package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.DAO.UserDAO;
import vn.edu.hcmuaf.fit.services.JavaMail;

import javax.mail.MessagingException;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "forgotPassword", value = "/user/views/forgotPassword")
public class forgotPassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ma = request.getParameter("ma");
        HttpSession session = request.getSession(true);
        String otp = (String) session.getAttribute("otb");
        if (otp.equals(ma)){
            request.getRequestDispatcher("forgotPassword-validate-newpass.jsp").forward(request,response);
        }else{
            request.setAttribute("error","Mã OTP không đúng");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request,response);

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");

        boolean b = UserDAO.getInstance().checkEmail(email);
        if (b){
            try {
                boolean otb = JavaMail.getInstance().getOTB(email);
                if (otb){
                    String otp = JavaMail.getInstance().OTP()+"";
                    HttpSession session = request.getSession(true);
                    session.setAttribute("otb",otp);

                    session.setAttribute("email",email);
                    request.getRequestDispatcher("forgotPassword-validate.jsp").forward(request,response);
                }else{
                    request.setAttribute("error","Lỗi gửi mail");
                    request.getRequestDispatcher("forgotPassword.jsp").forward(request,response);
                }

            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

        }else {
            request.setAttribute("error","Email chưa được đăng ký tài khoản");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request,response);
        }

    }
}
