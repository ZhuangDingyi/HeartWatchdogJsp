<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2017/2/11
  Time: 20:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="com.jspsmart.upload.SmartUpload" %>
<%@ page import="com.zyf.FileBean" %>
>
<html>
<head>
    <title>文件下载</title>
</head>
<body>
<%
    try {
        response.reset();
        out.clear();
        out = pageContext.pushBody();
        SmartUpload upfile = new SmartUpload();
        upfile.initialize(pageContext);
        upfile.setContentDisposition(null);
        FileBean filebean = (FileBean) request.getAttribute("filesingle");
        String file = request.getSession().getServletContext().getRealPath("\\") + filebean.getFileAddr();
        System.out.println(file);
        upfile.downloadFile(file);
    } catch (Exception e) {
        out.println("<script>alert('文件下载失败'')</script>");
    }
%>
</body>
</html>





