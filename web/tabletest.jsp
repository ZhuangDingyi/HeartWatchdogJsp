<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/28
  Time: 20:10
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

<table id="table"></table>

<script>

    $('#table').bootstrapTable({
        url: 'data1.json',
        queryParams:"queryParams",
        toolbar:"#toolbar",
        pagination: true,
//        sidePagination: "server",
        sidePagination:"true",
        search:"true",
        showRefresh:"true",
        showToggle:"true",
        showColumns:"true",
        pageSize:"5",
        columns: [{
            field: 'id',
            title: 'Item ID'
        }, {
            field: 'name',
            title: 'Item Name'
        }, {
            field: 'price',
            title: 'Item Price'
        }, ]
    });

    <!--$('#table').bootstrapTable({-->
    <!--columns: [{-->
    <!--field: 'id',-->
    <!--title: 'Item ID'-->
    <!--}, {-->
    <!--field: 'name',-->
    <!--title: 'Item Name'-->
    <!--}, {-->
    <!--field: 'price',-->
    <!--title: 'Item Price'-->
    <!--}],-->
    <!--data: [{-->
    <!--id: 1,-->
    <!--name: 'Item 1',-->
    <!--price: '$1'-->
    <!--}, {-->
    <!--id: 2,-->
    <!--name: 'Item 2',-->
    <!--price: '$2'-->
    <!--}]-->
    <!--});-->

</script>

</body>
</html>

