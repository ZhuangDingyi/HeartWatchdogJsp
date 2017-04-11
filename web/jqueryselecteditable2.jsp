<%@ page import="com.zyf.User" %>
<!--备份-->
<!--%@ page contentType="text/html;charset=UTF-8" language="java" %-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>心狗健康管理系统</title>
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/mono-blue.min.css">-->
    <link href="css/jquery-editable-select.min.css" rel="stylesheet">
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
    </div>

    <%
        // 获取登录的用户信息
        User user = (User) session.getAttribute("user");
    %>
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>  首页</a></li>
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
                    <label for="7" class="col-sm-2 control-label">民族</label>
                    <div class="col-sm-4">
                        <select id="7" class="selectpicker show-tick form-control" name="nationality">
                            <option>汉族</option>
                            <option>少数民族</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="8" class="col-sm-2 control-label">工作单位</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="8" name="company" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="9" class="col-sm-2 control-label">文化程度</label>
                    <div class="col-sm-4">
                        <select id="9" class="selectpicker show-tick form-control">
                            <option>大学专科及以上</option>
                            <option>高中/技校/中专</option>
                            <option>初中</option>
                            <option>小学</option>
                            <option>文盲及半文盲</option>
                            <option>不详</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="10" class="col-sm-2 control-label">职业</label>
                    <div class="col-sm-4">
                        <select id="10" class="selectpicker show-tick form-control">
                            <option>国家机关、党群组织、企业、事业单位负责人</option>
                            <option>专业技术人员</option>
                            <option>办事人员和有关人员</option>
                            <option>商业、服务业人员</option>
                            <option>农、林、牧、渔、水利业生产人员</option>
                            <option>生产、运输设备操作人员及有关人员</option>
                            <option>军人</option>
                            <option>不便分类的其他从业人员</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="11" class="col-sm-2 control-label">婚姻状况</label>
                    <div class="col-sm-4">
                        <select id="11" class="selectpicker show-tick form-control" name="marry">
                            <option>未婚</option>
                            <option>已婚</option>
                            <option>丧偶</option>
                            <option>离婚</option>
                            <option>未说明的婚姻状况</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="12" class="col-sm-2 control-label">血型</label>
                    <div class="col-sm-4">
                        <select id="12" class="selectpicker show-tick form-control" name="bloodtype">
                            <option>A型</option>
                            <option>B型</option>
                            <option>O型</option>
                            <option>AB型</option>
                            <option>不详</option>
                        </select>
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

                <%--<select id="why123" class="form-control">--%>
                    <%--<option>Alfa Romeo</option>--%>
                    <%--<option>Audi</option>--%>
                    <%--<option>BMW</option>--%>
                    <%--<option>Citroen</option>--%>
                <%--</select>--%>
            </form>
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
<!--<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>-->
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>-->
<script src="js/jquery-editable-select.min.js"></script>
<script>
    $("#12").editableSelect();
</script>


</body>
</html>