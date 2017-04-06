<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/1
  Time: 20:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript">
        function test(){
            $.ajax({
                        type:"POST", //请求方式
                        url:"TestJson",//请求路径
                        cache: false,
//                   data:"id=1", //传参
            dataType: 'json',//返回值类型
                    success:function(json){
//                alert(json[1].username+" "+ json[1].password);//弹出返回过来的List对象
                        alert(json[0].read)
            }
        });
        }
    </script>
</head>
<body>
    <input type="button" name="b" value="测试" onclick="test()">
</body>
</html>
