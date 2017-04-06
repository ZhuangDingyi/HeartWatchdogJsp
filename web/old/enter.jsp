<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2016/12/4
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html" pageEncoding="utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link rel="stylesheet" href="../css/xgxt_login.css"/>
    <title>用户登录-心狗健康信息管理系统</title>
    <script type="text/javascript">
        function refresh() {
            //IE存在缓存,需要new Date()实现更换路径的作用
            document.getElementById("image").src = "./enterimage.jsp?" + new Date();
        }
        function login(form) {
            if (form.uname.value == "") {
                alert("用户不能为空！");
                return false;
            }
            if (form.passwd.value == "") {
                alert("密码不能为空！");
                return false;
            }
        }
    </script>

</head>
<body>
<%
    String info = (String) request.getAttribute("info");
    if (info != null) {
%>
<script language="javascript" event="onload" for="window">
    var infos = "<%=info%>";
    alert(infos);
</script>
<%
    }
%>
<div id="header">
    <div class="header_title">
        <span class="title_con">心狗健康信息管理系统</span>
    </div>
</div>
<div id="Pagebody">
    <div>
        <img src="/images/xgxt_login_bg.jpg" class="pic1">
    </div>
    <div class="tab1">
        <form action="UserServlet?action=enter" method="post" onSubmit="return login(this);">
            <div class="con">
                <div class="con_title">
                    <span class="con_title_sp">欢迎登录心狗健康信息管理系统</span>
                </div>
                </br>
                <div class="con_panel">
                    <div class="con_input">
                        <span>用 户 名：</span><input name="uname" type="text" placeholder="用户名/手机号"/>
                    </div>
                    <div class="con_input">
                        <span>密&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input name="passwd" type="password" placeholder="密码"/>
                    </div>
                    <div class="con_input">
                        <span>验 证 码：</span><input name="code" type="text" placeholder="验证码(请注意区分大小写)"/>
                    </div>
                    <img id="image" border="0" onclick="refresh()" src="../enterimage.jsp" title="点击更换图片">
                    <div class="con_select">
                        <input type="radio" name="t1" value="用户" checked/>用户&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="t1" value="医生"/>医生
                        <a href="#" target="_blank">忘记密码？</a>
                        <!--<input type="radio" name="t1" value="管理员" />管理员 -->
                    </div>
                    <input type="submit" value="登    录" class="submit-btn"/>
                    <input type="button" value="注    册" onclick="javascript:window.location.href='../register.jsp';"
                           class="submit-btn"/>
                </div>
            </div>
        </form>
    </div>
</div>


<div class="foot">
    <p>链接:<a href="http://www.heart-watchdog.com/" target="_blank">心狗官网</a></p>
    <p>&copy 版权所有 2014-2016 服务热线:400-775-2629</p>
</div>

</body>
</html>
