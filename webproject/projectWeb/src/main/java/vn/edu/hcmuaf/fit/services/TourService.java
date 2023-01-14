package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.TourDAO;
import vn.edu.hcmuaf.fit.bean.Tour;
import vn.edu.hcmuaf.fit.db.JDBIConnector;


import java.sql.Date;
import java.time.LocalDate;
import java.util.*;

import java.util.stream.Collectors;

/*
Class TourService dùng để sử dụng các phương thức lên 1 Tour
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm
 */
public class TourService {
    private  static TourService instance ;

    public  TourService(){

    };
    public static TourService getInstance(){
        if (instance == null) {
            instance = new TourService();
        }
        return instance;
    }
    /*
    Phương thức lấy dữ liệu các Tour từ cơ sở dữ liệu trả lại 1 List sản phẩm Tour
     */
    public List<Tour> getListTour(){

        return TourDAO.getInstance().getListTour();
    }
    public List<Tour> getAllTour(){return TourDAO.getInstance().getAllTour();}
    /*
    Phương thức lấy dữ liệu các Tour từ cơ sở dữ liệu qua 1 1 đoạn căn bản tìm kiếm trả lại 1 List sản phẩm Tour
     */
    public List<Tour> getListBySearchText(String textSearch){

        return TourDAO.getInstance().getListBySearchText(textSearch) ;
    }
    public List<Tour> getListIncomingTour(){
        return TourDAO.getInstance().getListIncomingTour();
    }

    public List<Tour> getRandomListTour(){
        Random random = new Random();
        List<Tour> list = TourDAO.getInstance().getListTour();
        List<Tour> ranlist = new ArrayList<Tour>();
        for (int i = 0; i < 4; i++) {
            int j = random.nextInt(list.size());
            ranlist.add(list.get(j));
        }

        return ranlist;
    }

    public List<Tour> findListTourBySearchFilter(String searchText,String searchDiaDiem
        ,String searchCategory,String searchDay,String searchPrice,String searchPersons
        ,String searchDate){

        List<String> list = new ArrayList<String>();
        if (searchDiaDiem != "") list.add(" DiaDiem_ID = '"+searchDiaDiem+"' ");
        if (searchCategory != "") list.add(" TOUR_CATEGORY = '"+searchCategory+"' ");
        if (searchDate != "") list.add(" NgayKhoiHanh = '"+searchDate+"' ");
        if (searchPrice != ""){
            float price = Float.parseFloat(searchPrice);
            if (price >= 20000001) {
                list.add(" tour_type.GiaVe >= "+price+" ");
            }else{
                list.add(" tour_type.GiaVe <= "+price+" ");
            }
        };
        if (searchPersons != "") list.add(" SoLuong >= "+Integer.parseInt(searchPersons)+" ");
        if (searchDay != "") list.add(" DATEDIFF(NgayKhoiHanh,NgayKetThuc) = "+Integer.parseInt(searchDay)+" ");
        return TourDAO.getInstance().findListTourBySearchFilter(searchText,list);
    }

    public List<Tour> getSoldOutTour(){return  TourDAO.getInstance().getSoldOutTour();}
    public List<Tour> getListPopularTour(){
        return TourDAO.getInstance().getListPopularTour();
    }
    public List<Tour> getNewTour(){return TourDAO.getInstance().getNewTour();}
    public Map<Integer,List<Tour>> getMapVoucherTour(){
        return TourDAO.getInstance().getMapVoucherTour();
    }
    public static void main(String[] args) {
//       List<Tour> list = getInstance().findListTourBySearchFilter("","","","","3000000","","");
        Date date = Date.valueOf(LocalDate.now());
       System.out.println(date.toString());
    }

}
