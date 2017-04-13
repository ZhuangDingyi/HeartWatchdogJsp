<%@ page import="com.zyf.User" %><%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/12
  Time: 10:38
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
    <title>个人信息修改</title>
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

<%
    // 获取登录的用户信息
    User user = (User) session.getAttribute("user");
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
            <h2 class="sub-header">个人信息修改</h2>
            <form class="form-horizontal" action="UserServlet?action=modifyinfo" method="post" onsubmit="return modify(this);">
                <div class="form-group">
                    <label class="col-sm-2 control-label">性别</label>
                    <div class="col-sm-4">
                        <div class="checkbox">
                            <% if(user.getGender().equals("")||user.getGender().equals("男")){%>

                                <input type="radio"  name="gender" value="男" checked="checked"> 男
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <input type="radio"  name="gender" value="女"> 女

                            <%}else{%>
                                <%--<label class="checkbox-inline">--%>
                                <input type="radio" id="1" name="gender" value="男" > 男
                                <%--</label>--%>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <%--<lable class="checkbox-inline">--%>
                                <input type="radio" name="gender" value="女" checked="checked"> 女
                                <%--</lable>--%>
                            <%}
                                %>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="2" class="col-sm-2 control-label">年龄</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" name="age" id="2" value="<%=user.getAge()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="3" class="col-sm-2 control-label">手机号码</label>
                    <div class="col-sm-4">
                        <input type="tel" class="form-control" id="3" name="phone" value="<%=user.getPhone()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="4" class="col-sm-2 control-label">邮箱</label>
                    <div class="col-sm-4">
                        <input type="email" class="form-control" id="4" name="email" value="<%=user.getEmail()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="5" class="col-sm-2 control-label">居住地址</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="5" name="addr" value="<%=user.getAddr()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="6" class="col-sm-2 control-label">身份证号</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="6" name="iden" value="<%=user.getIden()%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="7" class="col-sm-2 control-label">身高(cm)</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="7" name="height" value="<%=user.getHeight()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="8" class="col-sm-2 control-label">体重(Kg)</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="8" name="weight" value="<%=user.getWeight()%>">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">确认修改</button>
                    </div>
                </div>
            </form>
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

<%--
<script type="text/javascript">
    function modify(form) {
        if (form.gender.value == "") {
            swal({title:"错误",text:"性别不能为空！",type:"info"});
            return false;
        }
        if (form.age.value == "") {
            swal({title:"错误",text:"年龄不能为空！",type:"info"});
            return false;
        }
        if (form.phone.value == "") {
            swal({title:"错误",text:"手机号码不能为空！",type:"warning"});
            return false;
        }
        if (form.email.value == "") {
            swal({title:"错误",text:"电子邮箱不能为空！",type:"question"});
            return false;
        }
        if (form.addr.value == "") {
            swal({title:"错误",text:"联系地址不能为空！",type:"warning"});
            return false;
        }
        if (form.iden.value == "") {
            swal({title:"错误",text:"身份证号码不能为空！",type:"warning"});
            return false;
        }
        if (form.height.value == "") {
            swal({title:"错误",text:"身高不能为空！",type:"warning"});
            return false;
        }
        if (form.weight.value == "") {
            swal({title:"错误",text:"体重不能为空！",type:"warning"});
            return false;
        }
    }
</script>
--%>

<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<script src="js/sweet-alert.min.js"></script>

</body>
</html>
