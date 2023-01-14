package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.CommentDAO;
import vn.edu.hcmuaf.fit.DAO.ReviewDAO;

public class WriteService {
    private static WriteService instance;
    private WriteService(){

    }
    public static WriteService getInstance(){
        if (instance == null) instance = new WriteService();
        return instance;
    }

    public boolean writeComment(String BLOG_ID ,String user_id,String comment,String ngayTao,int star){
        return CommentDAO.getInstance().createComment(BLOG_ID,user_id,comment,ngayTao,star);
    }
    public boolean writeReview(String tour_id,String user_id,String comment,String ngayTao,String category,int star){
        return ReviewDAO.getInstance().createReview(tour_id,user_id,comment,ngayTao,category,star);
    }
}
