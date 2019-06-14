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
String sno = request.getParameter("sno");
%>
<h1 style="text-align:center">欢迎你，学生<%=sno%></h1>
<p style="text-align:center"><a href="SCstuop.jsp?sno=<%=sno%>">返回上一页</a></p>
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
            	<td><a href='SCstu_Selection.jsp?sno=<%=sno%>&c_id=<%=c_id%>'style="cursor:hand;">选课</a></td>
        	</tr>
        <%
        }
        rs1.close();
        %>
    </table>

    <h1 style="text-align:center">已选课程</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
        <tr>
            <th>课程号</th>
            <th>学号</th>
            <th>成绩</th>
        </tr>
        <% 
        String sql2 = "SELECT * FROM Selection WHERE Stu_s_id='"+sno+"';";   
        ResultSet rs2 = statement.executeQuery(sql2);
        while(rs2.next()) {
            String Cou_c_id = rs2.getString("Cou_c_id");
            String Stu_s_id = rs2.getString("Stu_s_id");
            String grade = rs2.getString("grade");
        %>
        <tr>
            	<td><%= Cou_c_id%></td>
            	<td><%= Stu_s_id%></td>
            	<td><%= grade%></td>
            	<td><a href='SCstu_selection_delete.jsp?sno=<%=sno%>&c_id=<%=Cou_c_id%>&sgc=11'style="cursor:hand;">退课</a></td>
        </tr>
        <%
        }
        rs2.close();
        %>
        </table>
         <p style="text-align:center"><a href="SCstuop.jsp?sno=<%=sno%>">返回上一页</a></p>
        <br>       
</body>
</html>