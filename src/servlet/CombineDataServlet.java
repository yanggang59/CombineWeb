package servlet;

import bean.CombineDataBean;
import dao.CombineDataDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CombineDataServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");
        if(action.equals("upload")){
            this.addData(req, resp);
        }
    }


    /**
     * 添加记录
     * @param req
     * @param resp
     */
    private void addData(HttpServletRequest req, HttpServletResponse resp) {

        String CANID = req.getParameter("CANID");
        String DATA = req.getParameter("DATA");
        String TIMESTAMP = req.getParameter("TIMESTAMP");

        CombineDataDao combineDataDao=new CombineDataDao();
        combineDataDao.add(new CombineDataBean(CANID,DATA,TIMESTAMP));

        System.out.println("Data Added");
    }
}
