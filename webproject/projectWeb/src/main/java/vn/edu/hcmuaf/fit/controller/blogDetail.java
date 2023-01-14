package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.BlogImage;
import vn.edu.hcmuaf.fit.bean.Comment;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.DestinationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "blogDetail", value = "/user/views/blogDetail")
public class blogDetail extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String blog_id = request.getParameter("blogId");
        Blog blog = BlogService.getInstance().getBlogDetail(blog_id);
        List<BlogImage> blogImage = BlogService.getInstance().getListBlogImage(blog_id);
        List<Comment> blogComment = BlogService.getInstance().getListComment(blog_id);
        List<Destination> desList = DestinationService.getInstance().getDestination();
        List<Blog> ranList = BlogService.getInstance().getListRandomBlog();
        if (blog == null){

        }else{
            request.setAttribute("blog",blog);
            request.setAttribute("blogImage",blogImage);
            request.setAttribute("blogComment",blogComment);
            request.setAttribute("destinationList",desList);
            request.setAttribute("ranBlogs",ranList);
            request.getRequestDispatcher("blog-details.jsp").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
