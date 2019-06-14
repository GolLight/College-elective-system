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
String wno = request.getParameter("wno");
%>
<h1 style="text-align:center">欢迎你，管理员<%=wno%></h1>
<p style="text-align:center"><a href="SCrootop.jsp?wno=<%=wno%>">返回上一页</a></p>
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
    <h1 style="text-align:center">学生选课</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
        <tr>
            <th>课程号</th>
             <th>课程名</th>
            <th>学号</th>
            <th>成绩</th>
        </tr>
        <% 
        String sql2 = "SELECT c_id,c_name,Stu_s_id,grade FROM Selection,Course WHERE Cou_c_id = c_id;";   
        ResultSet rs2 = statement.executeQuery(sql2);
        while(rs2.next()) {
            String Cou_c_id = rs2.getString("c_id");
            String c_name = rs2.getString("c_name");
            String Stu_s_id = rs2.getString("Stu_s_id");
            String grade = rs2.getString("grade");
        %>
        <tr>
            	<td><%= Cou_c_id%></td>
            	<td><%= c_name%></td>
            	<td><%= Stu_s_id%></td>
            	<td><%= grade%></td>
            	<td><a href='SCroot_selectionEdit.jsp?wno=<%=wno%>&Cou_c_id=<%=Cou_c_id%>&Stu_s_id="<%=Stu_s_id%>"'style="cursor:hand;">删除</a></td>
        </tr>
        <%
        }
        rs2.close();
        statement.close();
        connection.close();
        %>
        </table>
         <p style="text-align:center"><a href="SCrootop.jsp?wno=<%=wno%>">返回上一页</a></p>
        <br>       
</body>
</html>