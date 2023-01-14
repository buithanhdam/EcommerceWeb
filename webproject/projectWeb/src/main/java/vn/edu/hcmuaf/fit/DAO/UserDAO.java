package vn.edu.hcmuaf.fit.DAO;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.services.UserService;


import java.sql.Date;
import java.util.List;

import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

/*
Lớp userDAO dùng để bơm dữ liệu từ csdl lên chuyển qua UserService để Servlet gọi lấy dữ liệu
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm
 */
public class UserDAO {
    private static UserDAO instance;
    /*
    Non-constructor
     */
    private UserDAO(){

    }
    /*
    tạo UserDao
     */
    public static UserDAO getInstance(){
        if (instance == null) {
            instance = new UserDAO();
        }
        return instance;
    }
    /*
Phương thức checkLogin dùng để kiểm tra dữ liệu User null hoặc 1 object từ csdl lên chuyển qua UserService để Servlet gọi và kiểm
tra dăng nhập
được tạo bởi Bùi Thanh Đảm 20130217
cập nhật bởi Bùi Thanh Đảm
 */
    public User checkLogin(String username, String hashpassword) {
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        if (!user.getUser_password().equals(hashpassword)
                ||!user.getUsername().equals(username)) return null;
        return user;
    }
    /*
 Phương thức register dùng để tạo mới 1 user và cập nhật vào csdl
 được tạo bởi Bùi Thanh Đảm 20130217
 cập nhật bởi Bùi Thanh Đảm
  */
    public boolean register(String username, String email, String hashpassword, String confirm) {

//        check register with username and password
        Random random = new Random();
        String id ="User"+ (random.nextInt(99999) );
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE username = ?")
                        .bind(0, username)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (!users.isEmpty()) return false;
        if (checkEmail(email)==true) return  false;
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("insert into user values (?,null,?,?,?,null,null,null,null,null,null,null,0)")
                        .bind(0,id)
                        .bind(1,username)
                        .bind(2,email)
                        .bind(3,hashpassword)

                        .execute()
        );
        return true;
    }

    public boolean checkEmail( String email){
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE Email = ?")
                        .bind(0, email)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size()==0){
            return false;
        }else{
            return true;
        }
    }

    public boolean uploadProfileImage(Map<String,String> map){
        int row = JDBIConnector.get().withHandle(handle -> handle.createUpdate("update USER " +
                "set ImageURL = ? " +
                "where User.USER_ID = ? ")
                .bind(0,map.get("ImageUpload"))
                .bind(1,map.get("userId")).execute()
        );
        return row!=1?false:true;
    }
    public List<User> getListGuide(){
        List<User> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT  * from user where user.USER_Role = 1")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public List<User> getListEmployee(){
        List<User> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT  * from user where user.USER_Role > 0")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }
    public List<User> getListGuideOnBusy(){
        List<User> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT user.* FROM User INNER JOIN tour_guide on tour_guide.USER_ID = user.USER_ID  WHERE user.USER_Role =1 ")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public List<User> getListKhachHang(){
        List<User> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT  * from user where user.USER_Role = 0")
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        return list;
    }

    public User getGuideById(String user_id){
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE user.USER_ID = ? and user.USER_Role=1")
                        .bind(0, user_id)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        return users.get(0);
    }
    public User getUserById(String user_id){
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE user.USER_ID = ?")
                        .bind(0, user_id)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        return users.get(0);
    }
    public User updateUserProfile(String user_id,String profileFullName,String profileTelephone,String profileDate,String profileGioiTinh,String profileAddress,String profileCmnd){
        Object o = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update user " +
                        "set FullName  = ? , Phone =? , Birth =? , GioiTinh  = ? ,DiaChi =?,CMND =? \n" +
                        "where USER_ID = ?"
                ).bind(0,profileFullName==""?null:profileFullName)
                        .bind(1,profileTelephone==""?null:profileTelephone)
                        .bind(2,profileDate==""?null:profileDate)
                        .bind(3,profileGioiTinh==""?null:profileGioiTinh)
                        .bind(4,profileAddress==""?null:profileAddress)
                        .bind(5,profileCmnd==""?null:profileCmnd)
                        .bind(6,user_id)
                        .execute()
        );
        User user = o==null?null:getUserById(user_id);
        return user;
    }

    public boolean AuthorizationUser(String userId , String option, String currRole){
        int role = Integer.parseInt(currRole);
        if (option.equals("levelUp")){
            role += 1;
        }else{
           role -= 1;
        }
        int finalRole = role;
        int row = JDBIConnector.get().withHandle(handle ->
                handle.createUpdate("update user " +
                                "set USER_Role =?  \n" +
                                "where USER_ID = ?"
                        )
                        .bind(0, finalRole)
                        .bind(1,userId)
                        .execute()
        );

        return row != 1?false:true;
    }
    public User getCurrentUserByIdAndPassword(String user_id,String oldHashPassword){
        List<User> users = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM user WHERE user_id = ? ")
                        .bind(0, user_id)
                        .mapToBean(User.class)
                        .stream()
                        .collect(Collectors.toList())
        );
        if (users.size() != 1) return null;
        User user = users.get(0);
        if (!user.getUser_password().equals(oldHashPassword))return null;
        return user;
    }
    public User changeUserPassword(User user , String newHashPassword){
        String userId = user.getUser_Id();
        int rows = JDBIConnector.get().withHandle(h ->
                h.createUpdate("update user \n" +
                                "set USER_Password = ?  \n" +
                                " where USER_ID = ?")
                        .bind(0, newHashPassword)
                        .bind(1,userId)
                        .execute()

        );
        if (rows == 1) return  getUserById(userId);
        return null;
    }

    public boolean newUserPassword(String email , String newHashPassword){

        int rows = JDBIConnector.get().withHandle(h ->
                h.createUpdate("update user \n" +
                                "set USER_Password = ?  \n" +
                                " where Email = ?")
                        .bind(0, newHashPassword)
                        .bind(1,email)
                        .execute()

        );

        return rows!=1?false:true;
    }

    public boolean createGuide(Map<String,String> map){
        Random random = new Random();
        String id ="User"+ (random.nextInt(900000000,998000000));
       int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("insert into user values (?,?,?,?,?,?,?,?,?,?,?,null,1)")
                        .bind(0,id)
                        .bind(1,map.get("fullNameGuide"))
                        .bind(2,map.get("usernameGuide"))
                        .bind(3,map.get("emailGuide"))
                        .bind(4, UserService.getInstance().hashPassword(map.get("passwordGuide")))
                        .bind(5,map.get("phoneGuide"))
                        .bind(6, map.get("birthGuide"))
                        .bind(7,map.get("ImageUpload"))
                        .bind(8,map.get("gioiTinhGuide"))
                        .bind(9,map.get("cmndGuide"))
                        .bind(10,map.get("diachiGuide"))
                        .execute()
        );
       if (row != 1) return false;
       return true;
    }
    public boolean updateGuide(Map<String,String> map){
        int row =0 ;
        String id = map.get("idGuide");
        if (map.get("ImageUpload")==null){
            row = JDBIConnector.get().withHandle(
                    handle -> handle.createUpdate("update user " +
                                    "set FullName =? ,Username =? ,Email =?,USER_Password =?,Phone =?,Birth =?,GioiTinh =?,CMND =?,DiaChi =?  " +
                                    "where USER_ID =?")

                            .bind(0, map.get("fullNameGuide"))
                            .bind(1, map.get("usernameGuide"))
                            .bind(2, map.get("emailGuide"))
                            .bind(3, map.get("passwordGuide"))
                            .bind(4, map.get("phoneGuide"))
                            .bind(5, map.get("birthGuide"))

                            .bind(6, map.get("gioiTinhGuide"))
                            .bind(7, map.get("cmndGuide"))
                            .bind(8, map.get("diachiGuide"))
                            .bind(9, id)
                            .execute()
            );
        }else {
             row = JDBIConnector.get().withHandle(
                    handle -> handle.createUpdate("update user " +
                                    "set FullName =? ,Username =? ,Email =?,USER_Password =?,Phone =?,Birth =?,ImageURL =?,GioiTinh =?,CMND =?,DiaChi =?  " +
                                    "where USER_ID =?")

                            .bind(0, map.get("fullNameGuide"))
                            .bind(1, map.get("usernameGuide"))
                            .bind(2, map.get("emailGuide"))
                            .bind(3, map.get("passwordGuide"))
                            .bind(4, map.get("phoneGuide"))
                            .bind(5, map.get("birthGuide"))
                            .bind(6, map.get("ImageUpload"))
                            .bind(7, map.get("gioiTinhGuide"))
                            .bind(8, map.get("cmndGuide"))
                            .bind(9, map.get("diachiGuide"))
                            .bind(10, id)
                            .execute()
            );
        }
        if (row != 1) return false;
        return true;
    }
    public boolean deleteGuide(String id){
        int row =  JDBIConnector.get().withHandle(
                handle -> handle.createUpdate("delete from user where USER_ID = ?")
                        .bind(0,id)
                        .execute()
        );
        if (row != 1) return false;
        return true;
    }

    public static void main(String[] args) {

       User b =  getInstance().updateUserProfile("Kh","aaa","","","","","");
        System.out.println(b.toString());
    }
}
