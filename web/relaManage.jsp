<%@ page import="java.util.ArrayList" %>
<%@ page import="com.zyf.RelaBean" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/27
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>亲友管理</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
</head>
<body>


<div class="container-fluid">
    <div class="row">
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
    </div>
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-th-large"></i>  首页</a></li>
                <li><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>  诊断历史</a></li>
                <li><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i>  趋势显示</a></li>
                <!-- 此处将侧边栏扁平化 并且浮动式-->
                <li>
                    <a href="#medicalreport" class="nav-header collapsed" data-toggle="collapse">
                        <i class="glyphicon glyphicon-sort"></i>
                        医疗报告
                        <span class="glyphicon glyphicon-list"></span>
                    </a>
                    <ul id="medicalreport" class="nav nav-list collapse secondmenu" style="height: 0px;">
                        <li>
                            <a href="fileupload.jsp">    <i class="glyphicon glyphicon-arrow-up"></i>  上传医疗报告</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="FileServlet?action=list">    <i class="glyphicon glyphicon-arrow-down"></i>   下载/删除报告</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <ul class="nav nav-sidebar">
                <li><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>  个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li>
                <li class="active"><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h3 >好友列表</h3>
                <table class="table">
                    <%
                        ArrayList relaList = (ArrayList) request.getAttribute("relaList");
                        if (relaList == null || relaList.size() == 0) {
                    %>
                <tr height="30">
                    <td align="center" colspan="4">
                        <li>您还未添加任何好友</li>
                    </td>
                </tr>
                <%
                } else {
                %>
                <thead>
                <tr>
                    <th><b>序号</b></th>
                    <th><b>好友账号</b></th>
                    <th align="center" colspan="2"><b>操作</b></th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < relaList.size(); i++) {
                        RelaBean rela = (RelaBean) relaList.get(i);
                %>
                <tr>
                    <td><%=i + 1%>
                    </td>
                    <td><%=rela.getRelaname()%>
                    </td>
                    <td>查看好友健康信息</td>
                    <td>删除好友</td>
                    <%--<td><a href="FileServlet?action=download&id=<%=single.getId()%>" target="_blank">下载文件</a></td>--%>
                    <%--<td><a href="FileServlet?action=delete&id=<%=single.getId()%>">删除</a></td>--%>
                </tr>
                </tbody>
                <%
                        }
                    }
                %>
                </table>
            <h3>验证消息</h3>
            <table class="table">
                <%
                    ArrayList relaCheckList = (ArrayList) request.getAttribute("relaCheckList");
                    if (relaCheckList == null || relaCheckList.size() == 0) {
                %>
                <tr height="30">
                    <td align="center" colspan="4">
                        <li>您暂时未收到好友申请</li>
                    </td>
                </tr>
                <%
                } else {
                %>
                <thead>
                <tr>
                    <th><b>序号</b></th>
                    <th><b>好友申请人账号</b></th>
                    <th align="center" colspan="2"><b>操作</b></th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (int i = 0; i < relaCheckList.size(); i++) {
                        RelaBean rela = (RelaBean) relaCheckList.get(i);
                %>
                <tr>
                    <td><%=i + 1%>
                    </td>
                    <td><%=rela.getUname()%>
                    </td>
                    <td>加他/她为好友</td>
                    <td>拒绝好友申请</td>
                    <%--<td><a href="FileServlet?action=download&id=<%=single.getId()%>" target="_blank">下载文件</a></td>--%>
                    <%--<td><a href="FileServlet?action=delete&id=<%=single.getId()%>">删除</a></td>--%>
                </tr>
                </tbody>
                <%
                        }
                    }
                %>
            </table>
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
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
</body>
</html>