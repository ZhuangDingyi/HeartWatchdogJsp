package com.zyf.servlet;

/*
 * Created by Administrator on 2017/3/27.
 */

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.zyf.Info;
import com.zyf.User;
import com.zyf.dao.InfoDao;
import com.zyf.dao.RelaDao;
import com.zyf.dao.UserDao;
import com.zyf.tools.MyTools;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(
        name="RelaServlet",
        urlPatterns = {"/RelaServlet"})
public class RelaServlet extends HttpServlet{
    public RelaServlet(){}
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("RelaList")) {
            this.queryRela(request, response);
        }
        if (action.equals("RelaDelete")) {
            this.relaDelete(request, response);
        }
        if (action.equals("RelaAgree")){
            this.relaAgree(request,response);
        }
        if (action.equals("RelaReject")){
            this.relaReject(request,response);
        }
        if (action.equals("RelaCancel")){
            this.relaCancel(request,response);
        }
        if (action.equals("RelaAdd")){
            this.relaAdd(request,response);
        }
        if (action.equals("RelaTend")){
            this.relaTend(request,response);
        }
        if (action.equals("RelaSelectInfo")){
            this.selectInfo(request,response);
        }
        if (action.equals("RelaInfoSingle")){
            this.relaInfoSingle (request,response);
        }
    }
    public void relaAdd(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String relaname=request.getParameter("relaname");
        String information=request.getParameter("info");
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid=user.getUid();
        String uname=user.getUname();
        UserDao userDao = new UserDao();
        RelaDao reladao=new RelaDao();
        if (userDao.userIsExist(relaname)) {
            int reid=userDao.userQueryId(relaname);
            if (reladao.relaIsExist(relaname,uid)){
                response.setCharacterEncoding("utf-8");
                PrintWriter out = response.getWriter();
                out.print("<!DOCTYPE html>\n" +
                        "<html>\n" +
                        "<head>\n" +
                        "    <meta charset=\"UTF-8\">\n" +
                        "    <link href=\"css/sweet-alert.css\" rel=\"stylesheet\">\n" +
                        "</head>\n" +
                        "<body>\n" +
                        "<script src=\"js/jquery-3.1.1.js\"></script>\n" +
                        "<script src=\"js/sweet-alert.min.js\"></script>\n" +
                        "<script type=\"text/javascript\">\n" +
                        "    $(document).ready(function(){\n" +
                        "        swal({\n" +
                        "            type:\"info\",\n" +
                        "            title: \"您已经提交了好友申请，请等待对方通过\",\n" +
                        "            text: '<a href=\"RelaServlet?action=RelaList#demoTab4\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>5秒后自动返回。',\n" +
                        "            animation:\"slide-from-top\",\n" +
                        "            html: true,\n" +
                        "            timer: 5000,\n" +
                        "            showConfirmButton: false\n" +
                        "        });\n" +
                        "    })\n" +
                        "    window.onload = function(){\n" +
                        "        setTimeout(fun,5000);\n" +
                        "    }\n" +
                        "    function fun(){\n" +
                        "        window.location=\"RelaServlet?action=RelaList#demoTab4\"\n" +
                        "        }\n" +
                        "</script>\n" +
                        "</body>\n" +
                        "</html>\n");
                out.flush();
                out.close();
            }else{
                if (reladao.relaIsExist1(relaname,uid)){
                    response.setCharacterEncoding("utf-8");
                    PrintWriter out = response.getWriter();
                    out.print("<!DOCTYPE html>\n" +
                            "<html>\n" +
                            "<head>\n" +
                            "    <meta charset=\"UTF-8\">\n" +
                            "    <link href=\"css/sweet-alert.css\" rel=\"stylesheet\">\n" +
                            "</head>\n" +
                            "<body>\n" +
                            "<script src=\"js/jquery-3.1.1.js\"></script>\n" +
                            "<script src=\"js/sweet-alert.min.js\"></script>\n" +
                            "<script type=\"text/javascript\">\n" +
                            "    $(document).ready(function(){\n" +
                            "        swal({\n" +
                            "            type:\"info\",\n" +
                            "            title: \"对方已经向您提交了好友申请，请到验证消息中通过即可\",\n" +
                            "            text: '<a href=\"RelaServlet?action=RelaList#demoTab4\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>5秒后自动返回。',\n" +
                            "            animation:\"slide-from-top\",\n" +
                            "            html: true,\n" +
                            "            timer: 5000,\n" +
                            "            showConfirmButton: false\n" +
                            "        });\n" +
                            "    })\n" +
                            "    window.onload = function(){\n" +
                            "        setTimeout(fun,5000);\n" +
                            "    }\n" +
                            "    function fun(){\n" +
                            "        window.location=\"RelaServlet?action=RelaList#demoTab4\"\n" +
                            "        }\n" +
                            "</script>\n" +
                            "</body>\n" +
                            "</html>");
                    out.flush();
                    out.close();
                    }else{
                    boolean rs=reladao.sendRequest(uid,uname,reid,relaname,information);
                    if (rs) {
                        response.setCharacterEncoding("utf-8");
                        PrintWriter out = response.getWriter();
                        out.print("<!DOCTYPE html>\n" +
                                "<html>\n" +
                                "<head>\n" +
                                "    <meta charset=\"UTF-8\">\n" +
                                "    <link href=\"css/sweet-alert.css\" rel=\"stylesheet\">\n" +
                                "</head>\n" +
                                "<body>\n" +
                                "<script src=\"js/jquery-3.1.1.js\"></script>\n" +
                                "<script src=\"js/sweet-alert.min.js\"></script>\n" +
                                "<script type=\"text/javascript\">\n" +
                                "    $(document).ready(function(){\n" +
                                "        swal({\n" +
                                "            type:\"success\",\n" +
                                "            title: \"您已提交请求，请等待对方通过\",\n" +
                                "            text: '<a href=\"RelaServlet?action=RelaList#demoTab4\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>5秒后自动返回。',\n" +
                                "            animation:\"slide-from-top\",\n" +
                                "            html: true,\n" +
                                "            timer: 5000,\n" +
                                "            showConfirmButton: false\n" +
                                "        });\n" +
                                "    })\n" +
                                "    window.onload = function(){\n" +
                                "        setTimeout(fun,5000);\n" +
                                "    }\n" +
                                "    function fun(){\n" +
                                "        window.location=\"RelaServlet?action=RelaList#demoTab4\"\n" +
                                "        }\n" +
                                "</script>\n" +
                                "</body>\n" +
                                "</html>");
                        out.flush();
                        out.close();
                    } else {
                        response.setCharacterEncoding("utf-8");
                        PrintWriter out = response.getWriter();
                        out.print("<!DOCTYPE html>\n" +
                                "<html>\n" +
                                "<head>\n" +
                                "    <meta charset=\"UTF-8\">\n" +
                                "    <link href=\"css/sweet-alert.css\" rel=\"stylesheet\">\n" +
                                "</head>\n" +
                                "<body>\n" +
                                "<script src=\"js/jquery-3.1.1.js\"></script>\n" +
                                "<script src=\"js/sweet-alert.min.js\"></script>\n" +
                                "<script type=\"text/javascript\">\n" +
                                "    $(document).ready(function(){\n" +
                                "        swal({\n" +
                                "            type:\"error\",\n" +
                                "            title: \"发送请求失败，请返回检查\",\n" +
                                "            text: '<a href=\"RelaServlet?action=RelaList#demoTab4\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>5秒后自动返回。',\n" +
                                "            animation:\"slide-from-top\",\n" +
                                "            html: true,\n" +
                                "            timer: 5000,\n" +
                                "            showConfirmButton: false\n" +
                                "        });\n" +
                                "    })\n" +
                                "    window.onload = function(){\n" +
                                "        setTimeout(fun,5000);\n" +
                                "    }\n" +
                                "    function fun(){\n" +
                                "        window.location=\"RelaServlet?action=RelaList#demoTab4\"\n" +
                                "        }\n" +
                                "</script>\n" +
                                "</body>\n" +
                                "</html>");
                        out.flush();
                        out.close();
                    }
                }
            }
        }else{
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.print("<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "<head>\n" +
                    "    <meta charset=\"UTF-8\">\n" +
                    "    <link href=\"css/sweet-alert.css\" rel=\"stylesheet\">\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "<script src=\"js/jquery-3.1.1.js\"></script>\n" +
                    "<script src=\"js/sweet-alert.min.js\"></script>\n" +
                    "<script type=\"text/javascript\">\n" +
                    "    $(document).ready(function(){\n" +
                    "        swal({\n" +
                    "            type:\"error\",\n" +
                    "            title: \"该用户不存在！\",\n" +
                    "            text: '<a href=\"RelaServlet?action=RelaList#demoTab4\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>5秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 5000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,5000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"RelaServlet?action=RelaList#demoTab4\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html");
            out.flush();
            out.close();
        }
    }
    //        if (action.equals('RelaInfo')){
//            this.queryRelaInfo(request,response);
//        }
    public void queryRela(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RelaDao reladao = new RelaDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List relaList = reladao.queryRela(uid);
        request.setAttribute("relaList", relaList);
        List relaCheckList=reladao.checkRela(uid);
        request.setAttribute("relaCheckList", relaCheckList);
        List relaRequestList=reladao.requestRela(uid);
        request.setAttribute("relaRequestList", relaRequestList);
        RequestDispatcher rd = request.getRequestDispatcher("relamanage.jsp");
        rd.forward(request, response);
    }
    private void relaAgree(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String messages = "";
        String forward = "";
        String href = "";
        RelaDao reladao=new RelaDao();
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        int reid=user.getUid();
        int id= MyTools.strToint(request.getParameter("id"));
        boolean rs=reladao.relaAgree(id,reid);
        if (rs) {
            messages = "添加好友成功";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        } else {
            messages = "添加好友失败，请检查该用户是否已经是您的好友";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
    private void relaReject(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String messages = "";
        String forward = "";
        String href = "";
        RelaDao reladao=new RelaDao();
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        int reid=user.getUid();
        int id= MyTools.strToint(request.getParameter("id"));
        boolean rs=reladao.relaReject(id,reid);
        if (rs) {
            messages = "您已拒绝该请求";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        } else {
//            messages = "删除好友失败，请稍后重试或检查该用户是否已经删除";
            messages = "操作失败，请返回检查";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
    private void relaDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String messages = "";
        String forward = "";
        String href = "";
        RelaDao reladao=new RelaDao();
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        int uid=user.getUid();
        int id= MyTools.strToint(request.getParameter("id"));
        boolean rs=reladao.relaDelete(id,uid);
        if (rs) {
            messages = "您已成功删除该好友";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        } else {
//            messages = "删除好友失败，请稍后重试或检查该用户是否已经删除";
            messages = "删除失败，请返回检查";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
    private void relaCancel(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        String messages = "";
        String forward = "";
        String href = "";
        RelaDao reladao=new RelaDao();
        HttpSession session=request.getSession();
        User user=(User) session.getAttribute("user");
        int uid=user.getUid();
        int id= MyTools.strToint(request.getParameter("id"));
        boolean rs=reladao.relaCancel(id,uid);
        if (rs) {
            messages = "您已撤回该申请";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        } else {
//            messages = "删除好友失败，请稍后重试或检查该用户是否已经删除";
            messages = "撤回申请失败，请返回检查";
            forward = "tishi.jsp";
            href = "RelaServlet?action=RelaList";
        }
        request.setAttribute("message", messages);
        request.setAttribute("href", href);
        RequestDispatcher requestDispatcher1 = request.getRequestDispatcher(forward);
        requestDispatcher1.forward(request, response);
    }
    private void relaTend(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
        InfoDao infodao = new InfoDao();
        int reid = MyTools.strToint(request.getParameter("para"));
        String relaname= request.getParameter("para1");
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        List infoRelaList = infodao.queryRelaInfo(uid,reid);
        request.setAttribute("infoRelaList", infoRelaList);
        request.setAttribute("relaname", relaname);
        String relaid="";
        relaid=String.valueOf(reid);
        request.setAttribute("reid", relaid);//一个小细节，如果直接将int型传过去会报错
        RequestDispatcher rd = request.getRequestDispatcher("relainfo.jsp");
        rd.forward(request, response);
    }
    public void selectInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InfoDao infodao = new InfoDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid = user.getUid();
        int reid = MyTools.strToint(request.getParameter("para"));
        List relainfolist = infodao.queryRelaInfo(uid,reid);
//        request.setAttribute("relainfolist", relainfolist);
        JsonArray array = new JsonArray();

        for (int i = 0; i < relainfolist.size(); i++) {
            Info single = (Info) relainfolist.get(i);
            JsonObject ob = new JsonObject();
            ob.addProperty("id", i+1);
            ob.addProperty("date", single.getDate());
            ob.addProperty("read", "<a href=\"RelaServlet?action=RelaInfoSingle&para="+single.getId()+"&para1="+reid+" \"target=\"_blank\">查看记录</a>");
            array.add(ob);
        }
        PrintWriter out=response.getWriter();
        out.print(array);
        System.out.println(array);
    }
    public void relaInfoSingle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InfoDao infodao = new InfoDao();
        int id = MyTools.strToint(request.getParameter("para"));
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int uid=user.getUid();
        int reid = MyTools.strToint(request.getParameter("para1"));
        Info infosingle = infodao.queryRelaInfoSingle(id,uid,reid);
        request.setAttribute("infosingle", infosingle);
        String relaid=String.valueOf(reid);
        request.setAttribute("reid", relaid);
        RequestDispatcher rd = request.getRequestDispatcher("relainfosingle.jsp");
        rd.forward(request, response);
    }
}