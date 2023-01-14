package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class Booking implements Serializable {
    private String BOOKING_ID ;
    private String TOUR_ID ;
    private String USER_ID ;
    private String HoTen ;
    private String Email ;
    private String Phone ;
    private String DiaChi ;
    private int SOLUONG_VENGUOILON ;
    private int SOLUONG_VETREEM ;
    private int SOLUONG  ;
    private int TRANGTHAI  ;
   private Date NgayTao ;

    private float tongTien ;
   private String Description ;
    private String TourName ;
    private Date NgayKhoiHanh ;
    private Date NgayKetThuc ;
   public Booking(){

   }

    public Booking(String BOOKING_ID, String TOUR_ID, String USER_ID, String hoTen, String email, String phone, String diaChi, int SOLUONG_VENGUOILON, int SOLUONG_VETREEM, int SOLUONG, int TRANGTHAI, Date ngayTao, float tongTien, String description,String TourName, Date NgayKhoiHanh,Date NgayKetThuc) {
        this.BOOKING_ID = BOOKING_ID;
        this.TOUR_ID = TOUR_ID;
        this.USER_ID = USER_ID;
        HoTen = hoTen;
        Email = email;
        Phone = phone;
        DiaChi = diaChi;
        this.SOLUONG_VENGUOILON = SOLUONG_VENGUOILON;
        this.SOLUONG_VETREEM = SOLUONG_VETREEM;
        this.SOLUONG = SOLUONG;
        this.TRANGTHAI = TRANGTHAI;
        NgayTao = ngayTao;
        this.tongTien = tongTien;
        Description = description;
        this.TourName = TourName;
        this.NgayKetThuc = NgayKetThuc;
        this.NgayKhoiHanh = NgayKhoiHanh;
    }

    public String getBOOKING_ID() {
        return BOOKING_ID;
    }

    public void setBOOKING_ID(String BOOKING_ID) {
        this.BOOKING_ID = BOOKING_ID;
    }

    public String getTOUR_ID() {
        return TOUR_ID;
    }

    public void setTOUR_ID(String TOUR_ID) {
        this.TOUR_ID = TOUR_ID;
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

    public int getTRANGTHAI() {
        return TRANGTHAI;
    }

    public void setTRANGTHAI(int TRANGTHAI) {
        this.TRANGTHAI = TRANGTHAI;
    }

    public Date getNgayTao() {
        return NgayTao;
    }

    public void setNgayTao(Date ngayTao) {
        NgayTao = ngayTao;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public float getTongTien() {
        return tongTien;
    }

    public void setTongTien(float tongTien) {
        this.tongTien = tongTien;
    }

    public String getTourName() {
        return TourName;
    }

    public void setTourName(String tourName) {
        TourName = tourName;
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

    @Override
    public String toString() {
        return "Booking{" +
                "BOOKING_ID='" + BOOKING_ID + '\'' +
                ", TOUR_ID='" + TOUR_ID + '\'' +
                ", USER_ID='" + USER_ID + '\'' +
                ", HoTen='" + HoTen + '\'' +
                ", Email='" + Email + '\'' +
                ", Phone='" + Phone + '\'' +
                ", DiaChi='" + DiaChi + '\'' +
                ", SOLUONG_VENGUOILON=" + SOLUONG_VENGUOILON +
                ", SOLUONG_VETREEM=" + SOLUONG_VETREEM +
                ", SOLUONG=" + SOLUONG +
                ", TRANGTHAI=" + TRANGTHAI +
                ", NgayTao=" + NgayTao +
                ", tongTien=" + tongTien +
                ", Description='" + Description + '\'' +
                ", TourName='" + TourName + '\'' +
                ", NgayKhoiHanh=" + NgayKhoiHanh +
                ", NgayKetThuc=" + NgayKetThuc +
                '}';
    }
}
