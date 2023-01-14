package vn.edu.hcmuaf.fit.services;


import vn.edu.hcmuaf.fit.DAO.UserDAO;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/*
Class UserService chứa các phương thức làm việc với Model User : đăng nhập,đăng ký,..
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm
 */
public class UserService {
    private static UserService instance;
    private static Random random;
    private static Map<String,String> users= new HashMap<>();
    static {
        users.put("admin","admin");
        users.put("user","user");
        users.put("ti","123");
    }
    /*
    Non-constructor
     */
    private UserService() {
    }

    public static UserService getInstance() {
        if (instance == null) {
            instance = new UserService();
        }
        return instance;
    }

    /*
    Kiểm tra đăng nhập User trả về null hoặc 1 object User
     */
    public User checkLogin(String username, String password) {
        return UserDAO.getInstance().checkLogin(username,hashPassword(password));
    }
    public String hashPassword(String password) {
        try {
            MessageDigest sha256 = null;
            sha256 = MessageDigest.getInstance("SHA-256");
            byte[] hash = sha256.digest(password.getBytes());
            BigInteger number = new BigInteger(1, hash);
            return number.toString(16);
        } catch (NoSuchAlgorithmException e) {
            return null;
        }
    }

    public boolean register(String username, String email, String password, String confirm) {
       random = new Random();
       return UserDAO.getInstance().register(username, email, hashPassword(password), confirm);

    }
    public boolean AuthorizationUser(String userId , String option, String currRole){return  UserDAO.getInstance().AuthorizationUser(userId,option,currRole);}
    public boolean uploadProfileImage(Map<String,String> map){return UserDAO.getInstance().uploadProfileImage(map);}
    public List<User> getListGuide(){
        return UserDAO.getInstance().getListGuide();
    }
    public List<User> getListGuideOnBusy(){return UserDAO.getInstance().getListGuideOnBusy();}
    public User getGuideById(String user_id){
        return UserDAO.getInstance().getGuideById(user_id);
    }
    public User getCurrentUserByIdAndPassword(String user_id,String oldHashPassword){
        return  UserDAO.getInstance().getCurrentUserByIdAndPassword(user_id, hashPassword(oldHashPassword));
    }
    public User changeUserPassword(User user , String newHashPassword){
        return  UserDAO.getInstance().changeUserPassword(user,hashPassword(newHashPassword));
    }
    public List<User> getListEmployee(){return UserDAO.getInstance().getListEmployee();}
    public boolean newUserPassword(String email , String Password){return UserDAO.getInstance().newUserPassword(email,hashPassword(Password));}
    public List<User> getListKhachHang(){
        return UserDAO.getInstance().getListKhachHang();
    }
    public boolean deleteGuide(String id){
        return UserDAO.getInstance().deleteGuide(id);
    }
    public boolean updateGuide(Map<String,String> map){
        return UserDAO.getInstance().updateGuide(map);
    }
    public boolean createGuide(Map<String,String> map){
        return UserDAO.getInstance().createGuide(map);
    }

}
