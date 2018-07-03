package dao;

import bean.FieldBean;
import tools.DB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FieldDao {
    public DB DB;
    public FieldDao(){
        this.DB = new DB();
    }

    //查询出所有地块
    public ArrayList<FieldBean> queryFiled(String startdate, String enddate){
        String sql;
        if (startdate.equals("0")){
            sql = "select * from field where fPNo=1 order by id desc";
        }
        else{
            sql = "select * from field where to_days(fDate)>=to_days('"+startdate+"') and to_days(fDate)<=to_days('"+enddate+"') and fPNo=1 order by id desc";
        }

        ArrayList<FieldBean> list = null;
        FieldBean fieldBean = null;

        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            list = new ArrayList<FieldBean>();
            try {
                while (rs.next()) {
                    fieldBean = new FieldBean();
                    fieldBean.setId(rs.getInt("id"));
                    fieldBean.setfID(rs.getString("fID"));
                    fieldBean.setfName(rs.getString("fName"));
                    fieldBean.setfDate(rs.getString("fDate"));
                    fieldBean.setfPNo(rs.getString("fPNo"));
                    fieldBean.setfPLat(rs.getString("fPLat"));
                    fieldBean.setfPLng(rs.getString("fPLng"));
                    fieldBean.setfPX(rs.getString("fPX"));
                    fieldBean.setfPY(rs.getString("fPY"));
                    fieldBean.setfLocation(rs.getString("fLocation"));
                    list.add(fieldBean);
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

    //查询某一个地块
    public ArrayList<FieldBean> queryFiledSingle(String fDate){
        String sql = "select * from field where UNIX_TIMESTAMP(fDate)=UNIX_TIMESTAMP('"+fDate+"') order by fPNo desc";
        ArrayList<FieldBean> list = null;
        FieldBean fieldBean = null;

        ResultSet rs = this.DB.executeQuery(sql);

        if (rs != null) {
            list = new ArrayList<FieldBean>();
            try {
                while (rs.next()) {
                    fieldBean = new FieldBean();
                    fieldBean.setId(rs.getInt("id"));
                    fieldBean.setfID(rs.getString("fID"));
                    fieldBean.setfName(rs.getString("fName"));
                    fieldBean.setfDate(rs.getString("fDate"));
                    fieldBean.setfPNo(rs.getString("fPNo"));
                    fieldBean.setfPLat(rs.getString("fPLat"));
                    fieldBean.setfPLng(rs.getString("fPLng"));
                    fieldBean.setfPX(rs.getString("fPX"));
                    fieldBean.setfPY(rs.getString("fPY"));
                    fieldBean.setfLocation(rs.getString("fLocation"));
                    list.add(fieldBean);
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

    //删除地块
    public int delField(String fDate){
        System.out.println(fDate);
        String sql = "delete from field where UNIX_TIMESTAMP(fDate)=UNIX_TIMESTAMP('"+fDate+"')" ;
        int mark = this.DB.executeUpdate(sql);
        return mark;
    }
}
