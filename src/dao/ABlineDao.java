package dao;

import bean.ABlineBean;
import tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ABlineDao {
    public tools.DB DB;
    public ABlineDao(){
        this.DB = new DB();
    }

    //查询出某个地块所有AB线
    public ArrayList<ABlineBean> queryABline(String fDate) {
        String sql = "select * from abline where UNIX_TIMESTAMP(fDate)=UNIX_TIMESTAMP('" + fDate + "')";

        ArrayList<ABlineBean> list = null;
        ABlineBean aBlineBean = null;

        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            list = new ArrayList<ABlineBean>();
            try {
                while (rs.next()) {
                    aBlineBean = new ABlineBean();
                    aBlineBean.setId(rs.getInt("id"));
                    aBlineBean.setABDate(rs.getString("ABDate"));
                    aBlineBean.setA_Lat(rs.getString("a_lat"));
                    aBlineBean.setA_Lng(rs.getString("a_Lng"));
                    aBlineBean.setB_Lat(rs.getString("b_Lat"));
                    aBlineBean.setB_Lng(rs.getString("b_Lng"));
                    aBlineBean.setfDate(rs.getString("fDate"));
                    list.add(aBlineBean);
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
