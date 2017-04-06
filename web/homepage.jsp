<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zyf.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>心狗健康管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>


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
                <li class="active">
                    <a href="homepage.jsp">首页</a>
                </li>
                <li>
                    <a href="infotime.jsp">诊断历史</a>
                </li>
                <li>
                    <a href="InfoServlet?action=tend">趋势显示</a>
                </li>
                <li>
                    <a href="perinfo.jsp">个人信息</a>
                </li>
                <li>
                    <a href="count.jsp">账户设置</a>
                </li>
                <li>
                    <a href="message.jsp">消息中心</a>
                </li>
                <li>
                    <a href="suggestion.jsp">意见反馈</a>
                </li>
                <li>
                    <a href="UserServlet?action=exit">退出登录</a>
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

<div class="container">
    <div class="row clearfix">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li class="active"><a href="homepage.jsp"><i class="glyphicon glyphicon-th-large"></i>  首页</a></li>
                <li><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>  诊断历史</a></li>
                <li><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i>  趋势显示</a></li>
                <li class="dropdown">
                    <a href="#medicalreport" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-sort"></i>
                        医疗报告
                        <span class="glyphicon glyphicon-list"></span>
                    </a>
                    <ul id="medicalreport" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li>
                            <a href="fileupload.jsp"><i class="glyphicon glyphicon-arrow-up"></i>上传医疗报告</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="FileServlet?action=list"> <i class="glyphicon glyphicon-arrow-down"></i> 下载/删除报告</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>  个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li><li><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


            <%
                // 获取登录的用户信息
                User user = (User) session.getAttribute("user");
                String lastlogin=(String)session.getAttribute("lastlogin");
                // 判断用户是否登录
                if (user != null) {
            %>
            <h2>
                尊敬的用户<%=user.getUname() %>您好，欢迎来到心狗健康管理系统！
            </h2>
            <p style="font-size:30px">
                您上一次登录时间是<%=lastlogin%>
            </p>
            <%
                } else {
                    out.println("<br>对不起，您还没有登录！");
                }
            %>

        </div>
    </div>
</div>

<div id="footer" class="container">
    <nav class="navbar navbar-default navbar-fixed-bottom">
        <div class="navbar-inner navbar-content-center">
            <div class="text-center">
                <p class="text-muted credit" style="padding:10px;">
                    &copy 上海夏先机电科技发展有限公司 版权所有 2014-2016 服务热线:400-775-2629
                </p>
            </div>
        </div>
    </nav>
</div>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>