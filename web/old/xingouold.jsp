<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2016/12/5
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>心狗健康信息查询系统</title>
    <style>
        body {
            margin: 0 200px 0 200px
        }
    </style>
</head>
<frameset rows="125,600,100" frameborder="0">
    <frame src="xingou_head.jsp" name="topframe" scrolling="no" noresize>
    <frameset cols="349,*" frameborder="0">
        <frame src="xingou_left.jsp" name="leftframe" scrolling="no" noresize>
        <frame src="xingou_main.jsp" name="mainframe">
    </frameset>
    <frame src="xingou_foot.jsp" name="footframe" scrolling="no" noresize>
</frameset>
</html>
