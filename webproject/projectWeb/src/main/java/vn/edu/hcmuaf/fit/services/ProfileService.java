package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.DAO.UserDAO;
import vn.edu.hcmuaf.fit.bean.User;

public class ProfileService {

    private static ProfileService instance;

    private ProfileService(){

    }

    public static ProfileService getInstance(){
        if (instance == null) instance = new ProfileService();
        return instance;
    }

    public User updateUserProfile(String user_id, String profileFullName, String profileTelephone, String profileDate, String profileGioiTinh, String profileAddress, String profileCmnd) {
        return UserDAO.getInstance().updateUserProfile( user_id, profileFullName, profileTelephone, profileDate, profileGioiTinh, profileAddress, profileCmnd);
    }
    }
