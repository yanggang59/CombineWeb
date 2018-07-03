package dao;

import bean.CombineDataBean;
import tools.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CombineDataDao {

    public tools.DB DB;
    public CombineDataDao(){
        this.DB = new DB();
    }

    //查询出CANID的所有数据
    public ArrayList<CombineDataBean> queryCombineData(String CANID) {
        String sql = "select * from combinedata where CANID="+CANID;

        ArrayList<CombineDataBean> list = null;
        CombineDataBean combineDataBean = null;

        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            list = new ArrayList<CombineDataBean>();
            try {
                while (rs.next()) {
                    combineDataBean = new CombineDataBean();
                    combineDataBean.setID(rs.getInt("ID"));
                    combineDataBean.setCanID(rs.getString("CANID"));
                    combineDataBean.setData(rs.getString("DATA"));
                    combineDataBean.setTimestamp(rs.getString("TIMESTAMP"));
                    list.add(combineDataBean);
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


    /**
     * 增加combineDataBean记录
     * @param combineDataBean
     */
    public void add(CombineDataBean combineDataBean) {

        String sql = "insert into combinedata values(null,?,?,?)";

        this.DB.setStatement();

        try (Connection c = this.DB.getConnection(); PreparedStatement ps = c.prepareStatement(sql,this.DB.getStatement().RETURN_GENERATED_KEYS);) {

            ps.setString(1, combineDataBean.getCanID());

            ps.setString(2, combineDataBean.getData());

            ps.setString(3, combineDataBean.getTimestamp());

            ps.execute();

            ResultSet rs = ps.getGeneratedKeys();

            if (rs.next()) {
                int id = rs.getInt(1);
                combineDataBean.setID(id);
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
    }




}
