<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/12
  Time: 9:13
  网站总体布局最终形态的foot不固定在页脚位置的版本，比较丑放弃了
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zyf.User" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <title>个人信息</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <nav class="navbar navbar-default navbar-custom navbar-fixed-top" role="navigation">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span></button>
                        <a class="navbar-brand" href="homepage.jsp"><strong>心狗健康管理系统</strong></a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li>
                                <a href="homepage.jsp">首页</a>
                            </li>
                            <li>
                                <a href="InfoServlet?action=list">诊断历史</a>
                            </li>
                            <li>
                                <a href="InfoServlet?action=tend">趋势显示</a>
                            </li>
                            <li class="active">
                                <a href="perinfo.jsp">个人信息</a>
                            </li>
                            <li>
                                <a href="count.jsp">账户设置</a>
                            </li>
                            <li>
                                <a href="message.jsp">消息通知</a>
                            </li>
                            <li>
                                <a href="suggestion.jsp">意见反馈</a>
                            </li>
                            <li>
                                <a href="UserServlet?action=exit">退出登陆</a>
                            </li>
                        </ul>
                        <!--<form class="navbar-form navbar-left" role="search" placeholder="Search">
                            <div class="form-group">
                                <input type="text" class="form-control" />
                            </div> <button type="submit" class="btn btn-default">Submit</button>
                        </form> -->
                    </div>
                </div>
            </nav>
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp">首页</a></li>
                <li><a href="InfoServlet?action=list">诊断历史</a></li>
                <li><a href="InfoServlet?action=tend">趋势显示</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">医疗报告
                        <strong class="caret"></strong>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="fileupload.jsp">上传医疗报告</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="FileServlet?action=list">下载/删除报告</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="active"><a href="perinfo.jsp">个人信息</a></li>
                <li><a href="count.jsp">账户设置</a></li>
                <li><a href="ill.jsp">病理解释</a></li>
                <li><a href="help.jsp">使用指南</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="sub-header">心电图及历史诊断结论</h2>
            <div class="table-responsive">
                <table class="table table-striped">
                    <%
                        User user = (User) session.getAttribute("user");
                        if (user == null) {
                    %>
                    <tr height="100">
                        <td align="center" colspan="4">
                            <li>您还未登录</li>
                        </td>
                    </tr>
                    <%
                    } else {
                    %>
                    <tbody>
                    <tr>
                        <td><b>用户名</b></td>
                        <td><%=user.getUname()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>性别</b></td>
                        <td><%=user.getGender()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>邮箱</b></td>
                        <td><%=user.getEmail()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>手机号码</b></td>
                        <td><%=user.getPhone()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>年龄</b></td>
                        <td><%=user.getAge()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>居住地</b></td>
                        <td><%=user.getAddr()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>身高(cm)</b></td>
                        <td><%=user.getHeight()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>体重(kg)</b></td>
                        <td><%=user.getWeight()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>身份证号</b></td>
                        <td><%=user.getIden()%>
                        </td>
                    </tr>
                    </tbody>
                    <%
                        }%>
                </table>
            </div>
            <a class="btn btn-primary" href="perinfomodify.jsp" role="button">修改个人信息</a>
        </div>
    </div>
    <div class="row">
        <div id="footer">
            <nav class="navbar navbar-default">
                <div class="navbar-inner navbar-content-center">
                    <div class="text-center">
                        <p class="text-muted credit" style="padding:10px;">
                            &copy 上海夏先机电科技发展有限公司 版权所有 2014-2016 服务热线:400-775-2629
                        </p>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
