package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.List;

public class TourPackage implements Serializable {
    private TourDetail tourDetail;
    private Destination destination;
    private List<TourDetailDays>  dayList;
    private List<TourDetailImages> imageList;
    private List<TourDetailType> typeList;
    private List<Review> reviewList;
    private List<TourGuide> guideList;

    private List<Voucher> voucherList;
    //non-constructor
    public TourPackage(){

    }
    //

    public TourPackage(TourDetail tourDetail, Destination destination, List<TourDetailDays> dayList, List<TourDetailImages> imageList, List<TourDetailType> typeList, List<Review> reviewList, List<TourGuide> guideList, List<Voucher> voucherList) {
        this.tourDetail = tourDetail;
        this.destination = destination;
        this.dayList = dayList;
        this.imageList = imageList;
        this.typeList = typeList;
        this.reviewList = reviewList;
        this.guideList = guideList;
        this.voucherList = voucherList;
    }


    // getter setter

    public TourDetail getTourDetail() {
        return tourDetail;
    }

    public void setTourDetail(TourDetail tourDetail) {
        this.tourDetail = tourDetail;
    }

    public Destination getDestination() {
        return destination;
    }

    public void setDestination(Destination destination) {
        this.destination = destination;
    }

    public List<TourDetailDays> getDayList() {
        return dayList;
    }

    public void setDayList(List<TourDetailDays> dayList) {
        this.dayList = dayList;
    }

    public List<TourDetailImages> getImageList() {
        return imageList;
    }

    public void setImageList(List<TourDetailImages> imageList) {
        this.imageList = imageList;
    }

    public List<TourDetailType> getTypeList() {
        return typeList;
    }

    public void setTypeList(List<TourDetailType> typeList) {
        this.typeList = typeList;
    }

    public List<Review> getReviewList() {
        return reviewList;
    }

    public void setReviewList(List<Review> reviewList) {
        this.reviewList = reviewList;
    }

    public List<TourGuide> getGuideList() {
        return guideList;
    }

    public void setGuideList(List<TourGuide> guideList) {
        this.guideList = guideList;
    }

    public List<Voucher> getVoucherList() {
        return voucherList;
    }

    public void setVoucherList(List<Voucher> voucherList) {
        this.voucherList = voucherList;
    }

    //


    @Override
    public String toString() {
        return "TourPackage{" +
                "tourDetail=" + tourDetail +
                ", destination=" + destination +
                ", dayList=" + dayList +
                ", imageList=" + imageList +
                ", typeList=" + typeList +
                ", reviewList=" + reviewList +
                ", guideList=" + guideList +
                ", voucherList=" + voucherList +
                '}';
    }
}
