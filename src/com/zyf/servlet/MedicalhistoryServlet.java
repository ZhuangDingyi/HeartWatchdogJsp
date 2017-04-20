package com.zyf.servlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.zyf.Medicalhistory;
import com.zyf.User;
import com.zyf.dao.MedicalhistoryDao;
import com.zyf.tools.MyTools;
import org.apache.log4j.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.io.PrintWriter;
/*
 * Created by HASS-PC on 2017/4/18.
 */
@WebServlet(
        urlPatterns = {"/MedicalhistoryServlet"},
        name="MedicalhistoryServlet"
)
public class MedicalhistoryServlet extends HttpServlet{
    public MedicalhistoryServlet(){}
    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        this.doPost(request,response);
    }
    public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        String action=request.getParameter("action");
        if (action.equals("list")){
            this.hisList(request,response);
        }
        if (action.equals("add")){
            this.hisAdd(request,response);
        }
        if (action.equals("del")){
            this.hisDel(request,response);
        }
        if (action.equals("single")){
            this.hisSingle(request,response);
        }
        if (action.equals("modify")){
            this.hisModify(request,response);
        }
    }
    public void hisModify(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        MedicalhistoryDao dao=new MedicalhistoryDao();
        HttpSession session=request.getSession();
        int id= MyTools.strToint(request.getParameter("id"));
        User user=(User)session.getAttribute("user");
        int uid=user.getUid();
        Medicalhistory his=new Medicalhistory();
        String city=request.getParameter("city");
        String date=request.getParameter("date");
        String hospital=request.getParameter("hospital");
        String office=request.getParameter("office");
        String doctor=request.getParameter("doctor");
        String conclusion=request.getParameter("conclusion");
        his.setId(id);
        his.setUid(uid);
        his.setCity(city);
        his.setDate(date);
        his.setHospital(hospital);
        his.setOffice(office);
        his.setDoctor(doctor);
        his.setConclusion(conclusion);
        boolean rs=dao.hisModify(his);
        if(rs){
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"修改成功\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();

        }else{
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"修改失败\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();
        }
    }
    public void hisSingle(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        MedicalhistoryDao dao=new MedicalhistoryDao();
        HttpSession session=request.getSession();
        int id= MyTools.strToint(request.getParameter("id"));
        User user=(User)session.getAttribute("user");
        int uid=user.getUid();
        Medicalhistory his=dao.hisSingle(id,uid);
        request.setAttribute("his", his);
        System.out.print(his.getDate());
        RequestDispatcher rd = request.getRequestDispatcher("medicalhistorymodify.jsp");
        rd.forward(request, response);
    }
    public void hisDel(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        MedicalhistoryDao dao=new MedicalhistoryDao();
        int id=MyTools.strToint(request.getParameter("id"));
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        int uid=user.getUid();
        boolean rs=dao.hisDel(id,uid);
        if(rs){
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"删除成功\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();

        }else{
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"删除失败\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();
        }
    }
    public void hisList(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
        MedicalhistoryDao dao=new MedicalhistoryDao();
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        int uid=user.getUid();
        List hisList=dao.queryList(uid);
        JsonArray array=new JsonArray();
        for (int i=0;i< hisList.size();i++){
            Medicalhistory mhis=(Medicalhistory) hisList.get(i);
            JsonObject ob=new JsonObject();
            ob.addProperty("id",i+1);
            ob.addProperty("city",mhis.getCity());
            ob.addProperty("date",mhis.getDate());
            ob.addProperty("hospital",mhis.getHospital());
            ob.addProperty("office",mhis.getOffice());
            ob.addProperty("doctor",mhis.getDoctor());
            ob.addProperty("conclusion",mhis.getConclusion());
            ob.addProperty("edit","<a href=\"MedicalhistoryServlet?action=single&id="+mhis.getId()+"\" target=\"_blank\">编辑</a>");
            ob.addProperty("del","<a href=\"MedicalhistoryServlet?action=del&id="+mhis.getId()+"\">删除</a>");
            array.add(ob);
        }
        PrintWriter out=response.getWriter();
        out.print(array);
        System.out.print(array);

    }
    public void hisAdd(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
        MedicalhistoryDao dao=new MedicalhistoryDao();
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        int uid =user.getUid();
        String city=request.getParameter("city");
        String date=request.getParameter("date");
        String hospital=request.getParameter("hospital");
        String office=request.getParameter("office");
        String doctor=request.getParameter("doctor");
        String conclusion=request.getParameter("conclusion");
        Medicalhistory his=new Medicalhistory();
        his.setUid(uid);
        his.setCity(city);
        his.setDate(date);
        his.setHospital(hospital);
        his.setOffice(office);
        his.setDoctor(doctor);
        his.setConclusion(conclusion);
        boolean rs=dao.hisAdd(his);
        if(rs){
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"添加成功\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();

        }else{
            response.setCharacterEncoding("UTF-8");
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
                    "            title: \"添加失败\",\n" +
                    "            text: '<a href=\"medicalhistory.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
                    "            animation:\"slide-from-top\",\n" +
                    "            html: true,\n" +
                    "            timer: 3000,\n" +
                    "            showConfirmButton: false\n" +
                    "        });\n" +
                    "    })\n" +
                    "    window.onload = function(){\n" +
                    "        setTimeout(fun,3000);\n" +
                    "    }\n" +
                    "    function fun(){\n" +
                    "        window.location=\"medicalhistory.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();
        }
    }
}
