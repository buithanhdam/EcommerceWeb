package vn.edu.hcmuaf.fit.bean;


import java.io.Serializable;
import java.sql.Date;
import java.util.Calendar;

/*Class Tour chứa thông tin 1 Tour du lịch
Tạo bởi Bùi Thanh Đảm 20130217
Cập nhật bởi Bùi Thanh Đảm 20130217

 */
public class Tour implements Serializable {
    private String tour_id ;

    private String tourName ;
    private int trangThai ;
    private Date NgayTao ;
    private Date NgayKhoiHanh;
    private Date NgayKetThuc ;

    private int  soLuong ;

    private String imageURL;

    private String tour_category ;
    private float giaVe ;
    //non constructor
    public Tour(){

    }
    // contructor tour

    public Tour(String tour_id, String tourName, int trangThai, Date ngayTao, Date ngayKhoiHanh, Date ngayKetThuc, int soLuong, String imageURL, String tour_category, float giaVe) {
        this.tour_id = tour_id;
        this.tourName = tourName;
        this.trangThai = trangThai;
        this.NgayTao = ngayTao;
        this.NgayKhoiHanh = ngayKhoiHanh;
        this.NgayKetThuc = ngayKetThuc;
        this.soLuong = soLuong;
        this.imageURL = imageURL;
        this.tour_category = tour_category;
        this.giaVe = giaVe;
    }


    // getter các dữ liệu của Tour
    // setter dữ liệu của Tour


    public String getTour_id() {
        return tour_id;
    }

    public void setTour_id(String tour_id) {
        this.tour_id = tour_id;
    }

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public int getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(int trangThai) {
        this.trangThai = trangThai;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(Date ngayTao) {
        NgayTao = ngayTao;
    }

    public Date getNgayKhoiHanh() {
        return NgayKhoiHanh;
    }

    public void setNgayKhoiHanh(Date ngayKhoiHanh) {
        NgayKhoiHanh = ngayKhoiHanh;
    }

    public Date getNgayKetThuc() {
        return NgayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        NgayKetThuc = ngayKetThuc;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public String getTour_category() {
        return tour_category;
    }

    public void setTour_category(String tour_category) {
        this.tour_category = tour_category;
    }

    public float getGiaVe() {
        return giaVe;
    }

    public void setGiaVe(float giaVe) {
        this.giaVe = giaVe;
    }
    // to string


    @Override
    public String toString() {
        return "Tour{" +
                "tour_id='" + tour_id + '\'' +
                ", tourName='" + tourName + '\'' +
                ", trangThai=" + trangThai +
                ", NgayTao=" + NgayTao +
                ", NgayKhoiHanh=" + NgayKhoiHanh +
                ", NgayKetThuc=" + NgayKetThuc +
                ", soLuong=" + soLuong +
                ", imageURL='" + imageURL + '\'' +
                ", tour_category='" + tour_category + '\'' +
                ", giaVe=" + giaVe +
                '}';
    }


    //489809884
    //500000000
}

