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
String sno = request.getParameter("sno");
%>
<h1 style="text-align:center">欢迎你，学生<%=sno%></h1>
<h1 style="text-align:center">学生界面</h1>
<p style="text-align:center"><a href="SCstu_course.jsp?sno=<%=sno%>">选课退课</a></p>
<p style="text-align:center"><a href="SCop.jsp">待定</a></p>
<p style="text-align:center"><a href="SCop.jsp">待定</a></p>
<p style="text-align:center"><a href="SCop.jsp">返回</a></p>
</body>
</html>