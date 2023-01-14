package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.DestinationDAO;
import vn.edu.hcmuaf.fit.bean.Destination;

import java.util.List;

public class DestinationService {
    private static DestinationService instance;

    private DestinationService(){

    }
    public static DestinationService getInstance(){
        if (instance==null)instance= new DestinationService();
        return instance;
    }

    public Destination getOneDestination(String Des_id){
        return DestinationDAO.getInstance().getOneDestination(Des_id);
    }
    public List<Destination> getPopularDestination(){
        return DestinationDAO.getInstance().getPopularDestination();
    }
    public List<Destination> getDestination(){
        return DestinationDAO.getInstance().getDestination();
    }

}
