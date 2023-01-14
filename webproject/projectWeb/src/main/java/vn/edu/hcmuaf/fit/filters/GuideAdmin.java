package vn.edu.hcmuaf.fit.filters;

import vn.edu.hcmuaf.fit.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "GuideAdmin",urlPatterns={

        "/admin/BookingTableData",
        "/admin/CRUDBookingTableData",
        "/admin/CRUDGuideData",
        "/admin/CRUDTourData",
        "/admin/CRUDVoucherData",
        "/admin/CustomerDataTable",
        "/admin/GuideTableData",
        "/admin/ReportTableData",
        "/admin/TourTableData",
        "/admin/VoucherTableData"

})
public class GuideAdmin implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(true);
        User user = (User) session.getAttribute("auth");
        if (user == null) {
            res.sendRedirect("/projectWeb_war/user/views/sign.jsp");
        }else if (user.getUser_role() > 0){
            if (user.getUser_role() > 1){
                chain.doFilter(request,response);
            }else{
                res.sendRedirect("/projectWeb_war/admin/Index");
            }

        }else{
            res.sendRedirect("/projectWeb_war/user/views/home");
        }
    }
}
