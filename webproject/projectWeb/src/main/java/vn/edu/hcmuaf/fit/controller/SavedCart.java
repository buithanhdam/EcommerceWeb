package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.TourDetail;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.TourDetailService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "SavedCart", value = "/user/views/SavedCart")
public class SavedCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user !=null){
            String tourId =  request.getParameter("tourId");
            if (tourId != null){
                boolean b = TourDetailService.getInstance().likeTour(user.getUser_Id(),tourId);
                if (b==false){
                    TourDetailService.getInstance().unLikeTour(user.getUser_Id(),tourId);
                }
            }

            List<TourDetail> listTD = TourDetailService.getInstance().getListLikedTour(user.getUser_Id());
            request.setAttribute("listTD",listTD);
            request.getRequestDispatcher("Saved.jsp").forward(request,response);


        }else{
            response.sendRedirect("/projectWeb_war/user/views/sign.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
