package servlet;


import bean.PathNowBean;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.PathNowDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "PathNowServlet",urlPatterns = {"/PathNowServlet"})
public class PathNowServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if(action.equals("get")){
            this.get(req, resp);
        }
    }
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action.equals("get")){
            this.get(request, response);
        }
    }

    public void get(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        ArrayList<PathNowBean> list = null;
        PathNowDao pathNowDao = new PathNowDao();

        list = pathNowDao.queryLocation();


        JsonArray array = new JsonArray();
        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                PathNowBean pathNowBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("latitude", pathNowBean.getLatitude());
                ob.addProperty("longitude", pathNowBean.getLongtitude());
                array.add(ob);
            }
        }

        System.out.println(array);

        PrintWriter out=resp.getWriter();
        out.print(array);

    }
}
