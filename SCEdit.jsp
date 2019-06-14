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
     String id_E = request.getParameter("id_E");
     String sgc = request.getParameter("sgc");
     //out.println(id_E);
     //String name = request.getParameter("name"); //乱码
     //String t_name = new String(request.getParameter("t_name").getBytes("iso-8859-1"), "utf-8"); 
     //String t_name = request.getParameter("t_name");
     //String d_id = request.getParameter("d_id");
     //String t_sex = new String(request.getParameter("t_sex").getBytes("iso-8859-1"), "utf-8");
     //String t_sex = request.getParameter("t_sex");
     //String t_password = request.getParameter("t_password");
     //String t_birthday = request.getParameter("t_birthday");
     //String zc = request.getParameter("zc");
     //out.println("d_id=%s" +d_id+",t_name="+t_name);
     
     String id_F = "11111";
     String From = "22222";
     Statement statement = (Statement) connection.createStatement();
     if(sgc.equals("00") || sgc.equals("01") || sgc.equals("02")){//注意javaString不能用==判断
    	 id_F = "t_id";
    	 From = "Teacher";
     }
     else if(sgc.equals("10") || sgc.equals("11") || sgc.equals("12")){
    	 id_F = "s_id";
    	 From = "Student";
     }
     //out.println(id_F+"   "+From);
     String sql = "SELECT * FROM "+From+" WHERE "+id_F+"="+id_E+";"; 
     String sql2 = "SELECT * FROM Teacher WHERE t_id ="+id_E+";"; 
     ResultSet rs1 = statement.executeQuery(sql);
     if(From.equals("Teacher")){
    	 
     if(rs1.next()){
         String t_id = rs1.getString("t_id");
         String d_id = rs1.getString("d_id");
         String t_name = rs1.getString("t_name");
         String t_sex = rs1.getString("t_sex");
         String t_password = rs1.getString("t_password");
         Date t_birthday = rs1.getDate("t_birthday");
         String zc = rs1.getString("zc");
         
     %>
<form action="SCteaupdate.jsp?wno=<%= wno %>">
	<table  width="100%" border="1" cellpadding="0.5" cellspacing="0.5">
		    <style>
				td {
					text-align:center;
				}
			</style>
        <tr>
            <th>教职工号</th>
            <th>院系编号</th>
            <th>名字</th>
            <th>性别</th>
            <th>密码</th>
            <th>出生日期</th>
            <th>职称</th>
            <th>管理员编号</th>
        </tr>
     <tr>
        		<td><%= t_id%></td>
				<td><%= d_id%></td>
            	<td><%= t_name%></td>
            	<td><%= t_sex%></td>
            	<td><%= t_password%></td>
            	<td><%= t_birthday%></td>
            	<td><%= zc%></td>
            	<td><%= wno%></td>
     </tr>
     <tr>
        		<td><input type="text" id="t_idnew" maxlength='15' name = "t_idnew" value ="<%=t_id%>"/>
        		<td><input type="text" id="d_idnew" maxlength='15' name = "d_idnew" value ="<%=d_id%>"/>
				<td><input type="text" id="t_namenew" maxlength='11' name = "t_namenew"/>
            	<td><input type="text" id="t_sexnew" maxlength='4' name = "t_sexnew"/>
            	<td><input type="text" id="t_passwordnew" maxlength='20' name = "t_passwordnew"/>
            	<td><input type="text" id="t_birthdaydnew" maxlength='8' name = "t_birthdaydnew"/>
            	<td><input type="text" id="zcnew" maxlength='15' name = "zcnew"/>
            	<td><input type="text" id="wno" maxlength='15' name = "wno" value ="<%=wno%>"/>
     </tr>

     </table> 
     <p style="text-align:center"> <input type="submit" value="更新"></td></tr>
     <p style="text-align:center"> <input type="reset" value="重置"></td></tr>
</form>  
     <br>
	<%
     	}
     	else{
    	 	out.println("error!");
     	}
     }
     else if(From.equals("Student")){
    	 if(rs1.next()){
    		 String s_id = rs1.getString("s_id");
             String m_id = rs1.getString("m_id");
             String s_name = rs1.getString("s_name");
             String s_sex = rs1.getString("s_sex");
             String s_password = rs1.getString("s_password");
             Date s_birthday = rs1.getDate("s_birthday");%>
<form action="SCstuupdate.jsp?wno=<%= wno %>">
<table width="100%" border="1" cellpadding="0.5" cellspacing="0.5">
        <tr>
            <th>学号</th>
            <th>专业编号</th>
            <th>名字</th>
            <th>性别</th>
            <th>密码</th>
            <th>出生日期</th>
        </tr>
        <tr>
            	<td><%= s_id%></td>
            	<td><%= m_id%></td>
            	<td><%= s_name%></td>
            	<td><%= s_sex%></td>
            	<td><%= s_password%></td>
            	<td><%= s_birthday%></td>
            	<td><%= wno%></td>
        </tr>
        <tr>
        		<td><input type="text" id="s_idnew" maxlength='15' name = "s_idnew" value ="<%=s_id%>"/>
        		<td><input type="text" id="m_idnew" maxlength='15' name = "m_idnew" value ="<%=m_id%>"/>
				<td><input type="text" id="s_namenew" maxlength='11' name = "s_namenew"/>
            	<td><input type="text" id="s_sexnew" maxlength='4' name = "s_sexnew"/>
            	<td><input type="text" id="s_passwordnew" maxlength='20' name = "s_passwordnew"/>
            	<td><input type="text" id="s_birthdaydnew" maxlength='8' name = "s_birthdaydnew"/>
            	<td><input type="text" id="wno" maxlength='15' name = "wno" value ="<%=wno%>"/>
     	</tr>
        </table>
        
        <p style="text-align:center"> <input type="submit" value="更新"></td></tr>
     <p style="text-align:center"> <input type="reset" value="重置"></td></tr>
        </form>
         <% 
    	 }
    	 else{
    		 out.println("error");
    		 
    	 }
     }%>
     <p style="text-align:center"><a href="SCrootusermanager.jsp?wno=<%=wno%>">返回上一页</a></p>
</body>
</html>