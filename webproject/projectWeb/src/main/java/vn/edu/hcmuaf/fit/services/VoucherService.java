package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.VoucherDAO;
import vn.edu.hcmuaf.fit.bean.Voucher;

import java.util.List;

public class VoucherService {
    private static VoucherService instance;

    private VoucherService(){

    }
    public  static  VoucherService getInstance(){
        if (instance == null) return instance = new VoucherService();
        return instance;
    }
    public List<Voucher> getVoucherList(){
        return VoucherDAO.getInstance().getVoucherList();
    }
    public Voucher getVoucher(String id){return VoucherDAO.getInstance().getVoucher(id);}
    public boolean createVoucher(String ngayBD, String ngayKT , String value ,String trangThai){
        return VoucherDAO.getInstance().createVoucher(ngayBD,ngayKT,value);
    }
    public boolean updateVoucher(String id,String ngayBD, String ngayKT , String value ){
        return VoucherDAO.getInstance().updateVoucher(id,ngayBD,ngayKT,value);
    }
    public boolean deleteVoucher(String id){
        return VoucherDAO.getInstance().deleteVoucher(id);
    }
}
