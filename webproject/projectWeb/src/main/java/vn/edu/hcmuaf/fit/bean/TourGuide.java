package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class TourGuide implements Serializable {
    private String TOUR_ID;
    private String user_id;
    private String fullName;
    private String email;
    private String phone;
    private String imageURL;

    public TourGuide(){

    }

    public TourGuide(String TOUR_ID, String user_id, String fullName, String email, String phone, String imageURL) {
        this.TOUR_ID = TOUR_ID;
        this.user_id = user_id;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.imageURL = imageURL;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    //

    @Override
    public String toString() {
        return "TourGuide{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", user_id='" + user_id + '\'' +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", imageURL='" + imageURL + '\'' +
                '}';
    }
}
