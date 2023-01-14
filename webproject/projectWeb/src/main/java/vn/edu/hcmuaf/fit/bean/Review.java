package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class Review implements Serializable {
    private String TOUR_ID;
    private String user_id;
    private String fullName;
    private String imageURL;
    private String Comment ;

    private Date NgayTao;

    private String Category ;
    private int Stars;
    //non constructor
    public Review(){

    }
    // constructor

    public Review(String TOUR_ID,String user_id, String fullName, String imageURL, String comment, Date ngayTao,String Category, int stars) {
        this.TOUR_ID = TOUR_ID;
        this.user_id = user_id;
        this.fullName = fullName;
        this.imageURL = imageURL;
        this.Comment = comment;
        this.NgayTao = ngayTao;
        this.Category = Category;
        this.Stars = stars;
    }


    //getter setter


    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
    }
    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
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

    public String getCategory() {
        return Category;
    }

    public void setCategory(String category) {
        Category = category;
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
        return "Review{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", user_id='" + user_id + '\'' +
                ", fullName='" + fullName + '\'' +
                ", imageURL='" + imageURL + '\'' +
                ", Comment='" + Comment + '\'' +
                ", NgayTao=" + NgayTao +
                ", Category='" + Category + '\'' +
                ", Stars=" + Stars +
                '}';
    }
}
