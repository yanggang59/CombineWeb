package servlet;

import bean.FieldBean;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.FieldDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "FieldServlet",urlPatterns = {"/FieldServlet"})
public class FieldServlet extends HttpServlet{

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        //按照日期查询地块
        if(action.equals("show")){
            this.show(req, resp);
        }
        //显示所有地块
        if(action.equals("showall")){
            this.showall(req, resp);
        }
        //删除地块
        if(action.equals("delete")){
            this.delete(req, resp);
        }
        //查看单个地块
        if(action.equals("single")){
            this.single(req, resp);
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if(action.equals("show")){
            this.show(request, response);
        }
        if(action.equals("showall")){
            this.showall(request, response);
        }
        if(action.equals("delete")){
            this.delete(request, response);
        }
        if(action.equals("single")){
            this.single(request, response);
        }
    }
    public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        FieldDao fieldDao = new FieldDao();
        String startdate = req.getParameter("startdate");
        String enddate = req.getParameter("enddate");

        ArrayList<FieldBean> list = fieldDao.queryFiled(startdate, enddate);
        JsonArray array = new JsonArray();

        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                FieldBean fieldBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("fName", fieldBean.getfName());
                ob.addProperty("fDate", fieldBean.getfDate());
                ob.addProperty("fLocation", fieldBean.getfLocation());
                ob.addProperty("read", "<a href=\"FieldServlet?action=single&fDate="+ fieldBean.getfDate()+" \"target=\"_blank\">查看记录</a>");
                ob.addProperty("del", "<a href=\"FieldServlet?action=delete&fDate="+ fieldBean.getfDate()+"\">删除记录</a>");
                array.add(ob);
            }

        }
        PrintWriter out=resp.getWriter();
        out.print(array);
    }

    public void showall(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        FieldDao fieldDao = new FieldDao();

        ArrayList<FieldBean> list = fieldDao.queryFiled("0","0");
        JsonArray array = new JsonArray();

        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                FieldBean fieldBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("fName", fieldBean.getfName());
                ob.addProperty("fDate", fieldBean.getfDate());
                ob.addProperty("fLocation", fieldBean.getfLocation());
                ob.addProperty("read", "<a href=\"history_map.jsp?fDate="+ fieldBean.getfDate()+" \"target=\"_blank\">查看记录</a>");
                ob.addProperty("del", "<a href=\"FieldServlet?action=delete&fDate="+ fieldBean.getfDate()+"\">删除记录</a>");
                array.add(ob);
            }

        }
        PrintWriter out=resp.getWriter();
        out.print(array);
    }

    public void single(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FieldDao fieldDao = new FieldDao();
        String fDate = req.getParameter("fDate");

        ArrayList<FieldBean> list = fieldDao.queryFiledSingle(fDate);

        JsonArray array = new JsonArray();
        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                FieldBean fieldBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("fPLat", fieldBean.getfPLat());
                ob.addProperty("fPLng", fieldBean.getfPLng());

                array.add(ob);
            }

        }
        PrintWriter out=resp.getWriter();
        out.print(array);
    }

    public void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = "";
        String forward = "";
        String href = "";

        String fDate = req.getParameter("fDate");
        FieldDao fieldDao = new FieldDao();
        int mark = fieldDao.delField(fDate);
        if (mark>0) {
            message = message + "<li>删除记录成功！</li>";
            forward = "tishi.jsp";
            href = href + "history.jsp";
        } else {
            message = message + "<li>删除记录失败！</li>";
            forward = "tishi.jsp";
            href = href + "history.jsp";
        }
        req.setAttribute("message", message);
        req.setAttribute("href", href);
        RequestDispatcher rd = req.getRequestDispatcher(forward);
        rd.forward(req, resp);
    }


}
