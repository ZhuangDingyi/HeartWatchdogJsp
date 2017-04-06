<%--
  Created by IntelliJ IDEA.
  User: HASS-PC
  Date: 2017/4/3
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>jQuery Editable Select - A simple jQuery Plugin that converts a select into an text field with suggestions.</title>
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/9.6.0/styles/mono-blue.min.css">-->
    <link href="css/jquery-editable-select.min.css" rel="stylesheet">
</head>
<body>

<form>
<select id="why123" class="form-control">
    <option>Alfa Romeo</option>
    <option>Audi</option>
    <option>BMW</option>
    <option>Citroen</option>
</select>
</form>

<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/bootstrap.min.js"></script>
<!--<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>-->
<!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>-->
<script src="js/jquery-editable-select.min.js"></script>
<script>
    $("#why123").editableSelect();
</script>
</body>
</html>
