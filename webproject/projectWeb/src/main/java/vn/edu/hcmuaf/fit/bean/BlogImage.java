package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class BlogImage implements Serializable {
    private String BLOG_ID ;
    private String ImageURL ;
    public  BlogImage(){

    }

    public BlogImage(String BLOG_ID, String imageURL) {
        this.BLOG_ID = BLOG_ID;
        ImageURL = imageURL;
    }

    //getter setter

    public String getBLOG_ID() {
        return BLOG_ID;
    }

    public void setBLOG_ID(String BLOG_ID) {
        this.BLOG_ID = BLOG_ID;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }
    //

    @Override
    public String toString() {
        return "BlogImage{" +
                "BLOG_ID='" + BLOG_ID + '\'' +
                ", ImageURL='" + ImageURL + '\'' +
                '}';
    }
}
