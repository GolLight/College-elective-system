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
     Class.forName("com.mysql.cj.jdbc.Driver");                   //加载jdbc驱动  
     String url = "jdbc:mysql://localhost:3306/shiyan7?serverTimezone=GMT&useUnicode"  //地址
             + "=true&characterEncoding=utf-8&useSSL=false";
     Connection connection  = (Connection) DriverManager.getConnection(url,"student","123456");  
     String wno = request.getParameter("wno");//传递管理员编号
     String s_id = request.getParameter("s_id");
     Statement statement = (Statement) connection.createStatement();
	String sql = "DELETE FROM Student where s_id ="+s_id+";";
	//out.print(sql);
	statement.execute(sql);
	statement.close();
	connection.close();
	out.print("更新完成！");
     %>
     <p style="text-align:center"><a href="SCrootusermanager.jsp?wno=<%=wno%>">返回上一页</a></p>
</body>
</html>