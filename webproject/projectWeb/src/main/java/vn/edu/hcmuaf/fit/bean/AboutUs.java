package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class AboutUs implements Serializable {
    private String Aboutus_id;
    private  String aboutus_title;
    private String aboutus_image;
    private  String aboutus_description;
    public AboutUs(){

    }

    public AboutUs(String aboutus_id, String aboutus_title, String aboutus_image, String aboutus_description) {
        Aboutus_id = aboutus_id;
        this.aboutus_title = aboutus_title;
        this.aboutus_image = aboutus_image;
        this.aboutus_description = aboutus_description;
    }


    public String getAboutus_id() {
        return Aboutus_id;
    }

    public void setAboutus_id(String aboutus_id) {
        Aboutus_id = aboutus_id;
    }

    public String getAboutus_title() {
        return aboutus_title;
    }

    public void setAboutus_title(String aboutus_title) {
        this.aboutus_title = aboutus_title;
    }

    public String getAboutus_image() {
        return aboutus_image;
    }

    public void setAboutus_image(String aboutus_image) {
        this.aboutus_image = aboutus_image;
    }

    public String getAboutus_description() {
        return aboutus_description;
    }

    public void setAboutus_description(String aboutus_description) {
        this.aboutus_description = aboutus_description;
    }

    @Override
    public String toString() {
        return "AboutUs{" +
                "Aboutus_id='" + Aboutus_id + '\'' +
                ", aboutus_title='" + aboutus_title + '\'' +
                ", aboutus_image='" + aboutus_image + '\'' +
                ", aboutus_description='" + aboutus_description + '\'' +
                '}';
    }
}
