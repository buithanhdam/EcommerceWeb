package vn.edu.hcmuaf.fit.controller.admin;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GuideTableData", value = "/admin/GuideTableData")
public class GuideTableData extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<User> guideList = UserService.getInstance().getListGuide();
        request.setAttribute("guideList",guideList);
        request.getRequestDispatcher("table-data-table.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String option = request.getParameter("option");
        String guideId = request.getParameter("guideId");
        if (option.equals("edit")){
            User user = UserService.getInstance().getGuideById(guideId);
            request.setAttribute("guide",user);
            request.getRequestDispatcher("form-add-nhan-vien.jsp").forward(request,response);
        } else if (option.equals("delete")) {
            boolean b = UserService.getInstance().deleteGuide(guideId);
            if (b){
                List<User> guideList = UserService.getInstance().getListGuide();
                request.setAttribute("guideList",guideList);
                request.getRequestDispatcher("table-data-table.jsp").forward(request,response);
            }else{
                String text = "Xóa không thành công";
                request.setAttribute("error",text);
                request.getRequestDispatcher("table-data-table.jsp").forward(request,response);
            }
        }

    }
}
