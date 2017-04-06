<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<%@ page import="com.zyf.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>提示信息</title>
    <link rel="stylesheet" type="text/css">
</head>

<body>
<div align="center">
    <div class="div1">
        <div class="top">提示信息</div>
        <div class="bottom">
            <div class="div3">
                <%
                    // 获取提示信息
                    String info = (String) request.getAttribute("info");
                    // 如果提示信息不为空，则输出提示信息
                    if (info != null) {
                        out.println(info);
                    }
                    // 获取登录的用户信息
                    User user = (User) session.getAttribute("user");
                    // 判断用户是否登录
                    if (user != null) {
                %>
                <table align="center" width="350" border="1" height="200" bordercolor="#E8F4CC">
                    <tr>
                        <td align="center" colspan="2">
                            <span style="font-weight: bold;font-size: 18px;"><%=user.getUname() %></span>
                            登录成功！
                        </td>
                    </tr>

                    <tr>
                        <td align="right">联系电话：</td>
                        <td><%=user.getPhone()%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">电子邮箱：</td>
                        <td><%=user.getEmail()%>
                        </td>
                    </tr>
                </table>
                <%
                    } else {
                        out.println("<br>对不起，您还没有登录！");
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>