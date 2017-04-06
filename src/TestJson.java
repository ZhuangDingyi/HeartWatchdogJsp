/*
 * Created by Administrator on 2017/3/1.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.List;
    import javax.servlet.RequestDispatcher;
    import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
    import com.google.gson.JsonArray;
    import com.google.gson.JsonObject;
    import com.zyf.Info;
    import com.zyf.dao.InfoDao;
@WebServlet(
        urlPatterns = {"/TestJson"},
        name = "TestJson"
)
public class TestJson extends HttpServlet {
        public void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
            doPost(request,response);
        }
        public void doPost(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
            InfoDao infodao = new InfoDao();
            int id = 1;
            List infoList = infodao.queryInfo(id);
            request.setAttribute("infoList", infoList);
            JsonArray array = new JsonArray();
            for (int i = 0; i < infoList.size(); i++) {
                Info single = (Info) infoList.get(i);
                JsonObject ob = new JsonObject();
                ob.addProperty("id", i+1);
                ob.addProperty("date", single.getDate());
                ob.addProperty("read", "<a href=\"InfoServlet?action=single&id="+single.getId()+" \"target=\"_blank\">查看记录</a>");
                ob.addProperty("del", "<a href=\"InfoServlet?action=delete&id="+single.getId()+"\">删除记录</a>");
                array.add(ob);
            }
            PrintWriter out=response.getWriter();
            out.print(array);
            System.out.println(array);
        }
    }

