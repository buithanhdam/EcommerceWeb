package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.sql.Date;

public class Voucher implements Serializable {

    private String VOUCHER_ID ;
    private int VOUCHER_VALUE ;
    private Date NgayBatDau ;
    private Date NgayKetThuc ;
   private int TRANGTHAI ;

   public Voucher(){

   }

    public Voucher( String VOUCHER_ID, int VOUCHER_VALUE, Date ngayBatDau, Date ngayKetThuc, int TRANGTHAI) {

        this.VOUCHER_ID = VOUCHER_ID;
        this.VOUCHER_VALUE = VOUCHER_VALUE;
        this.NgayBatDau = ngayBatDau;
        this.NgayKetThuc = ngayKetThuc;
        this.TRANGTHAI = TRANGTHAI;
    }

    //getter setter


    public String getVOUCHER_ID() {
        return VOUCHER_ID;
    }

    public void setVOUCHER_ID(String VOUCHER_ID) {
        this.VOUCHER_ID = VOUCHER_ID;
    }

    public int getVOUCHER_VALUE() {
        return VOUCHER_VALUE;
    }

    public void setVOUCHER_VALUE(int VOUCHER_VALUE) {
        this.VOUCHER_VALUE = VOUCHER_VALUE;
    }

    public Date getNgayBatDau() {
        return NgayBatDau;
    }

    public void setNgayBatDau(Date ngayBatDau) {
        NgayBatDau = ngayBatDau;
    }

    public Date getNgayKetThuc() {
        return NgayKetThuc;
    }

    public void setNgayKetThuc(Date ngayKetThuc) {
        NgayKetThuc = ngayKetThuc;
    }

    public int getTRANGTHAI() {
        return TRANGTHAI;
    }

    public void setTRANGTHAI(int TRANGTHAI) {
        this.TRANGTHAI = TRANGTHAI;
    }

    //

    @Override
    public String toString() {
        return "Voucher{" +

                ", VOUCHER_ID='" + VOUCHER_ID + '\'' +
                ", VOUCHER_VALUE=" + VOUCHER_VALUE +
                ", NgayBatDau=" + NgayBatDau +
                ", NgayKetThuc=" + NgayKetThuc +
                ", TRANGTHAI=" + TRANGTHAI +
                '}';
    }
}
