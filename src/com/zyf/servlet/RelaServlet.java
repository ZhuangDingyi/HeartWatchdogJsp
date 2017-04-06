package com.zyf.servlet;

/*
 * Created by Administrator on 2017/3/27.
 */

import com.zyf.User;
import com.zyf.dao.RelaDao;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
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
        if (action.equals("RelaCheck")){
            this.relaCheck(request,response);
        }

    }
    //        if (action.equals('RelaInfo')){
//            this.queryRelaInfo(request,response);
//        }
    private void relaCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
    }
    public void queryRela(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        RelaDao reladao = new RelaDao();
        HttpSession session = request.getSession();
        // 获取用户对象
        User user = (User) session.getAttribute("user");
        int id = user.getUid();
        List relaList = reladao.queryRela(id);
        request.setAttribute("relaList", relaList);
        List relaCheckList=reladao.CheckRela(id);
        request.setAttribute("relaCheckList", relaCheckList);
        RequestDispatcher rd = request.getRequestDispatcher("relaManage.jsp");
        rd.forward(request, response);
    }
}

