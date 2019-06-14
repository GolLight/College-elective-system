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
     String s_idnew = request.getParameter("s_idnew");
     //String t_namenew = request.getParameter("t_namenew");
     String s_namenew = new String(request.getParameter("s_namenew").getBytes("iso-8859-1"), "utf-8");
    	String m_idnew = request.getParameter("m_idnew");
     String s_sexnew = new String(request.getParameter("s_sexnew").getBytes("iso-8859-1"), "utf-8");
     //String t_sexnew = request.getParameter("t_sexnew");
     String s_passwordnew = request.getParameter("s_passwordnew");
     String s_birthdaynew = request.getParameter("s_birthdaynew");
     //String zcnew = request.getParameter("zcnew");
     //String zcnew = new String(request.getParameter("zcnew").getBytes("iso-8859-1"), "utf-8");
     Statement statement = (Statement) connection.createStatement();
	String sql = "update teacher set s_name ='"+s_namenew+"', s_sex ='"+s_sexnew+"', s_password ='"+s_passwordnew+/*"', t_birthday ='"+t_birthdaynew+*/"' where s_id ="+s_idnew+";";
	//out.print("wno="+wno);
	//out.print(sql);
	//statement.executeUpdate(sql);
	statement.close();
	connection.close();
	out.print("更新完成！");
     %>
     <p style="text-align:center"><a href="SCrootusermanager.jsp?wno=<%=wno%>">返回上一页</a></p>
</body>
</html>