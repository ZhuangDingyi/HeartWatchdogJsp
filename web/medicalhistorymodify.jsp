<%@ page import="com.zyf.Medicalhistory" %><%--
  Created by IntelliJ IDEA.
  User: HASS-PC
  Date: 2017/4/20
  Time: 21:29
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    <link href="css/jquery-editable-select.min.css" rel="stylesheet">

    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">

    <%--<link rel="stylesheet" href="css/sweet-alert.css">--%>
    <title>修改个人病历</title>
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
                <li>
                    <a href="perinfo.jsp">个人信息</a>
                </li>
                <li class="active">
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
<%
    Medicalhistory his=(Medicalhistory) request.getAttribute("his");
%>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>  首页</a></li>
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
                            <a href="fileupload.jsp"><i class="glyphicon glyphicon-upload"></i>上传医疗报告</a>
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
                <li>                    <a href="#perinfo" class="nav-header collapsed" data-toggle="collapse">                        <i class="glyphicon glyphicon-user"></i>                        个人信息                    </a>                    <ul id="perinfo" class="nav nav-list collapse secondmenu" style="height: 0px;">                        <li>                            <a href="perinfo.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-list-alt"></i>  健康档案</a>                        </li>                        <li class="divider">                        </li>                        <li>                            <a href="medicalhistory.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-file"></i>  电子病历</a>                        </li>                    </ul>                </li>
                <li class="active"><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li><li><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li ><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h2 class="sub-header">当前位置:添加个人病历(以下都是必填项)</h2>
            <form class="form-horizontal" action="MedicalhistoryServlet?action=modify" method="post" onsubmit="return change(this)">
                <input class="hidden" name="id" value="<%=his.getId()%>">
                <div class="form-group">
                    <label for="date_id" class="col-sm-2 control-label">就诊时间</label>
                    <div class="input-group date date col-sm-4" data-date="" data-date-format="yyyy-mm-dd" data-link-field="date_id" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="<%=his.getDate()%>" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" name="date" id="date_id" value="<%=his.getDate()%>" required /><br/>
                </div>
                <div class="form-group">
                    <label for="1" class="col-sm-2 control-label">就诊城市</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="city" id="1" required value="<%=his.getCity()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="2" class="col-sm-2 control-label">就诊医院</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="hospital" id="2" required value="<%=his.getHospital()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="3" class="col-sm-2 control-label">就诊科室</label>
                    <div class="col-sm-4">
                        <select id="3" class="selectpicker show-tick form-control" name="office" required >
                            <option>内科</option>
                            <option>外科</option>
                            <option>妇产科</option>
                            <option>男科</option>
                            <option>儿科</option>
                            <option>传染科</option>
                            <option>精神心理科</option>
                            <option>五官科</option>
                            <option>皮肤性病科</option>
                            <option>中医科</option>
                            <option>整形美容科</option>
                            <option>营养科</option>
                            <option>麻醉科</option>
                            <option>医学影像科</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="4" class="col-sm-2 control-label">医生</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" name="doctor" id="4" required value="<%=his.getDoctor()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="conclusion" class="col-sm-2 control-label">结论</label>
                    <div class="col-sm-6">
                                    <textarea name="conclusion" id="conclusion" style="resize:none;width:600px;height:120px"
                                              maxlength="200" placeholder="200字以内" required><%=his.getConclusion()%></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">确认修改</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                        <button type="button" onclick="javascript:window.location.href='medicalhistory.jsp';" class="btn btn-primary">放弃更改</button>
                    </div>
                </div>
            </form>
            <br>
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
<script src="js/jquery-editable-select.min.js"></script>

<script src="js/sweet-alert.min.js"></script>
<script src="js/sweet-alert.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/bootstrap-select.min.js"></script>

<script language="JavaScript">
    $('#3').editableSelect();
    function change(form) {
        if (form.date.value == "") {
            swal({title:"错误",text:"就诊时间不能为空！",type:"warning"});
            return false;
        }
    }
    $('.date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        minView: 2,
        forceParse: 0,
        pickerPosition: "bottom-left"
    });
</script>

</body>
</html>

