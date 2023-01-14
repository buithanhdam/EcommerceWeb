package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.*;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class VoucherDAO {
    private static VoucherDAO instance;

    private VoucherDAO(){

    }
    public  static  VoucherDAO getInstance(){
        if (instance == null) return instance = new VoucherDAO();
        return instance;
    }
    // get
    public List<Voucher> getVoucherList(){
        updateStatusVoucher();
        List<Voucher> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from voucher where TRANGTHAI = ?")
                        .bind(0,1)
                        .mapToBean(Voucher.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o1.getVOUCHER_VALUE() - o2.getVOUCHER_VALUE());
        return list;
    }
    public Voucher getVoucher(String id){

        List<Voucher> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from voucher where VOUCHER_ID = ?")
                        .bind(0,id)
                        .mapToBean(Voucher.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list.get(0);
    }
    public void updateStatusVoucher(){
        Date currentDate = Date.valueOf(LocalDate.now());
        String sd = currentDate.toString();
        JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("update VOUCHER " +
                                "set TRANGTHAI  = ?  " +
                                "where NgayKetThuc  < ? ")
                        .bind(0,0)
                        .bind(1,sd)
                        .execute()
        );
    }



    public boolean createVoucher(String ngayBD, String ngayKT , String value ){
        Random random = new Random();
        String id ="Voucher"+ (random.nextInt(500));
        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("insert into VOUCHER values (?,?,?,?,?)")
                        .bind(0,id)
                        .bind(1,Integer.parseInt(value))
                        .bind(2,ngayBD)
                        .bind(3,ngayKT)

                        .bind(4,1)
                        .execute()
        );

        if (row != 1) return false;
        return true;
    }

    public boolean updateVoucher(String id,String ngayBD, String ngayKT , String value ){

        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("update VOUCHER " +
                                "set VOUCHER_VALUE  =? ,NgayBatDau  =? ,NgayKetThuc   =?  " +
                                "where VOUCHER_ID  =?")
                        .bind(0,Integer.parseInt(value))
                        .bind(1,ngayBD)
                        .bind(2,ngayKT)

                        .bind(3,id)
                        .execute()
        );

        if (row != 1) return false;
        return true;
    }
    public boolean deleteVoucher(String id){
        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("delete from VOUCHER where VOUCHER_ID  = ?")
                        .bind(0,id)
                        .execute()
        );
        if (row != 1) return false;
        return true;
    }
}
