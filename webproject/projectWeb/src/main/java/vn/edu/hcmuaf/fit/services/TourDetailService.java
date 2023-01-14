package vn.edu.hcmuaf.fit.services;


import vn.edu.hcmuaf.fit.DAO.DestinationDAO;
import vn.edu.hcmuaf.fit.DAO.ReviewDAO;
import vn.edu.hcmuaf.fit.DAO.TourDAO;
import vn.edu.hcmuaf.fit.DAO.TourDetailDAO;
import vn.edu.hcmuaf.fit.bean.*;

import java.util.List;
import java.util.Map;

public class TourDetailService {
    private static TourDetailService instance;

    private TourDetailService(){

    }

    public static TourDetailService getInstance(){
        if (instance == null) instance = new TourDetailService();
        return instance;
    }

    public TourDetail getTourDetail(String tour_id){
        return TourDAO.getInstance().getTourDetail(tour_id);
    }



    public List<TourDetailDays> getListDay(String tour_id){
        return TourDetailDAO.getInstance().getListDay(tour_id);
    }
    public List<TourDetailImages> getListImage(String tour_id){
        return TourDetailDAO.getInstance().getListImage(tour_id);
    }

    public List<TourDetailType> getListType(String tour_id){
        return TourDetailDAO.getInstance().getListType(tour_id);
    }
    public List<Review> getListReview(String tour_id){
        return ReviewDAO.getInstance().getListReview(tour_id);
    }
    public List<TourGuide> getListGuide(String tour_id){
        return TourDetailDAO.getInstance().getListGuide(tour_id);
    }
    public List<Voucher> getListVoucher(String tour_id){
        return TourDetailDAO.getInstance().getListVoucher(tour_id);
    }
    public TourPackage getTourPackageDetail(String tour_id){

        TourDetail td = getTourDetail(tour_id);
        Destination d = DestinationDAO.getInstance().getOneDestination(td.getDiaDiem_ID());
        List<TourDetailDays> tdd = getListDay(tour_id);
        List<TourDetailImages> tdi = getListImage(tour_id);
        List<TourDetailType> tdt = getListType(tour_id);
        List<Review> r = getListReview(tour_id);
        List<TourGuide> tg = getListGuide(tour_id);
        List<Voucher> v = getListVoucher(tour_id);
        TourPackage tp = new TourPackage(td,d,tdd,tdi,tdt,r,tg,v);

        return tp;
    }
    public List<TourDetail> getListTourGuideCalendar(String guideId){return TourDetailDAO.getInstance().getListTourGuideCalendar(guideId);}
    public boolean getLikedTourDetail(String user_id,String tourId){
        return TourDetailDAO.getInstance().getLikedTourDetail(user_id,tourId);
    }
    public List<TourDetail> getListLikedTour(String user_id){
        return TourDetailDAO.getInstance().getListLikedTour(user_id);
    }
    public boolean unLikeTour(String user_id,String tourId){
        return TourDetailDAO.getInstance().unLikeTour(user_id,tourId);
    }
    public boolean likeTour(String user_id,String tourId){
        return TourDetailDAO.getInstance().likeTour(user_id,tourId);
    }
    public List<TourDetail> getListIncomingSoldOutTour(){return TourDetailDAO.getInstance().getListIncomingSoldOutTour();}

    public boolean adminCreateTour(Map<String,String > map){return TourDetailDAO.getInstance().adminCreateTour(map);}
    public boolean adminUpdateTour(Map<String,String > map){return  TourDetailDAO.getInstance().adminUpdateTour(map);}
    public boolean deleteTour(String id){return TourDetailDAO.getInstance().deleteTour(id);}
}
