package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CommentDAO {
    private static   CommentDAO instance;
    private CommentDAO(){

    }
    public static CommentDAO getInstance(){
        if (instance==null) instance = new CommentDAO();
        return instance;
    }

    public List<Comment> getListComment(String blog_id){
        List<Comment> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select user.FullName ,user.ImageURL ,BLOG_COMMENT.*  from BLOG_COMMENT inner join User on User.USER_ID =BLOG_COMMENT.USER_ID where BLOG_COMMENT.BLOG_ID   = ?")
                        .bind(0, blog_id)
                        .mapToBean(Comment.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o1.getNgayTao().getTime() >= o2.getNgayTao().getTime()?-1:1);
        return list ;
    }

    public boolean createComment(String BLOG_ID ,String user_id,String comment,String ngayTao,int star){
        Object o = JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into BLOG_COMMENT values (?,?,?,?,?)")
                        .bind(0,BLOG_ID )
                        .bind(1,user_id)
                        .bind(2,comment)
                        .bind(3,ngayTao)
                        .bind(4,star)
                        .execute()
        );
        return o==null?false:true;
    }
    public static void main(String[] args) {
        List<Comment> blogComment  = getInstance().getListComment("blog001");
        System.out.println(blogComment.size()==0?"1":"2");
    }
}
