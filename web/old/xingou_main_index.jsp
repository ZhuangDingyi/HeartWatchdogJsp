<%--
  Created by IntelliJ IDEA.
  User: viczyf
  Date: 2016/12/5
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>

<!-- ����response.jsp�ļ� -->
<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@ page import="javax.servlet.http.Cookie,java.util.Arrays" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Title</title>
</head>
<title></title>
<body>
<h2>ʹ��Cookies������</h2>
<%
    String userName;
    userName = request.getRemoteAddr(); //��ȡ�ͻ��˵�IP
    Cookie cookie_response = null;
    Cookie[] cookie = request.getCookies();  //��ȡ�ͻ����ϻ������е�cookie
    out.println("<b>��ǰʱ�䣺</b>" + new java.util.Date() + "<br><br>");//��ӡ��ǰ�ķ���ʱ��
    if (cookie == null) //�ͻ����ϻ�û��cookie
    {
        out.println("<font color=#FF0000>���ǵ�һ�η��ʴ�ҳ����ӭ��ˣ�</font>");
        //����һ����Ϊ���ͻ���IP_access_time����cookie���������б��浱ǰʱ�䡣
        cookie_response = new Cookie(userName + "_access_time", new java.util.Date().toString());
        //����Cookies������
        response.addCookie(cookie_response);
        response.setContentType("text/html");
        response.flushBuffer();
        return;
    }
    List list = Arrays.asList(cookie);
    Iterator it = list.iterator();
//����ѻ�ȡ������cookies�����������Ϊ���ͻ���IP_access_time����cookies����˵�����û���ǰ�Ѿ����ʹ���ҳ�棬����cookie�����ڱ���cookie_response��
    while (it.hasNext()) {
        Cookie temp = (Cookie) it.next();
        if (temp.getName().equals(userName + "_access_time")) {
            cookie_response = temp;
            break;
        }
    }
    if (cookie_response != null)  //���cookie_response��Ϊnull�����ʾ��ǰ�Ѿ����ʹ�
    {
        out.println("<b>�ϴη���ʱ�䣺</b>" + cookie_response.getValue()); //��ӡ�ϴεķ���ʱ��
        cookie_response.setValue(new Date().toString());     //����cookie�е�ʱ������Ϊ��ǰʱ��
    } else  //�����ǰû�з��ʹ���ҳ�棬�򴴽�һ����Ϊ���ͻ���IP_access_time����cookie���������б��浱ǰʱ�䡣
    {
        cookie_response = new Cookie(userName + "_access_time", new java.util.Date().toString());
    }
//���õ�ǰ��response������Cookies������
    response.addCookie(cookie_response);
    response.setContentType("text/html");
    response.flushBuffer();
%>
</body>
</html>
