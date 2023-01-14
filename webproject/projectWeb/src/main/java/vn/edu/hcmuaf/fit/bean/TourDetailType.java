package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class TourDetailType implements Serializable {
    private String TOUR_ID ;
    private int Type ;
    private float GiaVe ;
    //on constructor
    public TourDetailType(){

    }
    public TourDetailType(String TOUR_ID, int type, float giaVe) {
        this.TOUR_ID = TOUR_ID;
        this.Type = type;
        this.GiaVe = giaVe;
    }

    // getter setter

    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
    }

    public int getType() {
        return Type;
    }

    public void setType(int type) {
        Type = type;
    }

    public float getGiaVe() {
        return GiaVe;
    }

    public void setGiaVe(float giaVe) {
        GiaVe = giaVe;
    }

    @Override
    public String toString() {
        return "TourDetailType{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", Type=" + Type +
                ", GiaVe=" + GiaVe +
                '}';
    }
}
