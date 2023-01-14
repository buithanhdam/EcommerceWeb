package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.Destination;
import vn.edu.hcmuaf.fit.services.BlogService;
import vn.edu.hcmuaf.fit.services.DestinationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "blog", value = "/user/views/blog")
public class blog extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Blog> list = BlogService.getInstance().getListBlog();
        List<Destination> des = DestinationService.getInstance().getDestination();
        List<Blog> ranList = BlogService.getInstance().getListRandomBlog();
        request.setAttribute("destinationList",des);
        request.setAttribute("blogs",list);
        request.setAttribute("ranBlogs",ranList);
        request.getRequestDispatcher("blog-standard.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String searchBlogText = request.getParameter("searchBlogText");
        String searchBlogDiaDiem = request.getParameter("searchBlogDiaDiem");
        String searchBlogCategory = request.getParameter("searchBlogCategory");
        List<Blog> list = BlogService.getInstance().findListBlogBySearchFilter(searchBlogText,searchBlogDiaDiem,searchBlogCategory);
        List<Destination> des = DestinationService.getInstance().getDestination();
        List<Blog> ranList = BlogService.getInstance().getListRandomBlog();
        request.setAttribute("destinationList",des);
        request.setAttribute("blogs",list);
        request.setAttribute("ranBlogs",ranList);
        request.getRequestDispatcher("blog-standard.jsp").forward(request,response);

    }
}
