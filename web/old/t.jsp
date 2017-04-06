<%@ page import="com.zyf.User" %><%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/11
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>test</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<form action="../test.jsp" method="post">
    <table>
        <tr>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
        </tr>
    </table>
</form>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <form role="form">
                <div class="form-group">
                    <label for="exampleInputEmail1">Email address</label><input type="email" class="form-control"
                                                                                id="exampleInputEmail1"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label><input type="password" class="form-control"
                                                                              id="exampleInputPassword1"/>
                </div>
                <div class="form-group">
                    <label for="exampleInputFile">File input</label><input type="file" id="exampleInputFile"/>
                    <p class="help-block">
                        Example block-level help text here.
                    </p>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox"/>Check me out</label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
        </div>
    </div>
</div>
<%
    User user = (User) session.getAttribute("user");
    System.out.println(user.getUname());
%>
<%=user.getUname()%>
</body>
</html>
