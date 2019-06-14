<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录跳转中</title>
<link href="Style.css" type="text/css" rel="stylesheet" />
</head>
<body>
     <% 
     Class.forName("com.mysql.cj.jdbc.Driver");                   //加载jdbc驱动  
     String url = "jdbc:mysql://localhost:3306/shiyan7?serverTimezone=GMT&useUnicode"  //地址
             + "=true&characterEncoding=utf-8&useSSL=false";
     Connection connection  = (Connection) DriverManager.getConnection(url,"student","123456");  
     String tno = request.getParameter("tno");
     String tpass = request.getParameter("tpass");
     Statement statement = (Statement) connection.createStatement();  
     String query = "SELECT * FROM Teacher where t_id='"+tno+"';";
     ResultSet result = statement.executeQuery(query); 
     %>
     <h1 style="text-align:center">登陆中</h1>
     <p style="text-align:center"> 
        <%
           if(result.next()){
        	   if(tpass.equals(result.getString("t_password")))
        	   {
        		   statement.close();
        	   	   connection.close();
        	   		out.println("验证通过，请点击确定跳转!");%>
        	   <p style="text-align:center"><a href="SCteaop.jsp?tno=<%=tno%>">确定</a></p>
               <%   
        	   }
        	   else
        	   {
        		   	statement.close();
        	   	   	connection.close();
        	   		out.println("密码错误！！！！");
        	   	%>
        	   		<p style="text-align:center"><a href="SCtealogin.jsp">返回登录界面</a></p>
               <% 
        	   }
    	   		
           }
           else {
    	   		statement.close();
     	   		connection.close();
     	   		out.println("无此用户！！！");
     	   	%>
     	   	
     	   <p style="text-align:center"><a href="SCtealogin.jsp">返回登录界面</a></p>
        <%   /*response.sendRedirect("SCrootlogin.jsp");*/
           }
        %>
     <br>
     </p>
</body>
</html>