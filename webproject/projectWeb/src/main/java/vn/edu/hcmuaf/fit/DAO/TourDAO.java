package vn.edu.hcmuaf.fit.DAO;


import vn.edu.hcmuaf.fit.bean.Booking;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.bean.TourDetail;
import vn.edu.hcmuaf.fit.bean.Voucher;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.BookingService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

/*
Lớp TourDAO dùng để bơm dữ liệu từ csdl lên chuyển qua TourService để Servlet gọi lấy dữ liệu
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm 20130217
 */
public class TourDAO {
    private static TourDAO instance;
    //non constructor
    private TourDAO(){
        updateTourStatus();
    }

    public static TourDAO getInstance() {

        if (instance ==null) instance = new TourDAO();
        return instance;
    }

    /*
    phương thức lấy dữ liệu tất cả tour từ csdl để gửi đến view
     */
    public List<Tour> getListTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 and tour.TrangThai =1")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }
    public List<Tour> getAllTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 ")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }



    public List<Tour> getSoldOutTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 and SoLuong =0")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }
    public List<Tour> getNewTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 and  DATEDIFF(CURRENT_DATE,NgayTao) <=5 ")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }
    public TourDetail getTourDetail(String tour_id){

        List<TourDetail> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from tour where tour.TOUR_ID = ? ")
                        .bind(0, tour_id)
                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (list.size() != 1) return null;
        TourDetail odes = list.get(0);
        return odes ;
    }
    /*
   phương thức tiềm kiếm nhanh dữ liệu tour thông qua 1 đoạn text nhập vào
   từ ô tìm kiến trên thanh header
    */
    public List<Tour> getListBySearchText(String textSearch){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe" +
                                " from Tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID " +
                                "where tour_type.Type =1 and tour.TrangThai =1 and " +
                                "TourName LIKE '%"+textSearch+"%' OR TourName LIKE '"+textSearch+"%' or TourName LIKE '%"+textSearch+"' or " +
                                "TOUR_CATEGORY  LIKE '%"+textSearch+"%' or TOUR_CATEGORY  LIKE '"+textSearch+"%'or TOUR_CATEGORY  LIKE '%"+textSearch+"'")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }
    /*
  phương thức tiềm kiếm dữ liệu tour thông qua 1 đoạn text nhập vào và các lựa chọn lọc
  từ ô tìm kiến của thanh rightNav trang package
   */
    public List<Tour> findListTourBySearchFilter(String searchText,List<String> liststring){
        String query = "";
        for (String string:
                liststring) {
            query += " and "+string;
        }
        String  textSearchquery = "";
        if (searchText != "") textSearchquery = " and TourName LIKE '%"+searchText+"%' OR TourName LIKE '"+searchText+"%' or TourName LIKE '%"+searchText+"' ";

        String finalQuery = query;

        String finalTextSearchquery = textSearchquery;
        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe" +
                                " from Tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID " +
                                "where tour_type.Type =1 and tour.TrangThai =1  " +
                                finalTextSearchquery + finalQuery
                            )
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list ;
    }
    public List<Tour> getListPopularTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 and tour.TrangThai =1")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        list.sort((o1, o2) -> o2.getSoLuong() - o1.getSoLuong());
        List<Tour> listPopular = list.size()>=6? list.subList(0,6):list;
        return listPopular ;
    }
    public List<Tour> getListIncomingTour(){

        List<Tour> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID where tour_type.Type =1 and tour.TrangThai =2")
                        .mapToBean(Tour.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }
    public Map<Integer,List<Tour>> getMapVoucherTour(){
        Map<Integer,List<Tour>> map = new LinkedHashMap<Integer, List<Tour>>();

        List<Voucher> listV = VoucherDAO.getInstance().getVoucherList();
        for (Voucher v:
             listV) {
            List<Tour> list = JDBIConnector.get().withHandle(h ->
                    h.createQuery("select tour.TOUR_ID,TourName,TrangThai,NgayTao,NgayKhoiHanh,NgayKetThuc,SoLuong,ImageURL,TOUR_CATEGORY,tour_type.GiaVe from tour INNER JOIN tour_type on tour.TOUR_ID = tour_type.TOUR_ID inner join TOUR_VOUCHER on TOUR_VOUCHER.TOUR_ID = tour.TOUR_ID" +
                                    " where tour_type.Type =1 and tour.TrangThai =1 and TOUR_VOUCHER.VOUCHER_ID = ?")
                            .bind(0,v.getVOUCHER_ID())
                            .mapToBean(Tour.class)
                            .stream()
                            .collect(Collectors.toList())
            );
            if (!list.isEmpty()) {
                map.put(v.getVOUCHER_VALUE(), list);
            }
        }

        return map ;
    }

    public boolean updateSoLuongTour(String bookingId){
        boolean result = false;
        Booking booking = BookingService.getInstance().getBookingById(bookingId);
        if (booking.getTRANGTHAI()==1){
            TourDetail tour = getInstance().getTourDetail(booking.getTOUR_ID());
            if (tour.getSoLuong()>= booking.getSOLUONG()){
                int rest = tour.getSoLuong() - booking.getSOLUONG();
                JDBIConnector.get().withHandle(handle ->
                        handle.createUpdate("update TOUR " +
                                "set SoLuong = ? " +
                                "where TOUR_ID = ?").bind(0,rest).bind(1,tour.getTOUR_ID()).execute()
                );
                updateTourStatus();
                result = true;
            }else{
                result = false;
            }
        }
        return result;
    }
    public void updateTourStatus(){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update TOUR " +
                        "set TrangThai = ? " +
                        "where SoLuong = ?").bind(0,0).bind(1,0).execute()
        );

        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update TOUR " +
                        "set TrangThai = ? " +
                        "where DATEDIFF(NgayKhoiHanh,CURRENT_DATE) <= 2").bind(0,0).execute()
        );
        List<TourDetail> l = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select * from tour  where NgayKetThuc <  CURRENT_DATE")

                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        for (TourDetail td:
             l) {


            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("delete from TOUR_GUIDE " +

                            "where TOUR_GUIDE.TOUR_ID = ?").bind(0,td.getTOUR_ID()).execute()
            );
        }
    }



//    public static void main(String[] args) {
//        Map<Integer,List<Tour>> map = new LinkedHashMap<Integer, List<Tour>>();
//        map = getInstance().getMapVoucherTour();
//
//        Set<Integer> set = map.keySet();
//        for (Integer i:
//             set) {
//            System.out.println(i + map.get(i).toString());
//        }
//    }

}
