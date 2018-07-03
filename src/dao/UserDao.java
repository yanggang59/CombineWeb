package dao;

import bean.UserBean;
import tools.DB;

import java.sql.ResultSet;

public class UserDao {
    public DB DB;
    public UserDao(){
        this.DB = new DB();
    }
    public UserBean login(String username, String password){
        String sql = "select * from user where uname='" + username + "' and password='" + password + "'";

        ResultSet rs = this.DB.executeQuery(sql);
        UserBean user = new UserBean();

        try{
            if((rs != null) && rs.next()){
                user.setUid(rs.getInt("uid"));
                user.setUname(rs.getString("uname"));
                user.setPassword(rs.getString("password"));
            }
            else {
                user = null;
            }
        }
        catch (Exception e){
            e.printStackTrace();
            user = null;
        }
        finally {
            this.DB.closed();
        }
        return user;
    }
}
