package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.bean.BlogImage;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.*;
import java.util.stream.Collectors;

public class BlogDAO {
    private static BlogDAO instance;

    private  BlogDAO(){}

    public static BlogDAO getInstance(){
        if (instance == null) instance = new BlogDAO();
        return instance;
    }

    public List<Blog> getListBlog(){
        List<Blog> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select user.FullName ,blog.* from blog inner join USER on USER.user_id = blog.user_id where user.USER_Role >=1")
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
                );

        return list;
    }
    public List<Blog> getListRecentBlog(){
        List<Blog> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select user.FullName ,blog.* from blog inner join USER on USER.user_id = blog.user_id where user.USER_Role >=1")
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o1.getNgayVietBai().getTime() >= o2.getNgayVietBai().getTime()?-1:1);

        return list.size()>=3?list.subList(0,3):list;
    }

    public List<Blog> findListBlogBySearchFilter(String searchText,List<String> liststring){
        String query = "";
        for (String string:
                liststring) {
            query += " and "+string;
        }
        String  textSearchquery = "";
        if (searchText != "") textSearchquery = " and BLOG_TITLE LIKE '%"+searchText+"%' OR BLOG_TITLE LIKE '"+searchText+"%' or BLOG_TITLE LIKE '%"+searchText+"' ";

        String finalQuery = query;

        String finalTextSearchquery = textSearchquery;
        List<Blog> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select user.FullName ,blog.* from blog inner join USER on USER.user_id = blog.user_id where user.USER_Role >=1 "+
                                finalTextSearchquery + finalQuery)
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public List<Blog> getListRandomBlog(){
        List<Blog> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select user.FullName ,blog.* from blog inner join USER on USER.user_id = blog.user_id where user.USER_Role >=1")
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        Random random = new Random();
        List<Blog> result = new ArrayList<Blog>();
        for (int i = 0; i < 4; i++) {
            int j = random.nextInt(list.size());
            result.add(list.get(j));
        }
        return result;
    }
    public Blog getBlogDetail(String blog_id){
        List<Blog> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select user.FullName ,blog.* from blog inner join USER on USER.user_id = blog.user_id where user.USER_Role >=1 and blog.BLOG_ID = ?")
                        .bind(0,blog_id)
                        .mapToBean(Blog.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (list.size()!=1) return null;
        return list.get(0);
    }
    public List<BlogImage> getListBlogImage(String blog_id){
        List<BlogImage> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select * from BLOG_IMAGE  where BLOG_IMAGE.blog_id = ?")
                        .bind(0,blog_id)
                        .mapToBean(BlogImage.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public boolean createBlog(Map<String,String> map){
        Random random = new Random();
        String id ="Blog"+ (random.nextInt(9999000));
        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("insert into BLOG values (?,?,?,?,?,?,?,?)")
                        .bind(0,id)
                        .bind(1,map.get("blogUserId"))
                        .bind(2,map.get("blogDiaDiem"))
                        .bind(3,map.get("blogTitle"))
                        .bind(4,map.get("blogDescription"))
                        .bind(5,map.get("blogDate"))

                        .bind(6,map.get("ImageUpload"))
                        .bind(7,map.get("blogCategory"))

                        .execute()
        );
        if (row != 1) return false;
        return true;
    }
    public boolean deleteBlog(String id){
        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("delete from BLOG where BLOG_ID = ?")
                        .bind(0,id)
                        .execute()
        );
        if (row != 1) return false;
        return true;
    }

    public boolean updateBlog(Map<String,String> map){
        int row = 0;
        String id = map.get("blogID");
    if (map.get("ImageUpload")==null){
        row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("update BLOG " +
                                "set  USER_ID=?,DiaDiem_ID=?,BLOG_TITLE=?,Description=?,NgayVietBai=?,blog_category=? " +
                                "where BLOG_ID =?")

                        .bind(0,map.get("blogUserId"))
                        .bind(1,map.get("blogDiaDiem"))
                        .bind(2,map.get("blogTitle"))
                        .bind(3,map.get("blogDescription"))
                        .bind(4,map.get("blogDate"))
                        .bind(5,map.get("blogCategory"))
                        .bind(6,id)
                        .execute()
        );
    }else{
        row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("update BLOG " +
                                "set  USER_ID=?,DiaDiem_ID=?,BLOG_TITLE=?,Description=?,NgayVietBai=?,ImageURL=?,blog_category=? " +
                                "where BLOG_ID =?")

                        .bind(0,map.get("blogUserId"))
                        .bind(1,map.get("blogDiaDiem"))
                        .bind(2,map.get("blogTitle"))
                        .bind(3,map.get("blogDescription"))
                        .bind(4,map.get("blogDate"))

                        .bind(5,map.get("ImageUpload"))
                        .bind(6,map.get("blogCategory"))
                        .bind(7,id)
                        .execute()
        );
    }

        if (row != 1) return false;
        return true;
    }

    public static void main(String[] args) {
        Map<String ,String > map = new HashMap<>();
        map.put("1","1");
        map.put("2","2");

        System.out.println(map.get("3")==null?true:false);
    }


}
