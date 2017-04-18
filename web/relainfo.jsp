<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/16
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="com.zyf.Info" %>
<%@ page import="com.zyf.tools.MyTools" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>亲友健康信息</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/easy-responsive-tabs.css" type="text/css">
    <!-- Custom styles for this template -->
    <link href="css/dashboard.css" rel="stylesheet">
    <script src="http://echarts.baidu.com/build/dist/echarts-all.js"></script>
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
                <li >
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
                <li ><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i>  趋势显示</a></li>
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
                <li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li>
                <li class="active"> <a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>
                <li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>
                <li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <%String relaname=(String)request.getAttribute("relaname");%>
            <%String reid=(String)request.getAttribute("reid");%>
            <h2 class="sub-header"><font size="6" color="#dc143c">当前显示的是您的好友 <%=relaname%> 的健康信息</font></h2>
            <div id="demoTab">
                <ul class="resp-tabs-list hor_1">
                    <li>心率</li>
                    <li>心动过速</li>
                    <li>室性心动过速</li>
                    <li>心动过缓</li>
                    <li>房性逸搏</li>
                    <li>室性逸搏</li>
                    <li>心率不齐 </li>
                    <li>室性早搏</li>
                    <li>房性早搏</li>
                    <li>交界性早搏</li>
                    <li>心动房颤</li>
                    <%--<li class="active">
                        <a href="#panel1" data-toggle="tab">心率</a>
                    </li>
                    <li>
                        <a href="#panel2" data-toggle="tab">心动过速</a>
                    </li>
                    <li class="active">
                        <a href="#panel3" data-toggle="tab">室性心动过速</a>
                    </li>
                    <li>
                        <a href="#panel-987331" data-toggle="tab">心动过缓</a>
                    </li>
                    <li class="active">
                        <a href="#panel-188757" data-toggle="tab">房性逸搏</a>
                    </li>
                    <li>
                        <a href="#panel-987331" data-toggle="tab">室性逸搏</a>
                    </li>
                    <li class="active">
                        <a href="#panel-188757" data-toggle="tab">心率不齐</a>
                    </li>
                    <li>
                        <a href="#panel-987331" data-toggle="tab">室性早搏</a>
                    </li>
                    <li class="active">
                        <a href="#panel-188757" data-toggle="tab">房性早搏</a>
                    </li>
                    <li>
                        <a href="#panel-987331" data-toggle="tab">交界性早搏</a>
                    </li>
                    <li class="active">
                        <a href="#panel-188757" data-toggle="tab">心动房颤</a>
                    </li>--%>
                </ul>

                <div class="resp-tabs-container hor_1">
                    <div id="chart" style="width:100%;height:400px;"></div>
                    <div id="chart1" style="width:100%;height:400px;"></div>
                    <div id="chart2" style="width:100%;height:400px;"></div>
                    <div id="chart3" style="width:100%;height:400px;"></div>
                    <div id="chart4" style="width:100%;height:400px;"></div>
                    <div id="chart5" style="width:100%;height:400px;"></div>
                    <div id="chart6" style="width:100%;height:400px;"></div>
                    <div id="chart7" style="width:100%;height:400px;"></div>
                    <div id="chart8" style="width:100%;height:400px;"></div>
                    <div id="chart9" style="width:100%;height:400px;"></div>
                    <div id="chart10" style="width:100%;height:400px;"></div>

                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart"));
                        var xData = [];
                        var yData = [];
                        var y1Data = [];
                        var y2Data = [];
                        var y3Data = [];
                        var y4Data = [];
                        var y5Data = [];
                        var y6Data = [];
                        var y7Data = [];
                        var y8Data = [];
                        var y9Data = [];
                        var y10Data = [];
                        <%List inforelalist=(List)request.getAttribute("infoRelaList");
                        int len=inforelalist.size();
                        for(int i=0;i<len;i++){
                        Info single=(Info)inforelalist.get(i);
                        %>
                        xData.push('<%=single.getDate()%>');
                        yData.push(<%=single.getXinlv()%>);
                        y1Data.push(<%=single.getXdgs()%>)
                        y2Data.push(<%=single.getSxxdgs()%>)
                        y3Data.push(<%=single.getXdgh()%>)
                        y4Data.push(<%=single.getFxyb()%>)
                        y5Data.push(<%=single.getSxyb()%>)
                        y6Data.push(<%=single.getXlbq()%>)
                        y7Data.push(<%=single.getSxzb()%>)
                        y8Data.push(<%=single.getFxzb()%>)
                        y9Data.push(<%=single.getJjxzb()%>)
                        y10Data.push(<%=single.getFc()%>)
                        <%}%>
                        var option = {
                            title: {
                                left: 'center',
                                text: "心率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis' ,//触发类型，默认数据触发，见下图，可选为：'item' | 'axis' 其实就是是否共享提示框
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心率',
                            },
                            series: [{
                                name:'心率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
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
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart1"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "心动过速疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心动过速疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y1Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>

                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart2"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "室性心动过速疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '室性心动过速疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y2Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>

                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart3"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "心动过缓疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ':' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心动过缓疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y3Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart4"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "房性逸搏疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心动过速疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y4Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart5"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "室性疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '室性逸搏疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y5Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart6"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "心律不齐疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心率不齐疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y6Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart7"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "室性早搏疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '室性早搏疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y7Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart8"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "房性早搏疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '房性早搏疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y8Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart9"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "交界性早搏疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 20,
                                end : 80
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '交界性早搏疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y9Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>
                    <script type="text/javascript">
                        var myChart = echarts.init(document.getElementById("chart10"));
                        var option = {
                            title: {
                                left: 'center',
                                text: "房颤疑似率趋势图",
                                textStyle: {fontSize: 24, color: "black"},
                                subtextStyle: {fontSize: 12}
                            },
                            tooltip: {
                                trigger: 'axis',
                                formatter:function(params)
                                {
                                    var relVal = params[0].name;
                                    for (var i = 0, l = params.length; i < l; i++) {
                                        relVal += '<br/>' + params[i].seriesName + ' : ' + params[i].value+"%";
                                    }
                                    return relVal;
                                }
                            },
                            toolbox: {
                                show : true,
                                feature : {
                                    mark : {show: true},
                                    dataZoom : {show: true},
                                    dataView : {show: true,readOnly:true},
                                    magicType : {show: true, type: ['line', 'bar']},
                                    restore : {show: true},
                                    saveAsImage : {show: true}
                                }
                            },
                            dataZoom : {
                                show : true,
                                realtime : true,
                                start : 0,
                                end : 100
                            },
                            calculable: true,
                            xAxis: {
                                type: 'category',
                                boundaryGap: false,
                                name: '上传时间',
                                data: xData
                            },
                            yAxis: {
                                type: 'value',
                                name: '心动过速疑似率',
                                axisLabel: {  formatter: '{value} %' }
                            },
                            series: [{
                                name:'疑似率',
                                type: 'line', <!--图表类型-->
                                <!--平滑显示-->
                                symbol: 'none',
                                sampling: 'average', <!--折线图在数据量远大于像素点时候的降采样策略，开启后可以有效的优化图表的绘制效率，average即取过滤点的平均值-->
                                itemStyle: {
                                    normal: {
                                        color: 'rgb(255, 70, 131)'  <!--线条颜色-->
                                    }
                                },
                                data: y10Data
                            }]
                        };
                        myChart.setOption(option);
                    </script>

                </div>
            </div>


            <%--接下来是亲友记录--%>
            <div>
                <table  id="teacher_table" data-toggle="table" data-url="RelaServlet?action=RelaSelectInfo&para=<%=reid%>"
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
                        <th data-field="id" class="col-sm-3 col-md-1">编号</th>
                        <th data-field="date" class="col-sm-3 col-md-2">记录时间</th>
                        <th data-field="read" align="center" class="col-sm-3 col-md-2">操作</th>
                    </tr>
                    </thead>
                </table>
                <%--<p id="test">12345</p>--%>
                <br>
            </div>
            </br></br>
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
<script type="text/javascript" src="js/easyResponsiveTabs.js"></script>
<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>
<script>
    $(document).ready(function() {
        //Horizontal Tab
        $('#demoTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            tabidentify: 'hor_1', // The tab groups identifier
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#nested-tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
    })
</script>
</body>
</html>
