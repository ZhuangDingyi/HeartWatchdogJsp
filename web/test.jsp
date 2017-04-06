<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/11
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>专供测试</title>
</head>
<body>
<%
    String name0 = request.getParameter("startdate");
    String name = request.getParameter("enddate");
%>
<p>欢迎来到<%=name0%>
<p>欢迎来到<%=name%>
</p>
<p id="test">123</p>
<button id="test123">button</button>
<script type="text/javascript" src="js/jquery-3.1.1.js" charset="UTF-8"></script>
<script>
    $("#test123").click(function(){
        alert($("#test").text())
    })
</script>
</body>
</html>
