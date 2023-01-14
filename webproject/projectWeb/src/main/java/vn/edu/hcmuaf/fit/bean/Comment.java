package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class Comment implements Serializable {

    private String fullName;
    private String imageURL;
    private String BLOG_ID ;
    private String USER_ID ;
    private String Comment ;
    private Date NgayTao;
    private int Stars ;

    public Comment(){

    }

    public Comment(String fullName, String imageURL, String BLOG_ID, String USER_ID, String comment, Date ngayTao, int stars) {
        this.fullName = fullName;
        this.imageURL = imageURL;
        this.BLOG_ID = BLOG_ID;
        this.USER_ID = USER_ID;
        Comment = comment;
        NgayTao = ngayTao;
        Stars = stars;
    }

    //getter setter


    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getBLOG_ID() {
        return BLOG_ID;
    }

    public void setBLOG_ID(String BLOG_ID) {
        this.BLOG_ID = BLOG_ID;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getComment() {
        return Comment;
    }

    public void setComment(String comment) {
        Comment = comment;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(Date ngayTao) {
        NgayTao = ngayTao;
    }

    public int getStars() {
        return Stars;
    }

    public void setStars(int stars) {
        Stars = stars;
    }
    //

    @Override
    public String toString() {
        return "Comment{" +
                "fullName='" + fullName + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", BLOG_ID='" + BLOG_ID + '\'' +
                ", USER_ID='" + USER_ID + '\'' +
                ", Comment='" + Comment + '\'' +
                ", NgayTao=" + NgayTao +
                ", Stars=" + Stars +
                '}';
    }
}
