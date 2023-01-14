package vn.edu.hcmuaf.fit.DAO;



import vn.edu.hcmuaf.fit.bean.*;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.VoucherService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/*
Lớp TourPackageDAO dùng để bơm dữ liệu từ csdl lên chuyển qua TourPackageService để Servlet gọi lấy dữ liệu
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm 20130217
 */
public class TourDetailDAO {

    private static TourDetailDAO instance;

    //non constructor
    private TourDetailDAO(){

    }

    public static TourDetailDAO getInstance(){
        if (instance == null) instance = new TourDetailDAO();
        return  instance;
    }


    public List<TourDetailDays> getListDay(String tour_id){
        List<TourDetailDays> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from TOUR_DETAIL_PER_DAY where TOUR_DETAIL_PER_DAY.TOUR_ID  = ?")
                        .bind(0, tour_id)
                        .mapToBean(TourDetailDays.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }
    public List<TourDetailImages> getListImage(String tour_id){
        List<TourDetailImages> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from TOUR_DETAIL_IMAGE where TOUR_DETAIL_IMAGE.TOUR_ID  = ?")
                        .bind(0, tour_id)
                        .mapToBean(TourDetailImages.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }
    public List<TourDetailType> getListType(String tour_id){
        List<TourDetailType> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select * from TOUR_TYPE where TOUR_TYPE.TOUR_ID  = ?")
                        .bind(0, tour_id)
                        .mapToBean(TourDetailType.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }


    public List<TourGuide> getListGuide(String tour_id){
        List<TourGuide> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select TOUR_GUIDE.*,user.FullName ,user.email ,user.phone ,user.ImageURL from TOUR_GUIDE inner join User on User.USER_ID =TOUR_GUIDE.USER_ID where TOUR_GUIDE.TOUR_ID  = ? and user.USER_Role =1")
                        .bind(0, tour_id)
                        .mapToBean(TourGuide.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }

    public List<Voucher> getListVoucher(String tour_id){
        VoucherDAO.getInstance().updateStatusVoucher();
        List<Voucher> list = JDBIConnector.get().withHandle(h ->
                h.createQuery("select VOUCHER.* from VOUCHER inner join TOUR_VOUCHER on TOUR_VOUCHER.VOUCHER_ID =VOUCHER.VOUCHER_ID where TOUR_VOUCHER.TOUR_ID  = ? and VOUCHER.TRANGTHAI = 1")
                        .bind(0, tour_id)
                        .mapToBean(Voucher.class)
                        .stream()
                        .collect(Collectors.toList())
        );

        return list ;
    }

    public boolean likeTour(String user_id,String tourId){
        List<TourDetail> td = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select tour.* from LIKE_TOUR inner join tour on tour.TOUR_ID = LIKE_TOUR.TOUR_ID where LIKE_TOUR.TOUR_ID =? and LIKE_TOUR.USER_ID = ?")
                        .bind(0,tourId)
                        .bind(1,user_id)
                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
                );
        if (td.size() > 0) return false;

         JDBIConnector.get().withHandle(handle ->

                handle.createUpdate("insert into LIKE_TOUR values (?,?)")
                        .bind(0,tourId)
                        .bind(1,user_id)
                        .execute()
        );
        return true;

    }

    public boolean unLikeTour(String user_id,String tourId){

        JDBIConnector.get().withHandle(handle ->

                handle.createUpdate("delete from LIKE_TOUR where LIKE_TOUR.TOUR_ID =? and LIKE_TOUR.USER_ID = ?")
                        .bind(0,tourId)
                        .bind(1,user_id)
                        .execute()
        );
        return true;

    }
    public List<TourDetail> getListLikedTour(String user_id){
        List<TourDetail> llt = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select tour.* from LIKE_TOUR inner join tour on tour.TOUR_ID = LIKE_TOUR.TOUR_ID where LIKE_TOUR.USER_ID = ?")
                        .bind(0,user_id)
                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return llt;
    }
    public boolean getLikedTourDetail(String user_id,String tourId){
        List<TourDetail> llt = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select tour.* from LIKE_TOUR inner join tour on tour.TOUR_ID = LIKE_TOUR.TOUR_ID where LIKE_TOUR.TOUR_ID =? and LIKE_TOUR.USER_ID = ?")
                        .bind(0,tourId)
                        .bind(1,user_id)
                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (llt.size()!=1) return false;
        return true;
    }

    public List<TourDetail> getListIncomingSoldOutTour(){
        List<TourDetail> llt = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select * from tour  where tour.SoLuong < 10")

                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return llt;
    }
    public List<TourDetail> getListTourGuideCalendar(String guideId){
        List<TourDetail> llt = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select tour.* from tour inner join TOUR_GUIDE on TOUR_GUIDE.TOUR_ID = tour.TOUR_ID where NgayKhoiHanh > CURRENT_DATE and TOUR_GUIDE.USER_ID = ?")
                        .bind(0,guideId)
                        .mapToBean(TourDetail.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        llt.sort((o1, o2) -> o1.getNgayKhoiHanh().getTime() >=o2.getNgayKhoiHanh().getTime() ?-1:1);
        return llt;
    }
    public boolean adminCreateTour(Map<String,String > map){
        Random random = new Random();
        String id ="Tour"+ (random.nextInt(800900000,900900000) );
        int countGuide = Integer.parseInt(map.get("tourDetailCountGuide"));
        List<String> guidesId = new ArrayList<String>();
        for (int i = 1; i <= countGuide; i++) {
            String g = "tourDetailGuide"+i;
           if (map.containsKey(g)){
               String gid = map.get(g);
               guidesId.add(gid);
           }
        }



        List<String[]> listType = new ArrayList<String[]>();
        String[] NLtype = new String[3];
        NLtype[0] = id;
        NLtype[1] = "1";
        NLtype[2] = map.get("tourDetailSLVNL");
        listType.add(NLtype);
        String[] TEtype = new String[3];
        TEtype[0] = id;
        TEtype[1] = "0";
        TEtype[2] = map.get("tourDetailSLVTE");
        listType.add(TEtype);


       int countDay = Integer.parseInt(map.get("tourDetailCountDay")) ;
        List<String[]> listDay = new ArrayList<String[]>();
        for (int i = 1; i <= countDay ; i++) {
            String[] day = new String[3];
            day[0] = map.get("tourDetailDay"+i);
            day[1] = map.get("tourDetailDayTitle"+i);
            day[2] = map.get("tourDetailDayMoTa"+i);
            listDay.add(day);
        }

       if (createTourDetail(map,id)==true){
           createTourDetailGuide(guidesId,id);
           createTourDetailType(listType,id);
           createTourDetailDay(listDay,id);
           createTourDetailVoucher(map.get("tourDetailVoucher"),id);
           return true;
       }else{
           return false;
       }

    }

    public boolean adminUpdateTour(Map<String,String > map){

        String id = map.get("tourDetailId");
        int countGuide = Integer.parseInt(map.get("tourDetailCountGuide"));
        List<String> guidesId = new ArrayList<String>();
        for (int i = 1; i <= countGuide; i++) {
            String g = "tourDetailGuide"+i;
            if (map.containsKey(g)){
                String gid = map.get(g);
                guidesId.add(gid);
            }
        }



        List<String[]> listType = new ArrayList<String[]>();
        String[] NLtype = new String[3];
        NLtype[0] = id;
        NLtype[1] = "1";
        NLtype[2] = map.get("tourDetailSLVNL");
        listType.add(NLtype);
        String[] TEtype = new String[3];
        TEtype[0] = id;
        TEtype[1] = "0";
        TEtype[2] = map.get("tourDetailSLVTE");
        listType.add(TEtype);


        int countDay = Integer.parseInt(map.get("tourDetailCountDay")) ;
        List<String[]> listDay = new ArrayList<String[]>();
        for (int i = 1; i <= countDay ; i++) {
            String[] day = new String[3];
            day[0] = map.get("tourDetailDay"+i);
            day[1] = map.get("tourDetailDayTitle"+i);
            day[2] = map.get("tourDetailDayMoTa"+i);
            listDay.add(day);
        }

        if (updateTourDetail(map,id)==true){
            deleteTourDetailAll(id);
            createTourDetailGuide(guidesId,id);
            createTourDetailType(listType,id);
            createTourDetailDay(listDay,id);
            createTourDetailVoucher(map.get("tourDetailVoucher"),id);
            return true;
        }else{
            return false;
        }

    }

    public boolean createTourDetail(Map<String,String > map , String id){
      int row =  JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("insert into Tour values(?,?,?,?,?,?,?,?,?,?,?,?,?)")
                        .bind(0,id)
                        .bind(1,map.get("tourDetailName"))
                        .bind(2,map.get("tourDetailDiaDiem"))
                        .bind(3,Integer.parseInt(map.get("tourDetailTrangThai")))
                        .bind(4,map.get("tourDetailCreateDate"))
                        .bind(5,map.get("tourDetailStartDate"))
                        .bind(6,map.get("tourDetailEndDate"))
                        .bind(7,map.get("tourDetailStartDiaDiem"))
                        .bind(8,Integer.parseInt(map.get("tourDetailSoLuong")))
                        .bind(9,map.get("tourDetailVehicle"))
                        .bind(10,map.get("ImageUpload"))
                        .bind(11,map.get("tourDetailDescription"))
                        .bind(12,map.get("tourDetailCategory"))
                        .execute()

        );
        return  row!=1?false:true;
    }

    public boolean updateTourDetail(Map<String,String > map , String id){
        int row = 0;
        if (map.get("ImageUpload")==null){
            row = JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("update Tour" +
                                    " set TourName=?,DiaDiem_ID=?,TrangThai=?,NgayTao=?,NgayKhoiHanh=?,NgayKetThuc=?,NoiKhoiHanh=?,SoLuong=?,PhuongTienDiChuyen=?,Description=?,TOUR_CATEGORY=? " +
                                    "where TOUR_ID= ?")

                            .bind(0, map.get("tourDetailName"))
                            .bind(1, map.get("tourDetailDiaDiem"))
                            .bind(2, Integer.parseInt(map.get("tourDetailTrangThai")))
                            .bind(3, map.get("tourDetailCreateDate"))
                            .bind(4, map.get("tourDetailStartDate"))
                            .bind(5, map.get("tourDetailEndDate"))
                            .bind(6, map.get("tourDetailStartDiaDiem"))
                            .bind(7, Integer.parseInt(map.get("tourDetailSoLuong")))
                            .bind(8, map.get("tourDetailVehicle"))

                            .bind(9, map.get("tourDetailDescription"))
                            .bind(10, map.get("tourDetailCategory"))
                            .bind(11, id)
                            .execute()

            );
        }else {
            row = JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("update Tour" +
                                    " set TourName=?,DiaDiem_ID=?,TrangThai=?,NgayTao=?,NgayKhoiHanh=?,NgayKetThuc=?,NoiKhoiHanh=?,SoLuong=?,PhuongTienDiChuyen=?,ImageURL=?,Description=?,TOUR_CATEGORY=? " +
                                    "where TOUR_ID= ?")

                            .bind(0, map.get("tourDetailName"))
                            .bind(1, map.get("tourDetailDiaDiem"))
                            .bind(2, Integer.parseInt(map.get("tourDetailTrangThai")))
                            .bind(3, map.get("tourDetailCreateDate"))
                            .bind(4, map.get("tourDetailStartDate"))
                            .bind(5, map.get("tourDetailEndDate"))
                            .bind(6, map.get("tourDetailStartDiaDiem"))
                            .bind(7, Integer.parseInt(map.get("tourDetailSoLuong")))
                            .bind(8, map.get("tourDetailVehicle"))
                            .bind(9, map.get("ImageUpload"))
                            .bind(10, map.get("tourDetailDescription"))
                            .bind(11, map.get("tourDetailCategory"))
                            .bind(12, id)
                            .execute()

            );
        }
        return  row!=1?false:true;
    }

    public boolean deleteTourDetailAll(String id){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_GUIDE where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_TYPE where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_DETAIL_PER_DAY where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_VOUCHER where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        return  true;
    }

    public boolean deleteTour(String id){
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_GUIDE where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_TYPE where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_DETAIL_PER_DAY where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("delete from TOUR_VOUCHER where TOUR_ID =?")
                        .bind(0, id)

                        .execute()
        );
        return  true;
    }
    public boolean createTourDetailGuide(List<String> list, String id){
        for (String st:
             list) {


            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("insert into TOUR_GUIDE values(?,?)")
                            .bind(0, id)
                            .bind(1, st)
                            .execute()
            );
        }
        return true;
    }
    public boolean createTourDetailType(List<String[]> list, String id){
        for (String[] st:
                list) {


            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("insert into TOUR_TYPE values(?,?,?)")
                            .bind(0, id)
                            .bind(1,Integer.parseInt(st[1]) )
                            .bind(2,Float.parseFloat(st[2] ))
                            .execute()
            );
        }
        return true;
    }
    public boolean createTourDetailDay(List<String[]> list, String id){
        for (String[] st:
                list) {


            JDBIConnector.get().withHandle(handle ->
                    handle.createUpdate("insert into TOUR_DETAIL_PER_DAY values(?,?,?,?)")
                            .bind(0, id)
                            .bind(1,st[1])
                            .bind(2,Integer.parseInt(st[0]))
                            .bind(3,st[2])
                            .execute()
            );
        }
        return true;
    }

    public boolean createTourDetailVoucher(String voucherid, String id){


if (!voucherid.equals("none")) {
    JDBIConnector.get().withHandle(handle ->
            handle.createUpdate("insert into TOUR_VOUCHER values(?,?)")
                    .bind(0, id)
                    .bind(1, voucherid)

                    .execute()
    );
}
        return true;
    }
}
