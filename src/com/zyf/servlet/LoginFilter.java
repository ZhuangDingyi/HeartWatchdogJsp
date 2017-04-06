package com.zyf.servlet;
import com.zyf.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        HttpSession session = servletRequest.getSession();

        // 获得用户请求的URI
        String path = servletRequest.getRequestURI();
        //System.out.println(path);
        List<String> NoFilter_Pages=new ArrayList<String>();
        NoFilter_Pages.add("register.jsp");
        NoFilter_Pages.add("enterimage.jsp");
        // 从session里取员工工号信息
        User user=(User)session.getAttribute("user");
        /*创建类Constants.java，里面写的是无需过滤的页面*/
        for (int i = 0; i < NoFilter_Pages.size(); i++) {

            if (path.contains(NoFilter_Pages.get(i))) {
                chain.doFilter(servletRequest, servletResponse);
                return;
            }
        }

        // 登陆页面无需过滤
        if(path.indexOf("/login.jsp") > -1) {
            chain.doFilter(request,response);
            return;
        }

        // 判断如果没有取到员工信息,就跳转到登陆页面
        if (user == null) {
            // 跳转到登陆页面
            servletResponse.sendRedirect("/login.jsp");
//            servletRequest.getRequestDispatcher("login.jsp").forward(servletRequest, servletResponse);
        } else {
            // 已经登陆,继续此次请求
            //System.out.println("用户已经登录");
            chain.doFilter(request,response);
        }

    }

    @Override
    public void destroy() {}
}
