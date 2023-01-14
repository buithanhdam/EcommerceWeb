package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.*;

public class Cart implements Serializable {
    private String User_id;
    private Map<String,TourCart> listTourCart;

    public Cart(String user_id){
        this.User_id = user_id;
    }
    public Cart(){

    }
    public Cart(String user_id, Map<String, TourCart> listTourCart) {
        User_id = user_id;
        this.listTourCart = listTourCart;
    }

    public String getUser_id() {
        return User_id;
    }

    public void setUser_id(String user_id) {
        User_id = user_id;
    }

    public Map<String, TourCart> getListTourCart() {
        sortCart();
        return this.listTourCart;
    }

    public void setListTourCart(Map<String, TourCart> listTourCart) {
        this.listTourCart = listTourCart;
    }

    public TourCart findTourCartByTourId(String user_id,String tour_id){
        if (getUser_id().equals(user_id)){
            if (getListTourCart().containsKey(tour_id)){
                return getListTourCart().get(tour_id);
            }else{
                return null;
            }
        }
        return null;
    }
    public void removeTourCart(String key){
        this.listTourCart.remove(key);
    }
    public void addTourCart(TourCart tc){

        if (this.listTourCart.containsKey(tc.getTOUR_ID())){
            removeTourCart(tc.getTOUR_ID());
            this.listTourCart.put(tc.getTOUR_ID(),tc);
        }else{
            this.listTourCart.put(tc.getTOUR_ID(),tc);
        }
        sortCart();
    }
    public void sortCart(){
        LinkedHashMap<String, TourCart> sortedMap = new LinkedHashMap<>();
        ArrayList<TourCart> list = new ArrayList<>();

        for (Map.Entry<String, TourCart> entry : this.listTourCart.entrySet()) {
            list.add(entry.getValue());
        }
        Collections.sort(list, new Comparator<TourCart>() {
            public int compare(TourCart o1, TourCart o2) {
                return o1.getNgayTao().getTime() >= o2.getNgayTao().getTime()?-1:1;
            }
        });

        for (TourCart tc : list) {

            sortedMap.put(tc.getTOUR_ID(), tc);

        }
        this.listTourCart = sortedMap;
    }
    @Override
    public String toString() {
        return "Cart{" +
                "User_id='" + User_id + '\'' +
                ", listTourCart=" + listTourCart +
                '}';
    }
}
