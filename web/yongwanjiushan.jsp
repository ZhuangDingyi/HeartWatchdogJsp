<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/14
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>wu</title>
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">


</head>
<body onload="tishi()">

    <input id="tishi1" type="button" value="1">
    <input id="tishi2" type="button" >
<script>function tishi(){
    var a=document.getElementById("tishi1").value;
    var b=document.getElementById("tishi2").value;
    if(a==1){
        swal({title:"提示",text:"您已登录，请退出当前账户！",type:"warning"});
        window.location.href="homepage.jsp";
    }else{
        if(b==''){}
        else{
            swal({title:"提示2",text:b,type:"warning"});
        }
    }
}</script>
    <script src="js/sweet-alert.min.js"></script>
</body>
</html>
