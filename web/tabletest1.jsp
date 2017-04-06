<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/28
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<!DOCTYPE html>
<html lang="en">
<head>

    <!-- Basic -->
    <meta charset="UTF-8" />

    <title>Dashboard | Nadhif - Responsive Admin Template</title>

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.css">

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/bootstrap-table.min.js"></script>

    <!-- Latest compiled and minified Locales -->
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.1/locale/bootstrap-table-zh-CN.min.js"></script>


</head>
<body>



<div class="col-md-offset-3 col-md-6">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title text-center">已添加教师账号</h3>
        </div>
        <div class="panel-body">
            <div id="toolbar" class="btn-group">
                <button id="btn_edit" type="button" class="btn btn-default" >
                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                </button>
                <button id="btn_delete" type="button" class="btn btn-default">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                </button>
            </div>

        </div>
    </div>
</div>

<table id="teacher_table" data-toggle="table" data-url="data1.json" data-method="post"
       data-query-params="queryParams"
       data-toolbar="#toolbar"
       data-pagination="true"
       data-search="true"
       data-show-refresh="true"
       data-show-toggle="true"
       data-show-columns="true"
       data-page-size="5"
       data-striped="true">
    <thead>
    <tr>
        <th data-field="id">用户账号</th>
        <th data-field="name">用户密码</th>
        <th data-field="price">教师姓名</th>
    </tr>
    </thead>
</table>
<%--<script>--%>
    <%--var mydata = '{"employees":[' +--%>
            <%--'{"name":"John","pwd":"Doe","t_name":"John"},' +--%>
            <%--'{"name":"John","pwd":"Doe","t_name":"John"},' +--%>
            <%--'{"name":"John","pwd":"Doe","t_name":"John"},' +--%>
            <%--'{"name":"John","pwd":"Doe","t_name":"John"}]}';--%>

    <%--//    obj = JSON.parse(txt);--%>
    <%--//--%>
    <%--//    document.getElementById("fname").innerHTML=obj.employees[1].firstName--%>
    <%--//    document.getElementById("lname").innerHTML=obj.employees[1].lastName--%>
<%--</script>--%>

</body>

</html>