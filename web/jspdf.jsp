<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/3/23
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>实验jspdf</title>
    <script src="//cdn.bootcss.com/jspdf/1.3.3/jspdf.debug.js"></script>

</head>
<body>
    <button id="download" class="button" onclick="download()">123</button>
    <script>
        function download(){
            var doc = new jsPDF()

            doc.text('Hello world!', 10, 10)
            doc.save('a4.pdf')
        }
    </script>
</body>

</html>
