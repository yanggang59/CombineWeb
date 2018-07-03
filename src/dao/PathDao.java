package dao;

import bean.ABlineBean;
import bean.PathBean;
import tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class PathDao {
    public tools.DB DB;
    public PathDao(){
        this.DB = new DB();
    }

    //查询出某个地块历史轨迹
    public ArrayList<PathBean> queryPath(String fDate) {
        String sql = "select * from path where UNIX_TIMESTAMP(fDate)=UNIX_TIMESTAMP('" + fDate + "') order by pathDate desc";

        ArrayList<PathBean> list = null;
        PathBean pathBean = null;

        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            list = new ArrayList<PathBean>();
            try {
                while (rs.next()) {
                    pathBean = new PathBean();
                    pathBean.setId(rs.getInt("id"));
                    pathBean.setfDate(rs.getString("fDate"));
                    pathBean.setLatitude(rs.getString("latitude"));
                    pathBean.setLongtitude(rs.getString("longitude"));
                    pathBean.setX(rs.getString("x"));
                    pathBean.setY(rs.getString("y"));
                    pathBean.setPathDate(rs.getString("pathDate"));

                    list.add(pathBean);
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
