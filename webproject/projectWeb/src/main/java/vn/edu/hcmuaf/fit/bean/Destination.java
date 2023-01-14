package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Destination implements Serializable {
   private String DiaDiem_ID ;
    private String TenDiaDiem ;
    private String ImageURL ;
    private int soluong;

    // non constructor
    public Destination(){

    }

    public Destination(String diaDiem_ID, String tenDiaDiem, String imageURL,int soluong) {
        this.DiaDiem_ID = diaDiem_ID;
        this.TenDiaDiem = tenDiaDiem;
        this.ImageURL = imageURL;
        this.soluong = soluong;
    }

    //getter setter

    public String getDiaDiem_ID() {
        return DiaDiem_ID;
    }

    public void setDiaDiem_ID(String diaDiem_ID) {
        DiaDiem_ID = diaDiem_ID;
    }

    public String getTenDiaDiem() {
        return TenDiaDiem;
    }

    public void setTenDiaDiem(String tenDiaDiem) {
        TenDiaDiem = tenDiaDiem;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }
    //


    @Override
    public String toString() {
        return "Destination{" +
                "DiaDiem_ID='" + DiaDiem_ID + '\'' +
                ", TenDiaDiem='" + TenDiaDiem + '\'' +
                ", ImageURL='" + ImageURL + '\'' +
                ", soluong=" + soluong +
                '}';
    }
}
