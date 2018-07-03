package servlet;

import bean.ABlineBean;
import bean.FieldBean;
import bean.PathBean;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.ABlineDao;
import dao.PathDao;
import javafx.geometry.Pos;

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

@WebServlet(name = "PathServlet",urlPatterns = {"/PathServlet"})
public class PathServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        //加载轨迹线
        if (action.equals("show")) {
            this.show(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        //加载轨迹线
        if (action.equals("show")) {
            this.show(req, resp);
        }
    }
    public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PathDao pathDao = new PathDao();
        String fDate = req.getParameter("fDate");
        ArrayList<PathBean> list = pathDao.queryPath(fDate);
        JsonArray array = new JsonArray();
        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                PathBean pathBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("latitude", pathBean.getLatitude());
                ob.addProperty("longitude", pathBean.getLongtitude());
                array.add(ob);
            }
        }
        PrintWriter out=resp.getWriter();
        out.print(array);
    }
}
