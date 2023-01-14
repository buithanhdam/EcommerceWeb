package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;
/* Lớp User khách hàng chứa các thông tin
Được tạo bởi Bùi Thanh Đảm - 20130217

 */
public class User implements Serializable {
    private static final long serialVersionUID = 1L;
    private String user_id;
    private String fullName;
    private String username;
    private String email;
    private String user_password;


    private String phone;
    private Date birth;
    private String imageURL;

    private String gioiTinh;
    private String CMND;
    private String diaChi;
    private String bankCard;
    private int user_role;

//    none constructor
    public User() {
    }
//    full constructor


    public User(String user_id, String fullName, String username, String email, String user_password, String phone, Date birth, String imageURL, String gioiTinh, String CMND, String diaChi, String bankCard, int user_role) {
        this.user_id = user_id;
        this.fullName = fullName;
        this.username = username;
        this.email = email;
        this.user_password = user_password;
        this.phone = phone;
        this.birth = birth;
        this.imageURL = imageURL;
        this.gioiTinh = gioiTinh;
        this.CMND = CMND;
        this.diaChi = diaChi;
        this.bankCard = bankCard;
        this.user_role = user_role;
    }

    //getter


    public String getUser_Id() {
        return user_id;
    }

    public String getFullName() {
        return fullName;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getUser_password() {
        return user_password;
    }

    public String getPhone() {
        return phone;
    }

    public Date getBirth() {
        return birth;
    }

    public String getImageURL() {
        return imageURL;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public String getCMND() {
        return CMND;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public String getBankCard() {
        return bankCard;
    }

    public int getUser_role() {
        return user_role;
    }
    //setter


    public void setUser_Id(String user_id) {
        this.user_id = user_id;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUser_password(String user_password) {
        this.user_password = user_password;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public void setBankCard(String bankCard) {
        this.bankCard = bankCard;
    }

    public void setUser_role(int user_role) {
        this.user_role = user_role;
    }

    // check role
    public boolean checkRole(int role) {
        return this.user_role >= role;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id='" + user_id + '\'' +
                ", fullName='" + fullName + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", user_password='" + user_password + '\'' +
                ", phone='" + phone + '\'' +
                ", birth=" + birth +
                ", imageURL='" + imageURL + '\'' +
                ", gioiTinh='" + gioiTinh + '\'' +
                ", CMND='" + CMND + '\'' +
                ", diaChi='" + diaChi + '\'' +
                ", bankCard='" + bankCard + '\'' +
                ", user_role=" + user_role +
                '}';
    }
}

