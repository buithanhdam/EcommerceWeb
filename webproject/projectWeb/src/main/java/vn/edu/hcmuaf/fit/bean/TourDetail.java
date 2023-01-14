package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
/*Class TourDetail chứa thông tin chi tiết 1 Tour du lịch
Tạo bởi Bùi Thanh Đảm 20130217
Cập nhật bởi Bùi Thanh Đảm 20130217

 */
public class TourDetail implements Serializable {
   private String TOUR_ID ;

    private String TourName ;
    private String DiaDiem_ID ;
    private int TrangThai ;
    private Date NgayTao ;
    private Date NgayKhoiHanh ;
    private Date NgayKetThuc ;
    private String NoiKhoiHanh ;
    private int SoLuong ;
    private String PhuongTienDiChuyen ;
    private String ImageURL ;
    private String Description ;
    private String TOUR_CATEGORY ;

    // non constructor
    public TourDetail(){

    };
    // constructor
    public TourDetail(String TOUR_ID, String tourName, String diaDiem_ID, int trangThai, Date ngayTao, Date ngayKhoiHanh, Date ngayKetThuc, String noiKhoiHanh, int soLuong, String phuongTienDiChuyen, String imageURL, String description, String TOUR_CATEGORY) {
        this.TOUR_ID = TOUR_ID;
        this.TourName = tourName;
        this.DiaDiem_ID = diaDiem_ID;
        this.TrangThai = trangThai;
        this.NgayTao = ngayTao;
        this.NgayKhoiHanh = ngayKhoiHanh;
        this.NgayKetThuc = ngayKetThuc;
        this.NoiKhoiHanh = noiKhoiHanh;
        this.SoLuong = soLuong;
        this.PhuongTienDiChuyen = phuongTienDiChuyen;
        this.ImageURL = imageURL;
        this.Description = description;
        this.TOUR_CATEGORY = TOUR_CATEGORY;
    }
    /*
    Getter và Setter
     */

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

    public String getDiaDiem_ID() {
        return DiaDiem_ID;
    }

    public void setDiaDiem_ID(String diaDiem_ID) {
        DiaDiem_ID = diaDiem_ID;
    }

    public int getTrangThai() {
        return TrangThai;
    }

    public void setTrangThai(int trangThai) {
        TrangThai = trangThai;
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

    public String getNoiKhoiHanh() {
        return NoiKhoiHanh;
    }

    public void setNoiKhoiHanh(String noiKhoiHanh) {
        NoiKhoiHanh = noiKhoiHanh;
    }

    public int getSoLuong() {
        return SoLuong;
    }

    public void setSoLuong(int soLuong) {
        SoLuong = soLuong;
    }

    public String getPhuongTienDiChuyen() {
        return PhuongTienDiChuyen;
    }

    public void setPhuongTienDiChuyen(String phuongTienDiChuyen) {
        PhuongTienDiChuyen = phuongTienDiChuyen;
    }

    public String getImageURL() {
        return ImageURL;
    }

    public void setImageURL(String imageURL) {
        ImageURL = imageURL;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        Description = description;
    }

    public String getTOUR_CATEGORY() {
        return TOUR_CATEGORY;
    }

    public void setTOUR_CATEGORY(String TOUR_CATEGORY) {
        this.TOUR_CATEGORY = TOUR_CATEGORY;
    }
    // to string

    @Override
    public String toString() {
        return "TourDetail{" +
                "TOUR_ID='" + TOUR_ID + '\'' +
                ", TourName='" + TourName + '\'' +
                ", DiaDiem_ID='" + DiaDiem_ID + '\'' +
                ", TrangThai=" + TrangThai +
                ", NgayTao=" + NgayTao +
                ", NgayKhoiHanh=" + NgayKhoiHanh +
                ", NgayKetThuc=" + NgayKetThuc +
                ", NoiKhoiHanh='" + NoiKhoiHanh + '\'' +
                ", SoLuong=" + SoLuong +
                ", PhuongTienDiChuyen='" + PhuongTienDiChuyen + '\'' +
                ", ImageURL='" + ImageURL + '\'' +
                ", Description='" + Description + '\'' +
                ", TOUR_CATEGORY='" + TOUR_CATEGORY + '\'' +
                '}';
    }
}
