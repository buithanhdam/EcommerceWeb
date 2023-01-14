package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class TourDetailImages implements Serializable {
   private String TOUR_ID ;
   private String ImageURL ;
   //non constructor
   public  TourDetailImages(){

   }

    public TourDetailImages(String TOUR_ID, String imageURL) {
        this.TOUR_ID = TOUR_ID;
        this.ImageURL = imageURL;
    }

    //getter setter

    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
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
        return "TourDetailImages{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", ImageURL='" + ImageURL + '\'' +
                '}';
    }
}
