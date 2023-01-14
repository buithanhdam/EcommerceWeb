package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Authorization", value = "/admin/Authorization")
public class Authorization extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String userId =request.getParameter("userId");
            String option = request.getParameter("option");
            String userRole = request.getParameter("userRole");
            if (option.equals("levelUp")){
               boolean b =  UserService.getInstance().AuthorizationUser(userId,option,userRole);
               if (b){
                   response.sendRedirect("/projectWeb_war/admin/Index");
               }
            }else{
                boolean b =  UserService.getInstance().AuthorizationUser(userId,option,userRole);
                if (b){
                    response.sendRedirect("/projectWeb_war/admin/Index");
                }
            }

    }
}
