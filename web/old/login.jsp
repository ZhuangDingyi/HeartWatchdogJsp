<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2016/12/4
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>心狗注册界面</title>
    <link type="text/css" rel="stylesheet" href="../css/login_fix.css">
    <!-- jsp:include page="common/common.jsp"/>
    <script type="text/javascript" src="js/common/register.js"></script>
    -->
    <script type="text/javascript">
        function reg(form) {
            if (form.username.value == "") {
                alert("用户不能为空！");
                return false;
            }
            if (form.passwd.value == "") {
                alert("密码不能为空！");
                return false;
            }
            if (form.passwd1.value == "") {
                alert("确认密码不能为空！");
                return false;
            }
            if (form.passwd.value != form.passwd1.value) {
                alert("两次密码输入不一致！");
                return false;
            }
            if (form.phone.value == "") {
                alert("联系电话不能为空！");
                return false;
            }
            if (form.email.value == "") {
                alert("电子邮箱不能为空！");
                return false;
            }
        }

    </script>
</head>

<body class="login_bj">
<%
    String info = (String) request.getAttribute("info");
    if (info != null) {
%>
<script language="javascript" event="onload" for="window">
    var infos = "<%= info %>";
    alert(infos);
</script>
<%
    }
%>
<div class="zhuce_body">
    <div class="logo"><a href="#"><img src="../images/logo.jpg" width=220px height=90px border="0"></a></div>
    <div class="zhuce_kong">
        <h3>欢迎注册</h3>
        <form action="UserServlet?action=reg" method="post" onsubmit="return reg(this);">
            <input name="username" type="text" class="kuang_txt phone" placeholder="用户名" maxlength="18"
                   minlength="3"><span>&nbsp;&nbsp;*</span>
            <input name="phone" type="text" class="kuang_txt phone" placeholder="手机号"><span>&nbsp;&nbsp;*</span>
            <input name="email" type="text" class="kuang_txt email" placeholder="邮箱" maxlength="50" minlength="7"><span>&nbsp;&nbsp;*</span>
            <input name="passwd" type="password" class="kuang_txt possword" placeholder="密码" maxlength="18"
                   minlength="6"><span>&nbsp;&nbsp;*</span>
            <input name="passwd1" type="password" class="kuang_txt possword"
                   placeholder="请确认密码"><span>&nbsp;&nbsp;*</span>
            <!--
            <input name="yanzhengma" type="text" class="kuang_txt possword" placeholder="手机验证码"><span>&nbsp;&nbsp;*</span>
            <input name="" type="text" class="kuang_txt yanzm" placeholder="图形验证码">
            <div>
                <div class="hui_kuang"><img src="images/zc_22.jpg" width="92" height="31"></div>
                <div class="shuaxin"><a href="#"><img src="images/zc_25.jpg" width="13" height="14"></a></div>
            </div>

            <div>
            <input type="button" id="btnSendCode" name="btnSendCode" value="免费获取验证码" onclick="sendMessage()" />
            </div>
            <div class="div1">
                <input name="xieyi" type="checkbox" value=""><span>已阅读并同意<a href="1.docx" target="_blank"><span class="lan">《XXXXX使用协议》</span></a></span>
            </div>
            -->
            <input class="btn_zhuce" type="submit" value="注  册">
        </form>
        <P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎您使用心狗产品</P>
    </div>
</div>
</body>
</html>
