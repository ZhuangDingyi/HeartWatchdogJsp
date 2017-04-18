<%@ page import="com.zyf.User" %>
<%--
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
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <link href="css/jquery-editable-select.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">
    <link href="css/bootstrap-datetimepicker.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap-select.css">
    <link rel="stylesheet" href="css/bootstrap-select.min.css">
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
            <h2 class="sub-header">个人信息</h2>
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
                        <input type="text" class="form-control" id="8" name="company" maxlength="30" value="" >
                    </div>
                </div>
                <div class="form-group">
                    <label for="9" class="col-sm-2 control-label">文化程度</label>
                    <div class="col-sm-4">
                        <select id="9" class="selectpicker show-tick form-control" name="edu">
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
                        <select id="10" class="selectpicker show-tick form-control" name="job">
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
                    <label for="13" class="col-sm-2 control-label">身高(cm)</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="13" name="height" value="<%=user.getHeight()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="14" class="col-sm-2 control-label">体重(Kg)</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="14" name="weight" value="<%=user.getWeight()%>">
                    </div>
                </div>
                <div class="form-group">
                    <label for="selfevaluate" class="col-sm-2 control-label">健康状态自我评估</label>
                    <div class="col-sm-3">
                        <select id="selfevaluate" class="selectpicker show-tick form-control" name="selfevaluate">
                            <option>满意</option>
                            <option>基本满意</option>
                            <option>说不清楚</option>
                            <option>不太满意</option>
                            <option>不满意</option>

                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="mentality" class="col-sm-2 control-label">心理状况</label>
                    <div class="col-sm-3">
                        <select id="mentality" class="selectpicker show-tick form-control" name="mentality">
                            <option>良好</option>
                            <option>紧张</option>
                            <option>抑郁</option>
                            <option>焦虑</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="allergy" class="col-sm-2 control-label">过敏药物史</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="allergy" name="allergy" value=""  maxlength="20">
                    </div>
                </div>
                <div class="form-group">
                    <label for="15" class="col-sm-2 control-label">既往病史: 疾病1</label>
                    <div class="col-sm-3">
                        <select id="15" class="selectpicker show-tick form-control" name="desease1">
                            <option>无</option>
                            <option>高血压</option>
                            <option>糖尿病</option>
                            <option>冠心病</option>
                            <option>慢性阻塞性肺疾病</option>
                            <option>恶性肿瘤</option>
                            <option>脑卒中</option>
                            <option>重性精神疾病</option>
                            <option>结核病</option>
                            <option>肝炎</option>
                            <option>其他法定传染病</option>
                            <option>职业病</option>
                        </select>
                    </div>
                    <label for="dtime_input1" class="col-sm-1 control-label">确诊时间</label>
                    <div class="input-group date dtime1 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtime_input1" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" id="dtime_input1" name="dtime1" value="" /><br/>
                </div>
                <div class="form-group">
                    <label for="16" class="col-sm-2 control-label">疾病2</label>
                    <div class="col-sm-3">
                        <select id="16" class="selectpicker show-tick form-control" name="desease2">
                            <option>无</option>
                            <option>高血压</option>
                            <option>糖尿病</option>
                            <option>冠心病</option>
                            <option>慢性阻塞性肺疾病</option>
                            <option>恶性肿瘤</option>
                            <option>脑卒中</option>
                            <option>重性精神疾病</option>
                            <option>结核病</option>
                            <option>肝炎</option>
                            <option>其他法定传染病</option>
                            <option>职业病</option>
                        </select>
                    </div>
                    <label for="dtime_input2" class="col-sm-1 control-label">确诊时间</label>
                    <div class="input-group date dtime2 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtime_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" id="dtime_input2" name="dtime2" value="" /><br/>
                </div>
                <div class="form-group">
                    <label for="17" class="col-sm-2 control-label">疾病3</label>
                    <div class="col-sm-3">
                        <select id="17" class="selectpicker show-tick form-control" name="desease3">
                            <option>无</option>
                            <option>高血压</option>
                            <option>糖尿病</option>
                            <option>冠心病</option>
                            <option>慢性阻塞性肺疾病</option>
                            <option>恶性肿瘤</option>
                            <option>脑卒中</option>
                            <option>重性精神疾病</option>
                            <option>结核病</option>
                            <option>肝炎</option>
                            <option>其他法定传染病</option>
                            <option>职业病</option>
                        </select>
                    </div>
                    <label for="dtime_input3" class="col-sm-1 control-label">确诊时间</label>
                    <div class="input-group date dtime3 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="dtime_input3" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" id="dtime_input3" name="dtime3" value="" /><br/>
                </div>

                <div class="form-group">
                    <label for="18" class="col-sm-2 control-label">既往手术史:名称1</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="18" name="operation1" value=""  maxlength="20">
                    </div>
                    <label for="otime_input1" class="col-sm-1 control-label">手术时间</label>
                    <div class="input-group date otime1 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="otime_input1" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" name="otime1" id="otime_input1" value="" /><br/>
                </div>
                <div class="form-group">
                    <label for="19" class="col-sm-2 control-label">手术名称2</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="19" name="operation2" value="" maxlength="20">
                    </div>
                    <label for="otime_input2" class="col-sm-1 control-label">手术时间</label>
                    <div class="input-group date otime2 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="otime_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" name="otime2" id="otime_input2" value="" /><br/>
                </div>
                <div class="form-group">
                    <label for="20" class="col-sm-2 control-label">手术名称3</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="20" name="operation3" value=""  maxlength="20">
                    </div>
                    <label for="otime_input3" class="col-sm-1 control-label">手术时间</label>
                    <div class="input-group date otime3 col-sm-3" data-date="" data-date-format="yyyy-mm-dd" data-link-field="otime_input3" data-link-format="yyyy-mm-dd">
                        <input class="form-control"size="16" type="text" value="" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                    </div>
                    <input type="hidden" name="otime3" id="otime_input3" value="" /><br/>
                </div>
                <div class="form-group">
                    <label for="21" class="col-sm-2 control-label">家族病史:父亲</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="21" name="f1desease" value="" placeholder="请输入家庭成员的患病情况(30字以内)">
                    </div>
                </div>
                <div class="form-group">
                    <label for="22" class="col-sm-2 control-label">母亲</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="22" name="f2desease" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="23" class="col-sm-2 control-label">兄弟姐妹</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="23" name="f3desease" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="24" class="col-sm-2 control-label">子女</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="24" name="f4desease" value="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="25" class="col-sm-2 control-label">遗传病史</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="25" name="inheridesease" value="" placeholder="请输入疾病名称">
                    </div>
                </div>
                <div class="form-group">
                    <label for="26" class="col-sm-2 control-label">锻炼频率</label>
                    <div class="col-sm-2">
                        <select id="26" class="selectpicker show-tick form-control" name="exefre">
                            <option>每天</option>
                            <option>每周一次以上</option>
                            <option>偶尔</option>
                            <option>不锻炼</option>
                        </select>
                    </div>
                    <label for="27" class="col-sm-1 control-label">锻炼方式</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" id="27" name="exeway" value="" maxlength="10">
                    </div>
                </div>

                <div class="form-group">
                    <label for="28" class="col-sm-2 control-label">锻炼时间(分钟/天)</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="28" name="exetime" value="" maxlength="5">
                    </div>
                </div>
                <div class="form-group">
                    <label for="29" class="col-sm-2 control-label">饮食习惯</label>
                    <div class="col-sm-4">
                        <select id="29" class="selectpicker show-tick form-control" name="eathabit">
                            <option>无明显嗜好</option>
                            <option>荤素均衡</option>
                            <option>荤食为主</option>
                            <option>素食为主</option>
                            <option>嗜盐</option>
                            <option>嗜油</option>
                            <option>嗜甜</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="30" class="col-sm-2 control-label">吸烟状况</label>
                    <div class="col-sm-2">
                        <select id="30" class="selectpicker show-tick form-control" name="smokestatus">
                            <option>从不吸烟</option>
                            <option>已戒烟</option>
                            <option>吸烟</option>
                        </select>
                    </div>
                    <label for="31" class="col-sm-1 control-label">吸烟量</label>
                    <div class="col-sm-2">
                        <select id="31" class="selectpicker show-tick form-control" name="smokeamount">
                            <option>无</option>
                            <option>偶尔</option>
                            <option>少量</option>
                            <option>经常</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="32" class="col-sm-2 control-label">是否饮酒</label>
                    <div class="col-sm-2">
                        <select id="32" class="selectpicker show-tick form-control" name="isdrink">
                            <option>从不饮酒</option>
                            <option>是</option>
                            <option>已戒酒</option>
                        </select>
                    </div>
                    <label for="33" class="col-sm-1 control-label">每次饮酒量</label>
                        <div class="col-sm-2">
                            <select id="33" class="selectpicker show-tick form-control" name="drinkamount">
                                <option>无</option>
                                <option>少量</option>
                                <option>中量</option>
                                <option>大量</option>
                            </select>
                        </div>
                    <label for="34" class="col-sm-1 control-label">饮酒频率</label>
                    <div class="col-sm-2">
                            <select id="34" class="selectpicker show-tick form-control" name="drinkfre">
                                <option>无</option>
                                <option>偶尔</option>
                                <option>少量</option>
                                <option>经常</option>
                            </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="35" class="col-sm-2 control-label">睡眠情况</label>
                    <div class="col-sm-2">
                        <select id="35" class="selectpicker show-tick form-control" name="sleepstatus" >
                            <option>良好</option>
                            <option>睡眠困难</option>
                            <option>早醒</option>
                            <option>梦游</option>
                            <option>其他</option>
                        </select>
                    </div>
                    <label for="36" class="col-sm-1 control-label">睡眠时间（小时）</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="36" name="sleeptime" value="" maxlength="5">
                    </div>
                </div>
                <div class="form-group">
                    <label for="37" class="col-sm-2 control-label">职业病危害因素接触史</label>
                    <div class="col-sm-2">
                        <select id="37" class="selectpicker show-tick form-control" name="jobmaterial" >
                            <option>无</option>
                            <option>粉尘</option>
                            <option>放射物质</option>
                            <option>物理因素</option>
                            <option>化学物质</option>
                            <option>其他</option>
                        </select>
                    </div>
                    <label for="38" class="col-sm-1 control-label">有无防护措施</label>
                    <div class="col-sm-2">
                        <select id="38" class="selectpicker show-tick form-control" name="isjobprotect">
                            <option>有</option>
                            <option>无</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">确认修改</button><span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span>
                        <button type="button" onclick="javascript:window.open('perinfo.jsp');" class="btn btn-primary">放弃更改</button>
                    </div>
                </div>



            </form>
            <br><br>
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
<!-- Bootstrap core JavaScript================================================== -->
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
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery-editable-select.min.js"></script>
<script src="js/sweet-alert.min.js"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="js/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
<script src="js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script>
    $('#15').editableSelect();
    $("#16").editableSelect();
    $("#17").editableSelect();

    $('.dtime1').datetimepicker({
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
    $('.dtime2').datetimepicker({
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
    $('.dtime3').datetimepicker({
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
    $('.otime1').datetimepicker({
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
    $('.otime2').datetimepicker({
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
    $('.otime3').datetimepicker({
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
//    $('#15').selectpicker({
//        style: 'btn-info',
//        size: 4
//    });
</script>
</body>
</html>
