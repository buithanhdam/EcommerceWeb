package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class Blog implements Serializable {
    private String fullName;
    private String BLOG_ID ;
    private String USER_ID ;
    private String DiaDiem_ID ;
    private String BLOG_TITLE ;
    private String Description ;
    private Date NgayVietBai ;
    private String ImageURL ;
    private String blog_category ;

    private int sumComment;
    public Blog(){

    }

    public Blog(String fullName, String BLOG_ID, String USER_ID, String diaDiem_ID, String BLOG_TITLE, String description, Date ngayVietBai, String imageURL, String blog_category) {
        this.fullName = fullName;
        this.BLOG_ID = BLOG_ID;
        this.USER_ID = USER_ID;
        DiaDiem_ID = diaDiem_ID;
        this.BLOG_TITLE = BLOG_TITLE;
        Description = description;
        NgayVietBai = ngayVietBai;
        ImageURL = imageURL;
        this.blog_category = blog_category;
    }

    // getter setter

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
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

    public String getDiaDiem_ID() {
        return DiaDiem_ID;
    }

    public void setDiaDiem_ID(String diaDiem_ID) {
        DiaDiem_ID = diaDiem_ID;
    }

    public String getBLOG_TITLE() {
        return BLOG_TITLE;
    }

    public void setBLOG_TITLE(String BLOG_TITLE) {
        this.BLOG_TITLE = BLOG_TITLE;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public Date getNgayVietBai() {
        return NgayVietBai;
    }

    public void setNgayVietBai(Date ngayVietBai) {
        NgayVietBai = ngayVietBai;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }

    public String getBlog_category() {
        return blog_category;
    }

    public void setBlog_category(String blog_category) {
        this.blog_category = blog_category;
    }

    public int getSumComment() {
        return sumComment;
    }

    public void setSumComment(int sumComment) {
        this.sumComment = sumComment;
    }
//

    @Override
    public String toString() {
        return "Blog{" +
                "fullName='" + fullName + '\'' +
                ", BLOG_ID='" + BLOG_ID + '\'' +
                ", USER_ID='" + USER_ID + '\'' +
                ", DiaDiem_ID='" + DiaDiem_ID + '\'' +
                ", BLOG_TITLE='" + BLOG_TITLE + '\'' +
                ", Description='" + Description + '\'' +
                ", NgayVietBai=" + NgayVietBai +
                ", ImageURL='" + ImageURL + '\'' +
                ", blog_category='" + blog_category + '\'' +
                '}';
    }
}
