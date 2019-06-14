<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高校选课管理系统</title>
<link href="Style.css" type="text/css" rel="stylesheet" />
</head>
<body>
<%
String tno = request.getParameter("tno");
%>
<h1 style="text-align:center">欢迎你，教师<%=tno%></h1>
<p style="text-align:center"><a href="SCteaop.jsp?tno=<%=tno%>">返回上一页</a></p>
    <%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/shiyan7?serverTimezone=GMT&useUnicode"  //地址
            + "=true&characterEncoding=utf-8&useSSL=false";
    Connection connection  = (Connection) DriverManager.getConnection(url,"student","123456");
    Statement statement = (Statement) connection.createStatement();  //连接实例
    %>
    <style>
		table {
			margin:0 auto;
		}
	</style>
    <h1 style="text-align:center">课程</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
    <style>
		td {
			text-align:center;
		}
	</style>
        <tr>
            <th>课程编号</th>
            <th>教师编号</th>
            <th>课程名字</th>
            <th>学时</th>
            <th>学分</th>
            <th>课程介绍</th>
            <th>操作</th>
        </tr>
        <% 
        String sql1 = "SELECT * FROM Course";
        ResultSet rs1 = statement.executeQuery(sql1);
        while(rs1.next()) {
        	String c_id = rs1.getString("c_id");
        	String t_id = rs1.getString("t_id");
            String c_name = rs1.getString("c_name");
            String c_hours = rs1.getString("c_hours");
            String credit = rs1.getString("credit");
            String c_introduction = rs1.getString("c_introduction"); 
        %>
        	<tr>
        		<td><%= c_id%></td>
				<td><%= t_id%></td>
            	<td><%= c_name%></td>
            	<td><%= c_hours%></td>
            	<td><%= credit%></td>
            	<td><%= c_introduction%></td>
        	</tr>
        <%
        }
        rs1.close();
        %>
    </table>
    <h1 style="text-align:center">教授课程</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
    <style>
		td {
			text-align:center;
		}
	</style>
        <tr>
            <th>课程编号</th>
            <th>教师编号</th>
            <th>课程名字</th>
            <th>学时</th>
            <th>学分</th>
            <th>课程介绍</th>
            <th>操作</th>
        </tr>
        <% 
        String sql2 = "SELECT * FROM Course WHERE t_id='"+tno+"';";
        ResultSet rs2 = statement.executeQuery(sql2);
        while(rs2.next()) {
        	String c_id = rs2.getString("c_id");
        	String t_id = rs2.getString("t_id");
            String c_name = rs2.getString("c_name");
            String c_hours = rs2.getString("c_hours");
            String credit = rs2.getString("credit");
            String c_introduction = rs2.getString("c_introduction"); 
        %>
        	<tr>
        		<td><%= c_id%></td>
				<td><%= t_id%></td>
            	<td><%= c_name%></td>
            	<td><%= c_hours%></td>
            	<td><%= credit%></td>
            	<td><%= c_introduction%></td>
        	</tr>
        <%
        }
        rs2.close();
        %>
    </table>

         <p style="text-align:center"><a href="SCteaop.jsp?sno=<%=tno%>">返回上一页</a></p>
        <br>       
</body>
</html>