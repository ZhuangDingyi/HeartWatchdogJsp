﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.JsonArray" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>个人电子病历</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <!-- Latest compiled and minified CSS -->
    <link href="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.css" rel="stylesheet">
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
                <li>
                    <a href="homepage.jsp">首页</a>
                </li>
                <li >
                    <a href="infotime.jsp">诊断历史</a>
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
                <!--<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown
                        <strong class="caret"></strong>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">Action</a>
                        </li>
                        <li>
                            <a href="#">Another action</a>
                        </li>
                        <li>
                            <a href="#">Something else here</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">Separated link</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">One more separated link</a>
                        </li>
                    </ul>
                </li>
                -->
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
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>  首页</a></li>
                <li><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>  诊断历史</a></li>
                <li><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i> 趋势显示</a></li>
                <li class="dropdown">
                    <a href="#medicalreport" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-sort"></i>
                        医疗报告
                        <span class="glyphicon glyphicon-list"></span>
                    </a>
                    <ul id="medicalreport" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li>
                            <a href="fileupload.jsp"><i class="glyphicon glyphicon-upload"></i> 上传医疗报告</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="FileServlet?action=list"> <i class="glyphicon glyphicon-download"></i> 下载/删除报告</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li class="active">
                    <a href="#perinfo" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-user"></i>
                        个人信息
                    </a>
                    <ul id="perinfo" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li>
                            <a href="perinfo.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-list-alt"></i>  健康档案</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="medicalhistory.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-file"></i>  电子病历</a>
                        </li>
                    </ul>
                </li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li><li><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="sub-header">心电图及历史诊断结论</h2>
            <%--<div class="table-responsive">--%>

            <table  id="teacher_table" data-toggle="table" data-url="MedicalhistoryServlet?action=list"
                        data-method="post"
                        data-query-params="queryParams"
                        data-toolbar="#toolbar"
                        data-pagination="true"
                        data-search="true"
                        data-show-refresh="true"
                        data-show-toggle="true"
                        data-show-columns="true"
                        data-page-size="10"
                <%--data-pageList:="[10, 25, 50, 100]"--%>
                        data-striped="true">
                    <thead>
                    <tr>
                        <th data-field="id">病历id</th>
                        <th data-field="city">就诊城市</th>
                        <th data-field="date" align="center">就诊时间</th>
                        <th data-field="hospital" align="center">就诊医院</th>
                        <th data-field="office" align="center">就诊科室</th>
                        <th data-field="doctor" align="center">医生</th>
                        <th data-field="conclusion" align="center">结论</th>
                        <th data-field="edit" align="center">修改</th>
                        <th data-field="del" align="center">操作</th>
                    </tr>
                    </thead>
                </table>
                <%--<p id="test">12345</p>--%>
            <a class="btn btn-primary" href="medicalhistoryadd.jsp" role="button">添加病历</a>
            <br>
            <br>
            <br>
        </div>
    </div>
    <div class="row">
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
    </div>
</div>


<script src="js/jquery-3.1.1.js"></script>

<script src="js/bootstrap.min.js"></script>

<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>

</body>
</html>