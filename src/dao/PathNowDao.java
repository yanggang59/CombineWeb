package dao;


import bean.PathNowBean;
import tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PathNowDao {
    public tools.DB DB;
    public PathNowDao(){
        this.DB = new DB();
    }
    public ArrayList<PathNowBean> queryLocation() {
//        String sql = "select * from autocar where deviceid='" + deviceid + "' order by date desc limit 0,1";
        String sql = "select * from path_now order by pathDate desc";


        ArrayList<PathNowBean> list = new ArrayList();


        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            try {
                while (rs.next()) {
                    PathNowBean pathNowBean = new PathNowBean();
                    pathNowBean.setId(rs.getInt("id"));
                    pathNowBean.setfDate(rs.getString("fDate"));
                    pathNowBean.setLatitude(rs.getString("latitude"));
                    pathNowBean.setLongtitude(rs.getString("longitude"));
                    pathNowBean.setX(rs.getString("x"));
                    pathNowBean.setY(rs.getString("y"));
                    pathNowBean.setPathDate(rs.getString("pathDate"));
                    list.add(pathNowBean);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                list = null;
            } finally {
                this.DB.closed();
            }
        }

        return list;
    }
}
