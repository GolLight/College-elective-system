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
     String tno = request.getParameter("tno");//传递编号
     String Cou_c_id = request.getParameter("Cou_c_id");
     String Stu_s_id = request.getParameter("Stu_s_id");
     Statement statement = (Statement) connection.createStatement();
     String sql2 = "SELECT c_id,c_name,Stu_s_id,grade FROM Selection,Course WHERE Cou_c_id = c_id and Cou_c_id='"+Cou_c_id+"' and Stu_s_id ="+Stu_s_id+" and t_id='"+tno+"';";
     //out.print(sql2);
     ResultSet rs1 = statement.executeQuery(sql2);
    	 
     if(rs1.next()){
         String c_name = rs1.getString("c_name");
    	 String grade = rs1.getString("grade");
         
     %>
<form action="SCtea_selectionupdate.jsp">
	<table  width="100%" border="1" cellpadding="0.5" cellspacing="0.5">
		    <style>
				td {
					text-align:center;
				}
			</style>
        <tr>
            <th>课程编号号</th>
            <th>课程名</th>
            <th>学号</th>
            <th>成绩</th>
			<th>教师编号</th>
        </tr>
     <tr>
        		<td><%= Cou_c_id%></td>
				<td><%= c_name%></td>
            	<td><%= Stu_s_id%></td>
            	<td><%= grade%></td>
            	<td><%= tno%></td>
     </tr>
     <tr>
        		<td><input type="text" id="Cou_c_idnew" maxlength='15' name = "Cou_c_idnew" value ="<%=Cou_c_id%>"/>
        		<td><%= c_name%></td>
				<td><input type="text" id="Stu_s_idnew" maxlength='15' name = "Stu_s_idnew" value =<%=Stu_s_id%>/>
            	<td><input type="text" id="gradenew" maxlength='9' name = "gradenew"/>
            	<td><input type="text" id="tno" maxlength='15' name = "tno" value ="<%=tno%>"/>
     </tr>

     </table> 
     <p style="text-align:center"> <input type="submit" value="更新"></td></tr>
     <p style="text-align:center"> <input type="reset" value="重置"></td></tr>
</form>  
     <br>
	<%
	}
	%>
     <p style="text-align:center"><a href="SCtea_Selection.jsp?tno=<%=tno%>">返回上一页</a></p>
</body>
</html>