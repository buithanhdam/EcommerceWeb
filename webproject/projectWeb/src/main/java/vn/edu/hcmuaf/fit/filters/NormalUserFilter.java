package vn.edu.hcmuaf.fit.filters;

import vn.edu.hcmuaf.fit.bean.User;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "NormalUserFilter" ,urlPatterns={
        "/user/views/profile.jsp"
        ,"/user/views/Booking-Tour-card.jsp"
        ,"/user/views/Booking-Tour.jsp",
        "/user/views/Cart.jsp",
        "/user/views/order",
        "/user/views/review",
        "/user/views/comment"
})
public class NormalUserFilter implements Filter {
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
        }else {
            chain.doFilter(request,response);
        }

    }
}
