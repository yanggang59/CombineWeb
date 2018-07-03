package tools;

import java.sql.*;

public class DB {
    private Connection conn = null;
    private Statement st = null;

    /*设置数据库连接*/
    public void setConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("成功加载数据库驱动");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("加载数据库驱动失败");
        }
        try {
            String url = "jdbc:mysql://210.51.26.138:3306/car_host";
            this.conn = DriverManager.getConnection(url,"root","root");
            System.out.println("连接数据库成功");
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("连接数据库失败");
        }
    }

    /*返回数据库连接*/
    public Connection getConnection()
    {
        return conn;
    }



    /*设置Statement对象*/
    public  void setStatement(){
        this.setConnection();
        try{
            this.st = this.conn.createStatement();
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("创建Statement对象失败");
        }
    }

    /*返回Statement对象*/
    public Statement getStatement() {
        return st;
    }


    /*关闭Statement对象，关闭数据库连接*/
    public void closed(){
        if(this.st != null){
            try {
                this.st.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("关闭对象失败");
            }
        }
        if(this.conn != null){
            try {
                this.conn.close();
            }
            catch (SQLException e){
                e.printStackTrace();
                System.out.println("断开数据库连接失败");
            }
        }
    }

    /*执行更新数据库操作*/
    public int executeUpdate(String sql){
        int UpdateNum = 0;
        this.setStatement();
        try{
            UpdateNum = this.st.executeUpdate(sql);
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("执行更新数据操作失败");
        }
        return UpdateNum;//返回更新条数
    }

    /*执行查询数据库操作*/
    public ResultSet executeQuery(String sql){
        ResultSet rs = null;
        this.setStatement();
        try{
            rs = this.st.executeQuery(sql);
        }
        catch (Exception e){
            e.printStackTrace();
            System.out.println("执行查询数据操作失败");
        }
        return rs;
    }
}
