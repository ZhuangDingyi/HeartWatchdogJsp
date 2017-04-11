<!DOCTYPE html>
<html>
<head>
    <!-- Custom styles for this template -->
    <meta charset="UTF-8">
    <link href="css/sweet-alert.css" rel="stylesheet">
</head>
<body>
<input type="button" name="Submit2" value="确 定" class="btn" onclick="location.href='sweetalert.html'" />
<button onclick="location.href='RelaServlet?action=RelaList#demoTab4'">点此返回</button>
<a class="btn" href="RelaServlet?action=RelaList#demoTab4" role="button" >点此返回</a>
<script src="js/jquery-3.1.1.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="js/sweet-alert.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        swal({
            type:"success",
            title: "提示消息",
            text: '<a href="RelaServlet?action=RelaList#demoTab4" role="button"><font size="5" color="green"> 点此返回</font></a>。<br>5秒后自动返回。',
            animation:"slide-from-top",
            html: true,
            timer: 5000,
            showConfirmButton: false
        });
    })
    window.onload = function(){
        setTimeout(fun,5000);
    }

    function fun(){
        window.location="register.jsp"
    }
    function tishi(){
        swal({
            type:"success",
            title: "提示消息",
//            text: '<input type="button" name="Submit2" value="确 定" class="btn" onclick="location.href=\'sweetalert.html\'" /><br/>5秒后自动关闭。',
//            显示不出来按钮
//            text: '<button onclick="location.href=\'RelaServlet?action=RelaList#demoTab4\'">点此返回</button><br/>5秒后自动关闭。',
//显示按钮，但点击不跳转
            text: '<a href="RelaServlet?action=RelaList#demoTab4" role="button"><font size="5" color="green"> 点此返回</font></a>。<br>5秒后自动关闭。',
//显示链接，能跳转，但是没有按钮效果
//            confirmButtonText:'<a href="RelaServlet?action=RelaList#demoTab4">点此返回</a>',
            animation:"slide-from-top",
//            imageUrl: "images/logo.jpg",
            html: true,
//            timer: 5000,
            showConfirmButton: false
        });
//        var t=setTimeout(window.location.href = "register.jsp",30000)
    }

</script>
</body>
</html>