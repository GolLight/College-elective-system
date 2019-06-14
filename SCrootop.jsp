<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校选课系统</title>
<link href="Style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%
String wno = request.getParameter("wno");
%>
<h1 style="text-align:center">欢迎你，管理员<%=wno%></h1>
<%request.setAttribute("wno",wno); %>

<h1 style="text-align:center">管理界面</h1>
<p style="text-align:center"><a href="SCrootusermanager.jsp?wno=<%=wno%>">用户管理</a></p>
<p style="text-align:center"><a href="SCroot_course.jsp?wno=<%=wno%>">课程管理</a></p>
<p style="text-align:center"><a href="SCroot_Selection.jsp?wno=<%=wno%>">选课管理</a></p>
<p style="text-align:center"><a href="SCop.jsp">返回</a></p>
</body>
</html>