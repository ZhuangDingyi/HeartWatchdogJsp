<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/10
  Time: 9:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="com.zyf.Info" %>
<%@ page import="com.zyf.tools.MyTools" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <title>诊断历史</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <script src="js/echarts.min.js"></script>
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
                <li class="active">
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


<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar" style="bottom: 0">
            <ul class="nav nav-sidebar">
                <li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>  首页</a></li>
                <li class="active"><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>  诊断历史</a></li>
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
            <h2 class="sub-header">心电图及历史诊断结论</h2>

            <div id="chart" style="width:100%;height:400px;"></div>

            <script type="text/javascript">
                var myChart = echarts.init(document.getElementById("chart"));
                var xData = [];
                var yData = [];
                <%Info single=(Info)request.getAttribute("infosingle");
                String str=single.getData();
                String[] ylist=str.split(",");
                int len=ylist.length;
                for(int i=0;i<len;i++){
                %>
                xData.push(<%=i%>);
                yData.push(<%=MyTools.strToint(ylist[i])%>)
                <%}%>
                var option = {
                    title: {
                        left: 'center',
                        text: "心电图像",
                        subtext: "结果仅供参考",
                        textStyle: {fontSize: 24, color: "black"},
                        subtextStyle: {fontSize: 12}
                    },
                    tooltip: {
                        trigger: 'axis' //触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
                    },
                    toolbox: {
                        show : true,

                        feature : {
                            mark : {show: true},
                            dataZoom : {show: true},
                            dataView : {show: true,readOnly:true},
                            restore : {show: true},
                            saveAsImage : {show: true}
                        }
                    },
                    calculable: true,
                    dataZoom : {
                        show : true,
                        realtime : true,
                        start : 20,
                        end : 80
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        axisTick:false,
                        axisLabel:false,
                        data: xData
                    },
                    yAxis: {
                        type: 'value',
                        name: 'y坐标值',
                        axisTick:false,
                        axisLabel:false,
                    },
                    series: [{
                        name:'数值',
                        type: 'line', <!--图表类型-->
                        smooth: true, <!--平滑显示-->
                        symbol: 'none',
                        sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                        itemStyle: {
                            normal: {
                                color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                            }
                        },
                        data: yData
                    }]
                };
                myChart.setOption(option);
            </script>
            <h3>心率：<%=single.getXinlv()%>次</h3>
            <%
                java.text.NumberFormat percentFormat = java.text.NumberFormat.getPercentInstance();
                percentFormat.setMaximumFractionDigits(2); //最大小数位数
            %>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>NO.</th>
                        <th><b>检测项目</b></th>
                        <th><b>疑似率(%)</b></th>
                        <th><b>结论</b></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>1</td>
                        <td>心动过速</td>
                        <td><%=percentFormat.format(single.getXdgs())%>
                        </td>
                        <td><%=single.getCon1()%></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>室性心动过速</td>
                        <td><%=percentFormat.format(single.getSxxdgs())%>
                        </td>
                        <td><%=single.getCon2()%></td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>心动过缓</td>
                        <td><%=percentFormat.format(single.getXdgh())%>
                        </td>
                        <td><%=single.getCon3()%></td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td>房性逸搏</td>
                        <td><%=percentFormat.format(single.getFxyb())%>
                        </td>
                        <td><%=single.getCon4()%></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td>室性逸搏</td>
                        <td><%=percentFormat.format(single.getSxyb())%>
                        </td>
                        <td><%=single.getCon5()%></td>
                    </tr>
                    <tr>
                        <td>6</td>
                        <td>心率不齐</td>
                        <td><%=percentFormat.format(single.getXlbq())%>
                        </td>
                        <td><%=single.getCon6()%></td>
                    </tr>
                    <tr>
                        <td>7</td>
                        <td>室性早搏</td>
                        <td><%=percentFormat.format(single.getSxzb())%>
                        </td>
                        <td><%=single.getCon7()%></td>
                    </tr>
                    <tr>
                        <td>8</td>
                        <td>房性早搏</td>
                        <td><%=percentFormat.format(single.getFxzb())%>
                        </td>
                        <td><%=single.getCon8()%></td>
                    </tr>
                    <tr>
                        <td>9</td>
                        <td>交界性早搏</td>
                        <td><%=percentFormat.format(single.getJjxzb())%>
                        </td>
                        <td><%=single.getCon9()%></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td>房颤</td>
                        <td><%=percentFormat.format(single.getFc())%>
                        </td>
                        <td><%=single.getCon10()%></td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <br>
        </div>
    </div>
    <div class="row">
        <div id="footer" class="container">
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