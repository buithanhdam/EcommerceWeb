package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class TourCart implements Serializable {
   private String TOUR_ID ;
   private String TourName ;
    private int TrangThaiTour ;
    private Date NgayKhoiHanh  ;
    private Date NgayKetThuc ;

    private String ImageURL;
    private String  USER_ID;
    private String HoTen;
    private String  Email ;
    private String Phone;
    private String  DiaChi;
    private int SOLUONG_VENGUOILON ;
    private int  SOLUONG_VETREEM;
    private int SOLUONG ;
    private Date  NgayTao ;
    private float TongTien ;
    private String Description;
    public TourCart(){

    }

    public TourCart(String TOUR_ID, String tourName, int trangThaiTour, Date ngayKhoiHanh, Date ngayKetThuc,  String imageURL, String USER_ID, String hoTen, String email, String phone, String diaChi, int SOLUONG_VENGUOILON, int SOLUONG_VETREEM, int SOLUONG, Date ngayTao, float tongTien, String description) {
        this.TOUR_ID = TOUR_ID;
        TourName = tourName;
        TrangThaiTour = trangThaiTour;
        NgayKhoiHanh = ngayKhoiHanh;
        NgayKetThuc = ngayKetThuc;

        ImageURL = imageURL;
        this.USER_ID = USER_ID;
        HoTen = hoTen;
        Email = email;
        Phone = phone;
        DiaChi = diaChi;
        this.SOLUONG_VENGUOILON = SOLUONG_VENGUOILON;
        this.SOLUONG_VETREEM = SOLUONG_VETREEM;
        this.SOLUONG = SOLUONG;
        NgayTao = ngayTao;
        TongTien = tongTien;
        Description = description;
    }

    // getter setter

    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
    }

    public String getTourName() {
        return TourName;
    }

    public void setTourName(String tourName) {
        TourName = tourName;
    }

    public int getTrangThaiTour() {
        return TrangThaiTour;
    }

    public void setTrangThaiTour(int trangThaiTour) {
        TrangThaiTour = trangThaiTour;
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



    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }

    public String getUSER_ID() {
        return USER_ID;
    }

    public void setUSER_ID(String USER_ID) {
        this.USER_ID = USER_ID;
    }

    public String getHoTen() {
        return HoTen;
    }

    public void setHoTen(String hoTen) {
        HoTen = hoTen;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String phone) {
        Phone = phone;
    }

    public String getDiaChi() {
        return DiaChi;
    }

    public void setDiaChi(String diaChi) {
        DiaChi = diaChi;
    }

    public int getSOLUONG_VENGUOILON() {
        return SOLUONG_VENGUOILON;
    }

    public void setSOLUONG_VENGUOILON(int SOLUONG_VENGUOILON) {
        this.SOLUONG_VENGUOILON = SOLUONG_VENGUOILON;
    }

    public int getSOLUONG_VETREEM() {
        return SOLUONG_VETREEM;
    }

    public void setSOLUONG_VETREEM(int SOLUONG_VETREEM) {
        this.SOLUONG_VETREEM = SOLUONG_VETREEM;
    }

    public int getSOLUONG() {
        return SOLUONG;
    }

    public void setSOLUONG(int SOLUONG) {
        this.SOLUONG = SOLUONG;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(Date ngayTao) {
        NgayTao = ngayTao;
    }

    public float getTongTien() {
        return TongTien;
    }

    public void setTongTien(float tongTien) {
        TongTien = tongTien;
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
        return "TourCart{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", TourName='" + TourName + '\'' +
                ", TrangThaiTour=" + TrangThaiTour +
                ", NgayKhoiHanh=" + NgayKhoiHanh +
                ", NgayKetThuc=" + NgayKetThuc +

                ", ImageURL='" + ImageURL + '\'' +
                ", USER_ID='" + USER_ID + '\'' +
                ", HoTen='" + HoTen + '\'' +
                ", Email='" + Email + '\'' +
                ", Phone='" + Phone + '\'' +
                ", DiaChi='" + DiaChi + '\'' +
                ", SOLUONG_VENGUOILON=" + SOLUONG_VENGUOILON +
                ", SOLUONG_VETREEM=" + SOLUONG_VETREEM +
                ", SOLUONG=" + SOLUONG +
                ", NgayTao=" + NgayTao +
                ", TongTien=" + TongTien +
                ", Description='" + Description + '\'' +
                '}';
    }
}
