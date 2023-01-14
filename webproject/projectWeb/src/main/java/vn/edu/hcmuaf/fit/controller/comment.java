package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.BlogImage;
import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.DestinationService;
import vn.edu.hcmuaf.fit.services.WriteService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "comment", value = "/user/views/comment")
public class comment extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blog_id = request.getParameter("blogId");

        String userIdComment = request.getParameter("userIdComment");
        String blogIdComment = request.getParameter("blogIdComment");
        String Comment = request.getParameter("Comment");
        String dateComment = request.getParameter("dateComment");
        boolean b = WriteService.getInstance().writeComment(blogIdComment,userIdComment,Comment,dateComment,0);
        if ( b==false){

        }else{
            request.getRequestDispatcher("/projectWeb_war/user/views/?blogDetail="+blog_id).forward(request,response);
        }
    }
}
