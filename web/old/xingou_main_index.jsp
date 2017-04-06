<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2016/12/5
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>

<!-- 这是response.jsp文件 -->
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@ page import="javax.servlet.http.Cookie,java.util.Arrays" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<title></title>
<body>
<h2>使用Cookies的例子</h2>
<%
    String userName;
    userName = request.getRemoteAddr(); //获取客户端的IP
    Cookie cookie_response = null;
    Cookie[] cookie = request.getCookies();  //获取客户端上缓存所有的cookie
    out.println("<b>当前时间：</b>" + new java.util.Date() + "<br><br>");//打印当前的访问时间
    if (cookie == null) //客户端上还没有cookie
    {
        out.println("<font color=#FF0000>您是第一次访问此页，欢迎光顾！</font>");
        //创建一个名为“客户端IP_access_time”的cookie，并在其中保存当前时间。
        cookie_response = new Cookie(userName + "_access_time", new java.util.Date().toString());
        //更新Cookies的内容
        response.addCookie(cookie_response);
        response.setContentType("text/html");
        response.flushBuffer();
        return;
    }
    List list = Arrays.asList(cookie);
    Iterator it = list.iterator();
//检查已获取的所有cookies，如果存在名为“客户端IP_access_time”的cookies，则说明该用户以前已经访问过此页面，将该cookie保存在变量cookie_response中
    while (it.hasNext()) {
        Cookie temp = (Cookie) it.next();
        if (temp.getName().equals(userName + "_access_time")) {
            cookie_response = temp;
            break;
        }
    }
    if (cookie_response != null)  //如果cookie_response不为null，则表示以前已经访问过
    {
        out.println("<b>上次访问时间：</b>" + cookie_response.getValue()); //打印上次的访问时间
        cookie_response.setValue(new Date().toString());     //将该cookie中的时间设置为当前时间
    } else  //如果以前没有访问过此页面，则创建一个名为“客户端IP_access_time”的cookie，并在其中保存当前时间。
    {
        cookie_response = new Cookie(userName + "_access_time", new java.util.Date().toString());
    }
//设置当前的response，更新Cookies的内容
    response.addCookie(cookie_response);
    response.setContentType("text/html");
    response.flushBuffer();
%>
</body>
</html>
