<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/28
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.zyf.Info" %>
<%@ page import="com.zyf.tools.MyTools" %>
<%@ page import="com.zyf.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/22
  Time: 20:21
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
    <link rel="icon" href="../../favicon.ico">
    <title>心狗健康管理系统</title>
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
    </div>
    <div class="row" style="text-align: center">
        <%--<div class="col-sm-3 col-md-2 sidebar">--%>
        <%--<ul class="nav nav-sidebar">--%>
        <%--<li><a href="homepage.jsp"><i class="glyphicon glyphicon-home"></i>  首页</a></li>--%>
        <%--<li><a href="infotime.jsp"><i class="glyphicon glyphicon-cloud"></i>  诊断历史</a></li>--%>
        <%--<li><a href="InfoServlet?action=tend"><i class="glyphicon glyphicon-signal"></i>  趋势显示</a></li>--%>
        <%--<!-- 此处将侧边栏扁平化 并且浮动式-->--%>
        <%--<li>--%>
        <%--<a href="#medicalreport" class="nav-header collapsed" data-toggle="collapse">--%>
        <%--<i class="glyphicon glyphicon-sort"></i>--%>
        <%--医疗报告--%>
        <%--<span class="glyphicon glyphicon-list"></span>--%>
        <%--</a>--%>
        <%--<ul id="medicalreport" class="nav nav-list collapse secondmenu" style="height: 0px;">--%>
        <%--<li>--%>
        <%--<a href="fileupload.jsp">    <i class="glyphicon glyphicon-upload"></i>  上传医疗报告</a>--%>
        <%--</li>--%>
        <%--<li class="divider">--%>
        <%--</li>--%>
        <%--<li>--%>
        <%--<a href="FileServlet?action=list">    <i class="glyphicon glyphicon-download"></i>   下载/删除报告</a>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--<ul class="nav nav-sidebar">--%>
        <%--<li>                    <a href="#perinfo" class="nav-header collapsed" data-toggle="collapse">                        <i class="glyphicon glyphicon-user"></i>                        个人信息                    </a>                    <ul id="perinfo" class="nav nav-list collapse secondmenu" style="height: 0px;">                        <li>                            <a href="perinfo.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-list-alt"></i>  健康档案</a>                        </li>                        <li class="divider">                        </li>                        <li>                            <a href="medicalhistory.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="glyphicon glyphicon-file"></i>  电子病历</a>                        </li>                    </ul>                </li>--%>
        <%--<li><a href="count.jsp"><i class="glyphicon glyphicon-cog"></i>  账户设置</a></li><li><a href="RelaServlet?action=RelaList"> <i class="glyphicon glyphicon-plus"></i>亲友管理</a></li>--%>
        <%--<li><a href="ill.jsp"><i class="glyphicon glyphicon-book"></i>  病理解释</a></li>--%>
        <%--<li><a href="help.jsp"><i class="glyphicon glyphicon-list-alt"></i>  使用指南</a></li>--%>
        <%--</ul>--%>
        <%--</div>--%>
        <%--<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">--%>
        <br>
        <canvas id="ecg" width="1050px" height="1485px" style="border:black 1px solid">您的浏览器不支持canvas</canvas><br>
        <button type="button" class="btn btn-primary" onclick="download()">下载心电报告</button>
        <%--</div>--%>
        <br><br><br><br><br>
        <br>
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
<script src="//cdn.bootcss.com/jspdf/1.3.3/jspdf.debug.js"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.3/jspdf.debug.js"></script>--%>
<script src="js/html2canvas.js"></script>
<script src="http://cdn.bootcss.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
    <%Info single=(Info)request.getAttribute("infosingle");
    User user=(User)session.getAttribute("user");
    %>
    var canvas=document.getElementById('ecg');
    can=canvas.getContext('2d');
    can.font="30px Arial";
    var spaceShip=new Image();
    spaceShip.addEventListener('load',eventShipLoaded,false);
    spaceShip.src="images/logo.png"
    function eventShipLoaded(){
        drawScreen();
    }
    function drawScreen(){
        can.drawImage(spaceShip,790,60,177,59.2)
    }

    can.textAlign="start";
    can.fillText("心狗智能硬件心电检测报告",70,100);
    can.moveTo(75,120);
    can.lineTo(975,120);
    can.moveTo(75,130);
    can.lineTo(975,130);
    can.stroke();
    can.beginPath();
    can.font="20px Arial";
    can.textAlign="start"
    can.fillText("用户: <%=user.getUname()%>",100,170);
    can.fillText("性别:<%=user.getGender()%>",560,170);
    can.fillText("年龄:<%=user.getAge()%>",720,170);
    can.moveTo(75,185);
    can.lineTo(975,185);
    can.stroke();
    can.fillText("测试时间: <%=single.getDate()%>",100,220);
    can.fillText("时长: 20s",600,220);
    can.fillText("心率 :<%=single.getXinlv()%>bpm",100,250);
    can.fillText("增益:10mm/mV",600,250);
    can.fillText("走速:25mm/s",800,250);
    can.fillText("PR/QT/QTc间期:  176/340/345 ms",100,280);
    can.beginPath();
    can.strokeStyle ="#f1c1c5";
    can.lineWidth=0.18;
    for (var x=75;x<976;x +=5){
        can.moveTo(x,300);
        can.lineTo(x,950);
        can.stroke();
    }
    for (var y=300;y<951;y+=5){
        can.moveTo(75,y);
        can.lineTo(975,y);
        can.stroke();
    }
    can.beginPath();
    can.lineWidth=0.4;
    can.strokeStyle ="#e03433";// "#f1dedf";"#f0adaa"//"#e0514b"
    for (var x=75;x<976;x +=25){
        can.moveTo(x,300);
        can.lineTo(x,950);
        can.stroke();
    }
    for (var y=300;y<951;y+=25){
        can.moveTo(75,y);
        can.lineTo(975,y);
        can.stroke();
    }

    can.beginPath();
    can.lineWidth=2;
    can.strokeStyle="#000";
    can.moveTo(75,410);
    can.lineTo(80,410);
    can.lineTo(80,360);
    can.lineTo(95,360);
    can.lineTo(95,410);
    can.lineTo(100,410);
    can.moveTo(80,415);
    can.lineTo(95,415);
    can.moveTo(85,415);
    can.lineTo(85,430);
    can.moveTo(90,415);
    can.lineTo(90,430);
    can.moveTo(80,430);
    can.lineTo(95,430);
    can.moveTo(75,635);
    can.lineTo(80,635);
    can.lineTo(80,585);
    can.lineTo(95,585);
    can.lineTo(95,635);
    can.lineTo(100,635);
    can.moveTo(75,860);
    can.lineTo(80,860);
    can.lineTo(80,810);
    can.lineTo(95,810);
    can.lineTo(95,860);
    can.lineTo(100,860);
    can.stroke();

    var xData = [];
    var yData = [];
    <%
    java.text.NumberFormat percentFormat = java.text.NumberFormat.getPercentInstance();
                percentFormat.setMaximumFractionDigits(2); //最大小数位数
    String str=single.getData();
    String[] ylist=str.split(",");
    int len=ylist.length;
    for(int i=0;i<len;i++){
    %>
    xData.push(<%=i%>);
    yData.push(<%=MyTools.strTofloat(ylist[i])%>);

    <%}%>
    can.beginPath();
    can.lineWidth=2;
    can.moveTo(100,410-yData[0]/30000);
    for(var x=1;x<3585;x++){
        can.lineTo(100+0.24414*x,410-yData[x]/30000)
    }
    can.stroke();
    can.beginPath();
    can.moveTo(100,635-yData[3584]/30000);
    for(var x=3585;x<7169;x++){
        can.lineTo(100+0.24414*(x-3584),635-yData[x]/30000)
    }
    can.stroke();
    can.beginPath();
    can.moveTo(100,860-yData[7168]/30000);
    for(var x=7169;x<yData.length+1;x++){
        can.lineTo(100+0.24414*(x-7168),860-yData[x]/30000)
    }
    can.stroke();
    can.beginPath();
    can.lineWidth=1;
    can.font="20px Arial";
    can.textAlign="start"
    can.fillText("NO.",100,1030);
    can.fillText("检测项目",300,1030);
    can.fillText("疑似率（%）",600,1030);
    can.fillText("结论",900,1030);
    can.moveTo(75,1040);
    can.lineTo(975,1040);
    can.fillText("1",110,1065)
    can.fillText("心动过速",300,1065)
    can.fillText("<%=percentFormat.format(single.getXdgs())%>",630,1065)
    can.fillText("<%=single.getCon1()%>",900,1065)
    can.moveTo(75,1070);
    can.lineTo(975,1070);
    can.fillText("2",110,1095)
    can.fillText("室性心动过速",300,1095)
    can.fillText("<%=percentFormat.format(single.getSxxdgs())%>",630,1095)
    can.fillText("<%=single.getCon2()%>",900,1095)
    can.moveTo(75,1100);
    can.lineTo(975,1100);
    can.fillText("3",110,1125)
    can.fillText("心动过缓",300,1125)
    can.fillText("<%=percentFormat.format(single.getXdgh())%>",630,1125)
    can.fillText("<%=single.getCon3()%>",900,1125)
    can.moveTo(75,1130);
    can.lineTo(975,1130);
    can.fillText("4",110,1155)
    can.fillText("房性逸搏",300,1155)
    can.fillText("<%=percentFormat.format(single.getFxyb())%>",630,1155)
    can.fillText("<%=single.getCon4()%>",900,1155)
    can.moveTo(75,1160);
    can.lineTo(975,1160);
    can.fillText("5",110,1185)
    can.fillText("室性逸搏",300,1185)
    can.fillText("<%=percentFormat.format(single.getSxyb())%>",630,1185)
    can.fillText("<%=single.getCon5()%>",900,1185)
    can.moveTo(75,1190);
    can.lineTo(975,1190);
    can.fillText("6",110,1215)
    can.fillText("心率不齐",300,1215)
    can.fillText("<%=percentFormat.format(single.getXlbq())%>",630,1215)
    can.fillText("<%=single.getCon6()%>",900,1215)
    can.moveTo(75,1220);
    can.lineTo(975,1220);
    can.fillText("7",110,1245)
    can.fillText("室性早搏",300,1245)
    can.fillText("<%=percentFormat.format(single.getSxzb())%>",630,1245)
    can.fillText("<%=single.getCon7()%>",900,1245)
    can.moveTo(75,1250);
    can.lineTo(975,1250);
    can.fillText("8",110,1275)
    can.fillText("房性早搏",300,1275)
    can.fillText("<%=percentFormat.format(single.getFxzb())%>",630,1275)
    can.fillText("<%=single.getCon8()%>",900,1275)
    can.moveTo(75,1280);
    can.lineTo(975,1280);
    can.fillText("9",110,1305)
    can.fillText("交界性早搏",300,1305)
    can.fillText("<%=percentFormat.format(single.getJjxzb())%>",630,1305)
    can.fillText("<%=single.getCon9()%>",900,1305)
    can.moveTo(75,1310);
    can.lineTo(975,1310);
    can.fillText("10",110,1335)
    can.fillText("房颤",300,1335)
    can.fillText("<%=percentFormat.format(single.getFc())%>",630,1335)
    can.fillText("<%=single.getCon10()%>",900,1335)
    can.moveTo(75,1340);
    can.lineTo(975,1340);
    can.stroke();
</script>
<script>

    //得到要导出pdf的html根节点
    //    function download(){
    //        html2canvas($("#ecg"), {
    //            onrendered: function (canvas) {
    //                var imgData = canvas.toDataURL(
    //                        'image/png');
    //                var doc = new jsPDF('p', 'mm');
    //                doc.addImage(imgData, 'PNG', 10, 10);
    //                doc.save('sample-file.pdf');}});}
    //html2canvas官网的标准方法
    function js_getDPI() {
        var arrDPI = new Array;
        if (window.screen.deviceXDPI) {
            arrDPI[0] = window.screen.deviceXDPI;
            arrDPI[1] = window.screen.deviceYDPI;
        }
        else {
            var tmpNode = document.createElement("DIV");
            tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
            document.body.appendChild(tmpNode);
            arrDPI[0] = parseInt(tmpNode.offsetWidth);
            arrDPI[1] = parseInt(tmpNode.offsetHeight);
            tmpNode.parentNode.removeChild(tmpNode);
        }
        return arrDPI;
    }
    function download() {
        var canvas=document.getElementById('ecg');
        var imgData = canvas.toDataURL();
        var canWidth = canvas.width;
        var canHeight = canvas.height;
//                document.write(canHeight,canWidth,yData.length);
        var arrDPI = js_getDPI();//获取显示器DPI（这个方法没贴出来）
        var dpiX = 96;
        var dpiY = 96;
        if(arrDPI.length>0){
            dpiX = arrDPI[0];
            dpiY = arrDPI[1];
        }
        //l:横向， p：纵向；单位： in:英寸，mm毫米；画布大小：a3,a4,leter,[]（当内容为数组时，为自定义大小）
        //   var doc = new jsPDF('l', 'in', [(canWidth+10)/dpiX,(canHeight+10)/dpiY]);//设置PDF宽高为要显示的元素的宽高，将像素转化为英寸
        var doc=new jsPDF('p','mm',[(canWidth*25.4)/dpiX,(canHeight*25.4)/dpiY]);
//                var doc=new jsPDF('p','in',[(canWidth)/dpiX,(canHeight)/dpiY]);
//                var doc=new jsPDF('p','mm',[210,297]);
        //doc.addImage(imgData, 'png', 7/dpiX,5/dpiY); //写入位置：x:5, y:5 单位:英寸
        doc.addImage(imgData,'png',0,0)
        doc.save('report_pdf_' + new Date().getTime()+'.pdf');
    }
    function download2(){
        if(confirm("确认下载报告")){
            var pdf=new jsPDF('p','pt','a4');
            pdf.internal.scaleFactor=1;
            var options={
                pagesplit:true,
                "background":"#FFF"
            };
            var printHtml=$('#ecg').get(0);
            pdf.addHTML(printHtml,15,15,options,function(){
                pdf.output('report_pdf_' + new Date().getTime()+'.pdf')
            })
        }
    }
    //    function download(){
    //        html2canvas($("#ecg"), {
    //            onrendered: function (canvas) {
    //                var imgData = canvas.toDataURL(
    //                        'image/png');
    //                var doc = new jsPDF('p', 'mm');
    //                doc.addImage(imgData, 'PNG', 10, 10);
    //                doc.save('sample-file.pdf');}});}

    //                var img=new Image();
    //                img.src=imgData;
    //                img.onload=function(){
    //                    if (this.width > this.height) {
    //                              var doc = new jsPDF('l', 'mm', [this.width * 0.225, this.height * 0.225]);
    //                             } else {
    //                                var doc = new jsPDF('p', 'mm', [this.width * 0.225, this.height * 0.225]);
    //                              }
    //                          doc.addImage(imgData, 'jpeg', 0, 0, this.width * 0.225, this.height * 0.225);
    //                           //根据下载保存成不同的文件名
    //                          doc.save('report_pdf_' + new Date().getTime() + '.pdf');
    //                }
    //            },
    //            background:"#fff",
    //            allowTaint:true

</script>
</body>
</html>
