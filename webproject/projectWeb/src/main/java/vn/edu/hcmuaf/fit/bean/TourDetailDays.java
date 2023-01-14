package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class TourDetailDays implements Serializable {
    private String TOUR_ID ;
    private String Title ;
    private int Ngay ;

    private String Description ;
    //non constructor
    public TourDetailDays(){

    }

    //

    public TourDetailDays(String TOUR_ID, String title, int ngay, String description) {
        this.TOUR_ID = TOUR_ID;
        this.Title = title;
        this.Ngay = ngay;
        this.Description = description;
    }
    //getter setter

    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String title) {
        Title = title;
    }

    public int getNgay() {
        return Ngay;
    }

    public void setNgay(int ngay) {
        Ngay = ngay;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }
    //

    @Override
    public String toString() {
        return "TourDetailDays{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", Title='" + Title + '\'' +
                ", Ngay=" + Ngay +
                ", Description='" + Description + '\'' +
                '}';
    }
}
