package com.zyf.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.zyf.Info;
import com.zyf.User;
import com.zyf.dao.InfoDao;
import com.zyf.tools.MyTools;
import org.apache.log4j.Logger;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;

/*
 * Created by viczyf on 2017/2/9.
 */
public class InfoServlet extends HttpServlet {
    public InfoServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("delete")) {
            this.deleteInfo(request, response);
        }

        if (action.equals("list")) {
            this.selectInfo(request, response);
        }
        if (action.equals("single")) {
            this.singleInfo(request, response);
        }
        if(action.equals("tend")){
            this.tendInfo(request,response);
        }
        if(action.equals("time")){
            this.select_time_info(request,response);
        }
    }

    public void selectInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InfoDao infodao = new InfoDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        List infoList = infodao.queryInfo(id);
//        request.setAttribute("infoList", infoList);
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
//        RequestDispatcher rd = request.getRequestDispatcher("infolist.jsp");
//        request.setAttribute("listjson", array);
//        rd.forward(request, response);
    }
    public void select_time_info(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InfoDao infodao = new InfoDao();
        String startdate=request.getParameter("startdate");
        String enddate=request.getParameter("enddate");
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        List infoList = infodao.queryTimeInfo(id,startdate,enddate);
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
//        System.out.println(array);
    }

    public void deleteInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String message = "";
        String forward = "";
        String href = "";
        InfoDao infodao = new InfoDao();
        int id = MyTools.strToint(request.getParameter("id"));
        Info info = new Info();
        info.setId(id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int uid=user.getUid();
        boolean mark = infodao.delInfo(info,uid);
        if (mark) {
            message = message + "<li>删除记录成功！</li>";
            forward = "tishi.jsp";
            href = href + "Infotime.jsp";
        } else {
            message = message + "<li>删除记录失败！</li>";
            forward = "tishi.jsp";
            href = href + "Infotime.jsp";
        }
        request.setAttribute("message", message);
        request.setAttribute("href", href);
        RequestDispatcher rd = request.getRequestDispatcher(forward);
        rd.forward(request, response);
    }
    public void singleInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InfoDao infodao = new InfoDao();
        int id = MyTools.strToint(request.getParameter("id"));
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid=user.getUid();
        Info infosingle = infodao.queryInfoSingle(id,uid);
        request.setAttribute("infosingle", infosingle);
        RequestDispatcher rd = request.getRequestDispatcher("infosingle.jsp");
        rd.forward(request, response);
    }
    public void tendInfo(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        InfoDao infodao = new InfoDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        List infoList = infodao.queryInfo(id);
        request.setAttribute("infoList", infoList);
        RequestDispatcher rd = request.getRequestDispatcher("infotend.jsp");
        rd.forward(request, response);
    }
}
