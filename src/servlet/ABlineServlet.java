package servlet;

import bean.ABlineBean;
import bean.FieldBean;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.ABlineDao;

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

@WebServlet(name = "ABlineServlet",urlPatterns = {"/ABlineServlet"})
public class ABlineServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        //加载AB线
        if (action.equals("show")) {
            this.show(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        //加载AB线
        if (action.equals("show")) {
            this.show(req, resp);
        }
    }

    public void show(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ABlineDao aBlineDao = new ABlineDao();
        String fDate = req.getParameter("fDate");

        ArrayList<ABlineBean> list = aBlineDao.queryABline(fDate);

        JsonArray array = new JsonArray();
        for(int i=0; i<list.size(); i=i+1){
            if (i<list.size()){
                ABlineBean aBlineBean = list.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("a_Lat", aBlineBean.getA_Lat());
                ob.addProperty("a_Lng", aBlineBean.getA_Lng());
                ob.addProperty("b_Lat", aBlineBean.getB_Lat());
                ob.addProperty("b_Lng", aBlineBean.getB_Lng());
                array.add(ob);
            }

        }
        PrintWriter out=resp.getWriter();
        out.print(array);
    }
}
