<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/14
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>测试sweetalert在jsp中的表现</title>
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login/font-awesome.min.css">
    <link rel="stylesheet" href="css/login/form-elements.css">
    <link rel="stylesheet" href="css/login/style.css">
    <link href="//cdn.bootcss.com/sweetalert/1.1.3/sweetalert.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="images/login/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/login/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/login/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/login/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/login/apple-touch-icon-57-precomposed.png">


</head>
<body>
<h1>yes</h1>

<div class="showcase sweet">
    <h4>Sweet Alert</h4>
    <button>Show error message</button>

    <h5>Code:</h5>
    <pre>sweetAlert(<span class="str">"Oops..."</span>, <span class="str">"Something went wrong!"</span>, <span class="str">"error"</span>);</pre>
</div>
<script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/sweet-alert.min.js"></script>
    <script>
    $(document).ready(function(){
    swal("您好，欢迎来到Jquery！");
    })
    document.querySelector('.showcase.sweet button').onclick = function(){
        swal({title:"警告",text:"密码不能为空！",type:"warning"});
    };
    </script>
</body>
</html>
