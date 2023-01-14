package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.BlogDAO;
import vn.edu.hcmuaf.fit.DAO.CommentDAO;
import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.BlogImage;
import vn.edu.hcmuaf.fit.bean.Comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class BlogService {
    private static BlogService instance;
    private BlogService(){

    }
    public static BlogService getInstance(){
        if (instance==null) instance = new BlogService();
        return instance;
    }
    public List<Blog> getListBlog(){

        List<Blog> list =BlogDAO.getInstance().getListBlog();

        for (Blog blog:
             list) {
            int sumComment = getListComment(blog.getBLOG_ID()).size();
            blog.setSumComment(sumComment);
        }
        return list;
    }
    public List<Blog> findListBlogBySearchFilter(String searchBlogText,String searchBlogDiaDiem,String searchBlogCategory){
        List<String> list = new ArrayList<String>();
        if (searchBlogDiaDiem != "") list.add(" BLOG.DiaDiem_ID = '"+searchBlogDiaDiem+"' ");
        if (searchBlogCategory != "") list.add(" BLOG.blog_category = '"+searchBlogCategory+"' ");
        return BlogDAO.getInstance().findListBlogBySearchFilter(searchBlogText,list);
    }
    public List<Blog> getListRandomBlog(){
        return BlogDAO.getInstance().getListRandomBlog();
    }
    public Blog getBlogDetail(String blog_id){
        return BlogDAO.getInstance().getBlogDetail(blog_id);
    }
    public List<BlogImage> getListBlogImage(String blog_id){
        return BlogDAO.getInstance().getListBlogImage(blog_id);
    }
    public List<Comment> getListComment(String blog_id){
        return CommentDAO.getInstance().getListComment(blog_id);
    }
    public List<Blog> getListRecentBlog(){
        return  BlogDAO.getInstance().getListRecentBlog();
    }
    public boolean updateBlog(Map<String,String> map){return BlogDAO.getInstance().updateBlog(map);}
    public boolean createBlog(Map<String,String> map){return BlogDAO.getInstance().createBlog(map);}
    public boolean deleteBlog(String id){return BlogDAO.getInstance().deleteBlog(id);}
}
