<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/12
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%--
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.zyf.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登陆-心狗健康信息管理系统</title>
    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login/font-awesome.min.css">
    <link rel="stylesheet" href="css/login/form-elements.css">
    <link rel="stylesheet" href="css/login/style.css">
    <link rel="stylesheet" href="css/sweet-alert.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->


    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="images/login/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/login/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/login/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/login/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/login/apple-touch-icon-57-precomposed.png">
    <script type="text/javascript">
        function refresh() {
            //IE存在缓存,需要new Date()实现更换路径的作用
            document.getElementById("image").src = "./enterimage.jsp?" + new Date();
        }
        function login(form) {
            if (form.uname.value == "") {
                alert({title:"警告",text:"用户不能为空！",type:"warning"});
                return false;
            }
            if (form.passwd.value == "") {
                alert({title:"警告",text:"密码不能为空！",type:"warning"});
                return false;
            }
        }
    </script>

</head>

<body>
<%
    User user=(User)session.getAttribute("user");
    if (user!=null){
%>
<script>
    $(document).ready(function() {
        alert({title:"提示",text:"您已登录，请退出当前账户！",type:"warning"});
    });
    window.location.href="homepage.jsp";
</script>
<%
    }
    String info = (String) request.getAttribute("info");
    if (info != null) {
%>
<script>
    var infos = "<%=info %>";
    $(document).ready(function() {
        alert({title:"错误",text:infos,type:"warning"});
    })
</script>
<%
    }
%>
<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Welcome!</strong></h1>
                    <!--<div class="description">
                        <p>
                            登陆后您可以查看个人心电图、医疗报告等信息。
                            关于心狗：<a href="http://www.heart-watchdog.com/"><strong>访问官网</strong></a>
                        </p>
                    </div>-->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>欢迎登录心狗健康信息管理系统</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form action="UserServlet?action=enter" method="post" class="login-form"
                              onSubmit="return login(this);">
                            <div class="form-group">
                                <input type="text" name="uname" placeholder="请输入用户名..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="passwd" placeholder="请输入密码..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="text" name="code" placeholder="请输入验证码..."
                                       class="form-username form-control">
                            </div>
                            <div>
                                <img id="image" border="0" onclick="refresh()" src="enterimage.jsp" title="点击更换图片">
                            </div>
                            <div class="checkbox">
                                <label class="checkbox-inline">
                                    <input type="radio" name="status" value="用户" checked> 用户
                                </label>
                                <lable class="checkbox-inline">
                                    <input type="radio" name="status" value="医生"> 医生
                                </lable>
                                <span style="float: right;"><a href="#" target="_blank">忘记密码？</a></span>
                            </div>
                            <button type="submit" class="btn" >登录</button><br>
                            <button type="button" onclick="javascript:window.location.href='register.jsp';" class="btn">还没有账号?马上注册</button>
                            &lt;%&ndash;<input type="button" value="注    册" onclick="javascript:window.location.href='register.jsp';"
                                   class="btn">&ndash;%&gt;
&lt;%&ndash;
                            <a class="btn" href="register.jsp" role="button">还没有账号?马上注册</a>
&ndash;%&gt;
                        </form>
                    </div>
                </div>
            </div>
            &lt;%&ndash;
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3 social-login">
                                <h3>...or login with:</h3>
                                <div class="social-login-buttons">
                                    <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                                        <i class="fa fa-facebook"></i> Facebook
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                        <i class="fa fa-twitter"></i> Twitter
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                        <i class="fa fa-google-plus"></i> Google Plus
                                    </a>
                                </div>
                            </div>
                        </div>
            &ndash;%&gt;
        </div>
    </div>
</div>


<!-- Javascript -->

    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.backstretch.min.js"></script>
    <script src="js/scripts.js"></script>
    <script src="js/sweet-alert.min.js"></script>
&lt;%&ndash;<script>
    function refresh() {
        //IE存在缓存,需要new Date()实现更换路径的作用
        document.getElementById("image").src = "./enterimage.jsp?" + new Date();
    }
    function login(form) {
        if (form.uname.value == "") {
            swal({title:"警告",text:"用户不能为空！",type:"warning"});
            return false;
        }
        if (form.passwd.value == "") {
            swal({title:"警告",text:"密码不能为空！",type:"warning"});
            return false;
        }
    }
</script>&ndash;%&gt;
<div class="showcase normal">
    <h4>Normal alert</h4>
    <button>Show error message</button>
    <h5>Code:</h5>
    <pre><span class="func">alert</span>(<span class="str">"Oops... Something went wrong!"</span>);

	</pre>

    <div class="vs-icon"></div>
</div>

<div class="showcase sweet">
    <h4>Sweet Alert</h4>
    <button>Show error message</button>

    <h5>Code:</h5>
    <pre>sweetAlert(<span class="str">"Oops..."</span>, <span class="str">"Something went wrong!"</span>, <span class="str">"error"</span>);</pre>
</div>
<script>document.querySelector('.showcase.sweet button').onclick = function(){
    swal({title:"警告",text:"密码不能为空！",type:"warning"});
};
</script>

</body>

</html>--%>
<%@ page import="com.zyf.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户登陆-心狗健康信息管理系统</title>
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

<body onload="tishi()">
<%
    int tishi1;
    User user=(User)session.getAttribute("user");
    if (user!=null){
        tishi1=1;}
    else{
        tishi1=0;
    }
%>
<input id="tishi1" type="hidden" value="<%=tishi1%>" >
<%
    String info = (String) request.getAttribute("info");
    if(info!=null&&! info.equals("")){
%>
<%--
这里对info进行处理，否则info为空时，value=null后面js中数据类型出错
--%>
<input id="tishi2" type="hidden" value=<%=info%>>
<%}else{%>
    <input id="tishi2" type="hidden">
<%}%>
<!-- Top content -->
<div class="top-content">

    <div class="inner-bg">
        <div class="container">
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text">
                    <h1><strong>Welcome!</strong></h1>
                    <!--<div class="description">
                        <p>
                            登陆后您可以查看个人心电图、医疗报告等信息。
                            关于心狗：<a href="http://www.heart-watchdog.com/"><strong>访问官网</strong></a>
                        </p>
                    </div>-->
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-sm-offset-3 form-box">
                    <div class="form-top">
                        <div class="form-top-left">
                            <h3>欢迎登录心狗健康信息管理系统</h3>
                        </div>
                        <div class="form-top-right">
                            <i class="fa fa-lock"></i>
                        </div>
                    </div>
                    <div class="form-bottom">
                        <form action="UserServlet?action=enter" method="post" class="login-form"
                              onSubmit="return login(this);" >
                            <div class="form-group">
                                <input type="text" name="uname" placeholder="请输入用户名..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="password" name="passwd" placeholder="请输入密码..."
                                       class="form-username form-control">
                            </div>
                            <div class="form-group">
                                <input type="text" name="code" placeholder="请输入验证码..."
                                       class="form-username form-control">
                            </div>
                            <div>
                                <img id="image" border="0" onclick="refresh()" src="enterimage.jsp" title="点击更换图片">
                            </div>
                            <div class="checkbox">
                                <label class="checkbox-inline">
                                    <input type="radio" name="status" value="用户" checked> 用户
                                </label>
                                <lable class="checkbox-inline">
                                    <input type="radio" name="status" value="医生"> 医生
                                </lable>
                                <span style="float: right;"><a href="#" target="_blank">忘记密码？</a></span>
                            </div>
                            <button type="submit" class="btn" >登录</button><br>
                            <button type="button" onclick="javascript:window.location.href='register.jsp';" class="btn">还没有账号?马上注册</button>
                            <%--<input type="button" value="注    册" onclick="javascript:window.location.href='register.jsp';"
                                   class="btn">--%>
                            <%--
                                                        <a class="btn" href="register.jsp" role="button">还没有账号?马上注册</a>
                            --%>
                        </form>
                    </div>
                </div>
            </div>
            <%--
                        <div class="row">
                            <div class="col-sm-6 col-sm-offset-3 social-login">
                                <h3>...or login with:</h3>
                                <div class="social-login-buttons">
                                    <a class="btn btn-link-1 btn-link-1-facebook" href="#">
                                        <i class="fa fa-facebook"></i> Facebook
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-twitter" href="#">
                                        <i class="fa fa-twitter"></i> Twitter
                                    </a>
                                    <a class="btn btn-link-1 btn-link-1-google-plus" href="#">
                                        <i class="fa fa-google-plus"></i> Google Plus
                                    </a>
                                </div>
                            </div>
                        </div>
            --%>
        </div>
    </div>
</div>


<!-- Javascript -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.backstretch.min.js"></script>
<script src="js/scripts.js"></script>
<script src="js/sweet-alert.min.js"></script>
<script type="text/javascript">
    function refresh() {
        //IE存在缓存,需要new Date()实现更换路径的作用
        document.getElementById("image").src = "./enterimage.jsp?" + new Date();
    }
    function login(form) {
        if (form.uname.value == "") {
            swal({title:"警告",text:"用户不能为空！",type:"warning"});
            return false;
        }
        if (form.passwd.value == "") {
            swal({title:"警告",text:"密码不能为空！",type:"warning"});
            return false;
        }
        if (form.code.value == "") {
            swal({title:"警告",text:"验证码不能为空！",type:"warning"});
            return false;
        }
    }
    function tishi(){
        var a=document.getElementById("tishi1").value;
        var b=document.getElementById("tishi2").value;
        if(a==1){
            swal({title:"提示",text:"您已登录，请退出当前账户！",type:"warning"});
            window.location.href="homepage.jsp";
        }else{
            if(b===null||b==''){}
            else{
                swal({title:"提示",text:b,type:"warning"});
            }
        }
    }
</script>


</body>

</html>
