package com.zyf.servlet;

import com.zyf.Suggestion;
import com.zyf.User;
import com.zyf.dao.SuggestionDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * Created by HASS-PC on 2017/4/13.
 */
@WebServlet(
        name="SuggestionServlet",
        urlPatterns = {"/SuggestionServlet"})
public class SuggestionServlet extends HttpServlet{
    public SuggestionServlet() {
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        if (action.equals("save")) {
            this.saveSuggestion(request, response);
        }
    }
    public void saveSuggestion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        User user=(User)session.getAttribute("user");
        Suggestion sugg=new Suggestion();
        sugg.setUid(user.getUid());
        sugg.setUname(user.getUname());
        Date now=new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
        String date=format.format(now);
        System.out.println(date);
        sugg.setDate(date);
        String info=request.getParameter("info");
        sugg.setSuggsetion(info);
        SuggestionDao suggestiondao=new SuggestionDao();


        boolean rs=suggestiondao.saveSuggestion(sugg);
        if (rs) {
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
                    "            title: \"提交成功，感谢您的支持\",\n" +
                    "            text: '<a href=\"suggestion.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
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
                    "        window.location=\"suggestion.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();
        } else {
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
                    "            title: \"提交失败\",\n" +
                    "            text: '<a href=\"suggestion.jsp\" role=\"button\"><font size=\"5\" color=\"green\"> 点此返回</font></a>。<br>3秒后自动返回。',\n" +
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
                    "        window.location=\"suggestion.jsp\"\n" +
                    "        }\n" +
                    "</script>\n" +
                    "</body>\n" +
                    "</html>");
            out.flush();
            out.close();
        }
    }
}
