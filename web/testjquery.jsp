<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/2
  Time: 21:00
  To change this template use File | Settings | File Templates.
  测试jquery
--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>

<body>
<p id="test1">这是段落。</p>
<p id="test2">这是另一个段落。</p>
<p id="my">
<p>Input field: <input type="text" id="test3" value="Mickey Mouse"></p>
<button id="btn1">设置文本</button>
<button id="btn2">设置 HTML</button>
<button id="btn3">设置值</button>
<script type="text/javascript" src="js/jquery-3.1.1.js" charset="UTF-8"></script>
<script>

        $("#btn1").click(function(){
            $("#test1").text("Hello world!");
        });
        $("#btn2").click(function(){
            $("#test2").html("<b>Hello world!</b>");
        });
        $("#btn3").click(function(){
            $("#test3").val("Dolly Duck");
        });

</script>
</body>
</html>
