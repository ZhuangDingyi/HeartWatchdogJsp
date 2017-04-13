<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/11
  Time: 20:55
  To change this template use File | Settings | File Templates.
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
    <title>个人健康信息档案</title>
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
                <li>
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
                <li>
                    <a href="message.jsp">消息中心</a>
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
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>首页</a></li>
                <li><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>诊断历史</a></li>
                <li><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i>趋势显示</a></li>
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
                <li class="active"><a href="perinfo.jsp"><i class="glyphicon glyphicon-user"></i>  个人信息</a></li>
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li><li><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2>个人信息</h2>
            <div class="table-responsive">
                <table class="table table-bordered table-responsive ">
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
                        if(user.getGender()==null){
                            user.setGender("");
                        }
                        if(user.getAge()==null){
                            user.setAge("");
                        }
                        if(user.getAddr()==null){
                            user.setAddr("");
                        }
                        if(user.getHeight()==null){
                            user.setHeight("");
                        }
                        if(user.getWeight()==null){
                            user.setWeight("");
                        }
                        if(user.getIden()==null){
                            user.setIden("");
                        }
                    %>
                    <tbody>
                    <tr>
                        <td><b>用户名</b></td>
                        <td><%=user.getUname()%>
                        </td>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <td><b>性别</b></td>
                        <td><%=user.getGender()%>
                        </td>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <td><b>年龄</b></td>
                        <td><%=user.getAge()%>
                        </td>

                    </tr>
                    <tr>
                        <td><b>手机号码</b></td>
                        <td><%=user.getPhone()%>
                        </td>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <td><b>邮箱</b></td>
                        <td><%=user.getEmail()%>
                        </td>
                    <%--</tr>--%>
                    <%--<tr>--%>
                        <td><b>居住地</b></td>
                        <td><%=user.getAddr()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>身高(cm)</b></td>
                        <td><%=user.getHeight()%>
                        </td>
                        <td><b>体重(kg)</b></td>
                        <td><%=user.getWeight()%>
                        </td>
                        <td><b>身份证号</b></td>
                        <td><%=user.getIden()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>民族</b></td>
                        <td><%=user.getNationality()%>
                        </td>
                        <td><b>工作单位</b></td>
                        <td><%=user.getCompany()%>
                        </td>
                        <td><b>文化程度</b></td>
                        <td><%=user.getEdu()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>职业</b></td>
                        <td><%=user.getJob()%>
                        </td>
                        <td><b>婚姻</b></td>
                        <td><%=user.getMarry()%>
                        </td>
                        <td><b>血型</b></td>
                        <td><%=user.getBloodtype()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>健康状态自我评估</b></td>
                        <td><%=user.getSelfevaluate()%>
                        </td>
                        <td><b>心理状况</b></td>
                        <td><%=user.getMentality()%>
                        </td>
                        <td><b>过敏药物史</b></td>
                        <td><%=user.getAllergy()%>
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle;text-align: center;"><b>既往病史</b></td>
                        <td><b>疾病1</b></td>
                        <td colspan="2"><%=user.getDesease1()%></td>
                        <td><b>确诊时间</b></td>
                        <td><%=user.getDtime1()%></td>
                    </tr>
                    <tr>
                        <td><b>疾病2</b></td>
                        <td colspan="2"><%=user.getDesease2()%></td>
                        <td><b>确诊时间</b></td>
                        <td><%=user.getDtime2()%></td>
                    </tr>
                    <tr>
                        <td><b>疾病3</b></td>
                        <td colspan="2"><%=user.getDesease3()%></td>
                        <td><b>确诊时间</b></td>
                        <td><%=user.getDtime3()%></td>
                    </tr>
                    <tr>
                        <td rowspan="3" style="vertical-align: middle;text-align: center;"><b>既往手术史</b></td>
                        <td><b>手术1</b></td>
                        <td colspan="2"><%=user.getOperation1()%></td>
                        <td><b>手术时间</b></td>
                        <td><%=user.getOtime1()%></td>
                    </tr>
                    <tr>
                        <td><b>手术2</b></td>
                        <td colspan="2"><%=user.getOperation2()%></td>
                        <td><b>手术时间</b></td>
                        <td><%=user.getOtime2()%></td>
                    </tr>
                    <tr>
                        <td><b>手术3</b></td>
                        <td colspan="2"><%=user.getOperation3()%></td>
                        <td><b>手术时间</b></td>
                        <td><%=user.getOtime3()%></td>
                    </tr>
                    <tr>
                        <td rowspan="4" style="vertical-align: middle;text-align: center;"><b>家族病史</b></td>
                        <td><b>父亲</b></td>
                        <td colspan="4"><%=user.getF1desease()%></td>
                    </tr>
                    <tr>
                        <td><b>母亲</b></td>
                        <td colspan="4"><%=user.getF2desease()%></td>
                    </tr>
                    <tr>
                        <td><b>兄弟姐妹</b></td>
                        <td colspan="4"><%=user.getF3desease()%></td>
                    </tr>
                    <tr>
                        <td><b>子女</b></td>
                        <td colspan="4"><%=user.getF4desease()%></td>
                    </tr>
                    <tr>
                        <td><b>遗传病史</b></td>
                        <td colspan="5"><%=user.getInheridesease()%></td>
                    </tr>
                    <tr>
                        <td><b>锻炼频率</b></td>
                        <td><%=user.getExefre()%>
                        </td>
                        <td><b>锻炼方式</b></td>
                        <td><%=user.getExeway()%>
                        </td>
                        <td><b>锻炼时间</b></td>
                        <td><%=user.getExetime()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>饮食习惯</b></td>
                        <td><%=user.getEathabit()%>
                        </td>
                        <td><b>吸烟情况</b></td>
                        <td><%=user.getSmokestatus()%>
                        </td>
                        <td><b>吸烟量</b></td>
                        <td><%=user.getSmokeamount()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>是否饮酒</b></td>
                        <td><%=user.getIsdrink()%>
                        </td>
                        <td><b>每次饮酒量</b></td>
                        <td><%=user.getDrinkamount()%>
                        </td>
                        <td><b>饮酒频率</b></td>
                        <td><%=user.getDrinkfre()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>睡眠情况</b></td>
                        <td colspan="2"><%=user.getSleepstatus()%>
                        </td>
                        <td><b>睡眠时间（小时</b></td>
                        <td colspan="2"><%=user.getSleeptime()%>
                        </td>
                    </tr>
                    <tr>
                        <td><b>职业病危害因素接触史</b></td>
                        <td colspan="2"> <%=user.getJobmaterial()%>
                        </td>
                        <td ><b>有无防护措施</b></td>
                        <td colspan="2"><%=user.getIsjobprotect()%> </td>
                    </tr>
                    </tbody>
                    <%
                        }%>
                </table>
            </div>
            <a class="btn btn-primary" href="perinfomodify.jsp" role="button">修改个人信息</a>
            <br><br><br><br>
        </div>
    </div>
</div>
<div id="footer" class="container">
    <div class="col-sm-offset-3 col-md-offset-2">
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
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
