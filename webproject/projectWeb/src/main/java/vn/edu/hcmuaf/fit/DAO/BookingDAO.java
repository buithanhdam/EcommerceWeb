package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.TourDetailService;
import vn.edu.hcmuaf.fit.services.TourService;
import vn.edu.hcmuaf.fit.services.VoucherService;

import java.util.List;
import java.util.Random;
import java.util.stream.Collectors;

public class BookingDAO {
    private static BookingDAO instance;

    private  BookingDAO(){

    }
    public  static  BookingDAO getInstance(){
        if (instance == null) instance = new BookingDAO();
        return instance;
    }

//    public

    public List<Booking> getListBookingByUserId(String user_id){
        List<Booking> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select  booking.*,tour.TourName,tour.NgayKhoiHanh,tour.NgayKetThuc from booking inner join tour on tour.TOUR_ID = booking.TOUR_ID where user_id = ? ")
                        .bind(0,user_id)
                        .mapToBean(Booking.class)
                        .stream()
                        .collect(Collectors.toList())
                );
        list.sort((o1, o2) -> o1.getNgayTao().getTime()>= o2.getNgayTao().getTime()?-1:1);
        return list;

    }
    public List<Booking> getListBooking(){
        List<Booking> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select  * from booking")
                        .mapToBean(Booking.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o1.getNgayTao().getTime()>= o2.getNgayTao().getTime()?-1:1);
        return list;

    }
    public List<Booking> getListBookingComplete(){
        List<Booking> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select  * from booking where TRANGTHAI >=1")
                        .mapToBean(Booking.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o1.getNgayTao().getTime()>= o2.getNgayTao().getTime()?-1:1);
        return list;

    }


    public Booking getBookingById(String id){
        List<Booking> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select  * from booking where BOOKING_ID = ?")
                        .bind(0,id)
                        .mapToBean(Booking.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list.get(0);

    }
    public boolean createBooking(TourCart tc){
        Random random = new Random();
        String id ="BOOKING"+ (random.nextInt() +90000000);
        TourDetail tour = TourDetailService.getInstance().getTourDetail(tc.getTOUR_ID());
        if (tour.getSoLuong() < tc.getSOLUONG()){
            return false;
        }else {
            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("insert into booking values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)")
                            .bind(0, id)
                            .bind(1, tc.getTOUR_ID())
                            .bind(2, tc.getUSER_ID())
                            .bind(3, tc.getHoTen())
                            .bind(4, tc.getEmail())
                            .bind(5, tc.getPhone())
                            .bind(6, tc.getDiaChi())
                            .bind(7, tc.getSOLUONG_VENGUOILON())
                            .bind(8, tc.getSOLUONG_VETREEM())
                            .bind(9, tc.getSOLUONG())
                            .bind(10, 0)
                            .bind(11, tc.getNgayTao())
                            .bind(12, tc.getTongTien())
                            .bind(13, tc.getDescription())
                            .execute()
            );

            return true;
        }
    }

    public boolean createBookingAdmin(Booking tc){
        Random random = new Random();
        String id ="BOOKING"+ (random.nextInt() +90000000);
        TourDetail tour = TourDetailService.getInstance().getTourDetail(tc.getTOUR_ID());
        if (tour.getSoLuong() < tc.getSOLUONG()){
            return false;
        }else {
            List<TourDetailType> listt = TourDetailService.getInstance().getListType(tc.getTOUR_ID());
          List<Voucher> vl = TourDetailService.getInstance().getListVoucher(tc.getTOUR_ID());
          int value = 0;
          if (vl.size()<1){
              value = 0;
          }else{
              value = vl.get(0).getVOUCHER_VALUE();
          }
            float tongtien = 0;
            for (TourDetailType tdt:
                 listt) {
                if (tdt.getType()==1){
                    tongtien += (tdt.getGiaVe()*tc.getSOLUONG_VENGUOILON());
                }else{
                    tongtien += (tdt.getGiaVe()*tc.getSOLUONG_VETREEM());
                }
            }

            float finalTongtien = tongtien -(tongtien*value);
            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("insert into booking values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)")
                            .bind(0, id)
                            .bind(1, tc.getTOUR_ID())
                            .bind(2, tc.getUSER_ID())
                            .bind(3, tc.getHoTen())
                            .bind(4, tc.getEmail())
                            .bind(5, tc.getPhone())
                            .bind(6, tc.getDiaChi())
                            .bind(7, tc.getSOLUONG_VENGUOILON())
                            .bind(8, tc.getSOLUONG_VETREEM())
                            .bind(9, tc.getSOLUONG())
                            .bind(10, tc.getTRANGTHAI())
                            .bind(11, tc.getNgayTao())
                            .bind(12, finalTongtien)
                            .bind(13, tc.getDescription())
                            .execute()
            );
            if (tc.getTRANGTHAI() ==1){
                TourDAO.getInstance().updateSoLuongTour(id);
            }
            return true;
        }
    }
    public boolean cancelBooking(String bookingId,String user_id){
       int row= JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update booking " +
                        "set booking.TRANGTHAI = -1 " +
                        "where booking.BOOKING_ID = ? and booking.USER_ID = ? and booking.TRANGTHAI = 0")
                        .bind(0,bookingId)
                        .bind(1,user_id)
                        .execute()
        );

        return row!=1?false:true;
    }

    public boolean adminSubmitBooking(String bookingId){
        int row= JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update booking " +
                                "set booking.TRANGTHAI = 1 " +
                                "where booking.BOOKING_ID = ? and booking.TRANGTHAI = 0")
                        .bind(0,bookingId)

                        .execute()
        );
        if (row==1){
            TourDAO.getInstance().updateSoLuongTour(bookingId);
        }
        return row!=1?false:true;
    }
    public boolean adminCancelBooking(String bookingId){
        int row= JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update booking " +
                                "set booking.TRANGTHAI = -1 " +
                                "where booking.BOOKING_ID = ? and booking.TRANGTHAI = 0")
                        .bind(0,bookingId)

                        .execute()
        );

        return row!=1?false:true;
    }
    public boolean adminDeleteBooking(String bookingId){
        int row= JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from booking " +

                                "where booking.BOOKING_ID = ? and booking.TRANGTHAI = -1")
                        .bind(0,bookingId)

                        .execute()
        );

        return row!=1?false:true;
    }
    public boolean updateBookingAdmin(Booking tc){

        TourDetail tour = TourDetailService.getInstance().getTourDetail(tc.getTOUR_ID());
        if (tour.getSoLuong() < tc.getSOLUONG()){
            return false;
        }else {
            List<TourDetailType> listt = TourDetailService.getInstance().getListType(tc.getTOUR_ID());
            List<Voucher> vl = TourDetailService.getInstance().getListVoucher(tc.getTOUR_ID());
            int value = 0;
            if (vl.size()<1){
                value = 0;
            }else{
                value = vl.get(0).getVOUCHER_VALUE();
            }
            float tongtien = 0;
            for (TourDetailType tdt:
                    listt) {
                if (tdt.getType()==1){
                    tongtien += (tdt.getGiaVe()*tc.getSOLUONG_VENGUOILON());
                }else{
                    tongtien += (tdt.getGiaVe()*tc.getSOLUONG_VETREEM());
                }
            }

            float finalTongtien = tongtien -(tongtien*value);
            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("update BOOKING " +
                                    "set TOUR_ID =?, USER_ID= ?,HoTen= ?,Email=?,Phone=?, DiaChi=? , SOLUONG_VENGUOILON =?,SOLUONG_VETREEM =? ,SOLUONG=? ,TRANGTHAI= ? ,NgayTao = ?, TongTien =? , Description=? " +
                                    "where BOOKING_ID =?")

                            .bind(0, tc.getTOUR_ID())
                            .bind(1, tc.getUSER_ID())
                            .bind(2, tc.getHoTen())
                            .bind(3, tc.getEmail())
                            .bind(4, tc.getPhone())
                            .bind(5, tc.getDiaChi())
                            .bind(6, tc.getSOLUONG_VENGUOILON())
                            .bind(7, tc.getSOLUONG_VETREEM())
                            .bind(8, tc.getSOLUONG())
                            .bind(9, tc.getTRANGTHAI())
                            .bind(10, tc.getNgayTao().toString())
                            .bind(11, finalTongtien)
                            .bind(12, tc.getDescription())
                            .bind(13, tc.getBOOKING_ID())
                            .execute()
            );
            if (tc.getTRANGTHAI() ==1){
                TourDAO.getInstance().updateSoLuongTour(tc.getBOOKING_ID());
            }
            return true;
        }
    }
    public void updateBookingStatus(){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from BOOKING " +
                        "where DATEDIFF(CURRENT_DATE,NgayTao) >= 60 and TRANGTHAI = ?").bind(0,-1).execute()
        );
//        JDBIConnector.get().withHandle(handle ->
//                handle.createUpdate("update BOOKING " +
//                        "set TRANGTHAI= ? " +
//                        "where ").bind(0,-1)
//
//        );
    }

    public List<Booking> getListBookingByMonth(){
        List<Booking> list = JDBIConnector.get().withHandle(handle -> handle.createQuery(
                "SELECT * from booking WHERE MONTH(booking.NgayTao) = MONTH(CURRENT_DATE) AND  YEAR(booking.NgayTao) = YEAR(CURRENT_DATE)"
        ).mapToBean(Booking.class).stream().collect(Collectors.toList()));

        return list;
    }
    public List<Booking> getListBookingByTourId(String tourId){
        List<Booking> list = JDBIConnector.get().withHandle(handle -> handle.createQuery(
                "SELECT * from booking WHERE TOUR_ID = ? and TRANGTHAI = 1"
        ).bind(0,tourId).mapToBean(Booking.class).stream().collect(Collectors.toList()));

        return list;
    }


    public static void main(String[] args) {

    }
}
