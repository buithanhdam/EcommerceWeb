package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.AboutUs;
import vn.edu.hcmuaf.fit.bean.BlogImage;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class AboutUsDAO {
    private static AboutUsDAO instance;
    private AboutUsDAO(){}

    public static AboutUsDAO getInstance(){
        if (instance ==null) instance = new AboutUsDAO();
        return instance;
    }

    public AboutUs getAboutUs(){
        List<AboutUs> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select * from aboutus")

                        .mapToBean(AboutUs.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list.get(0);
    }
    public List<AboutUs> getListAboutUs(String aboutusId){
        List<AboutUs> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("select * from aboutus_detail where Aboutus_id = ?")
                        .bind(0,aboutusId)
                        .mapToBean(AboutUs.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
}
