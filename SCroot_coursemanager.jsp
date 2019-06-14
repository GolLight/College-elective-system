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
    <h1 style="text-align:center">教师用户</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
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
            <th>操作</th>
            <th>操作</th>
        </tr>
        <% 
        String sql1 = "SELECT * FROM Teacher";
        ResultSet rs1 = statement.executeQuery(sql1);
        while(rs1.next()) {
            String t_id = rs1.getString("t_id");
            String d_id = rs1.getString("d_id");
            String t_name = rs1.getString("t_name");
            String t_sex = rs1.getString("t_sex");
            String t_password = rs1.getString("t_password");
            Date t_birthday = rs1.getDate("t_birthday");
            String zc = rs1.getString("zc");
        %>
        	<tr>
        		<td><%= t_id%></td>
				<td><%= d_id%></td>
            	<td><%= t_name%></td>
            	<td><%= t_sex%></td>
            	<td><%= t_password%></td>
            	<td><%= t_birthday%></td>
            	<td><%= zc%></td>
            	<td><a href='SCEdit.jsp?wno=<%=wno%>&id_E=<%= t_id%>&sgc=01'style="cursor:hand;">修改</a></td>
            	<td><a href='SCtea_delete.jsp?wno=<%=wno%>&t_id="<%=t_id%>"'style="cursor:hand;">删除</a></td>
        	</tr>
        <%
        }
        rs1.close();
        %>
    </table>

    <h1 style="text-align:center">学生用户</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
        <tr>
            <th>学号</th>
            <th>专业编号</th>
            <th>名字</th>
            <th>性别</th>
            <th>密码</th>
            <th>出生日期</th>
        </tr>
        <% 
        String sql2 = "SELECT * FROM Student";   
        ResultSet rs2 = statement.executeQuery(sql2);
        while(rs2.next()) {
            String s_id = rs2.getString("s_id");
            String m_id = rs2.getString("m_id");
            String s_name = rs2.getString("s_name");
            String s_sex = rs2.getString("s_sex");
            String s_password = rs2.getString("s_password");
            Date s_birthday = rs2.getDate("s_birthday");
        %>
        <tr>
            	<td><%= s_id%></td>
            	<td><%= m_id%></td>
            	<td><%= s_name%></td>
            	<td><%= s_sex%></td>
            	<td><%= s_password%></td>
            	<td><%= s_birthday%></td>
            	<td><a href='SCEdit.jsp?wno=<%=wno%>&id_E=<%= s_id%>&sgc=11'style="cursor:hand;">修改</a></td>
            	<td><a href='SCstu_delete.jsp?wno=<%=wno%>&id_E=<%= s_id%>'style="cursor:hand;">删除</a></td>
        </tr>
        <%
        }
        rs2.close();
        %>
        </table>
            <h1 style="text-align:center">院系</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
    <style>
		td {
			text-align:center;
		}
	</style>
        <tr>
            <th>院系编号</th>
            <th>院系名称</th>
            <th>院长</th>
            <th>院系电话</th>
            <th>院系介绍</th>
        </tr>
        <% 
        String sql3 = "SELECT * FROM Department";
        ResultSet rs3 = statement.executeQuery(sql3);
        while(rs3.next()) {
            String d_id = rs3.getString("d_id");
            String d_name = rs3.getString("d_name");
            String d_header = rs3.getString("d_header");
            int d_phone = rs3.getInt("d_phone");
            String d_introduction = rs3.getString("d_introduction");
        %>
        	<tr>
            	<td><%= d_id%></td>
            	<td><%= d_name%></td>
            	<td><%= d_header%></td>
            	<td><%= d_phone%></td>
            	<td><%= d_introduction%></td>
        	</tr>
        <%
        }
        rs3.close();
        %>
    </table>
        <h1 style="text-align:center">专业</h1>
    <table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
    <style>
		td {
			text-align:center;
		}
	</style>
        <tr>
            <th>专业编号</th>
            <th>院系编号</th>
            <th>专业名字</th>
            <th>辅导员</th>
            <th>专业电话</th>
            <th>专业介绍</th>
        </tr>
        <% 
        String sql4 = "SELECT * FROM Major";
        ResultSet rs4 = statement.executeQuery(sql4);
        while(rs4.next()) {
            String m_id = rs4.getString("m_id");
            String d_id = rs4.getString("d_id");
            String m_name = rs4.getString("m_name");
            String instrutor = rs4.getString("instrutor");
            int m_phone = rs4.getInt("m_phone");
            String m_introduction = rs4.getString("m_introduction");
        %>
        	<tr>
            	<td><%= m_id%></td>
            	<td><%= d_id%></td>
            	<td><%= m_name%></td>
            	<td><%= instrutor%></td>
            	<td><%= m_phone%></td>
            	<td><%= m_introduction%></td>           	
        	</tr>
        <%
        }
        rs4.close();
        %>
    </table>

<h1 style="text-align:center">用户添加</h1>

<form action="SCEdit.jsp">
		<style>
		table {
			margin:0 auto;      //居中
		}		
		</style>
		<table width="30%" border="1" cellpadding="0.5" cellspacing="0.5">
        <style>
        	td{
        		text-align:center;
        	}
        </style>
            <h1 style="text-align:center"></h1>
            <tr>
                <td>操作(0教师1学生)</td>
                <td><input type="text" id="sgc" maxlength='20' name = "sgc"/>
                
                <script type="text/javascript">
					var text1 = document.getElementById("sgc");
					text1.onkeyup = function(){
						this.value=this.value.replace(/\D/g,'');   //替换成int
						if(this.value != 0 || this.value != 1){
						 this.value = "";
						 alert("请输入数字0或1,0代表添加教师，1代表添加学生");
						}
					}
				</script>
            </tr>
            <tr>
                <td>编号</td>
                <td><input type="text" id="id_E" maxlength='20' name = "id_E"/>
                
                <script type="text/javascript">
					var text2 = document.getElementById("id_E");
					text2.onkeyup = function(){
						this.value=this.value.replace(/\D/g,'');   //替换成int
						if(text2.value.length>6 || text2.value.legth == 0){
						 text2.value = "";
						 alert("密码必须小于 等于6个数字，大于0个数字。");
						}
					}
				</script>
            </tr>
        </table>
         <p style="text-align:center"> <input type="submit" value="添加"></td></tr>
         <%
         statement.close();
     	connection.close();
         %>
         <p style="text-align:center"><a href="SCrootop.jsp?wno=<%=wno%>">返回上一页</a></p>
        <br>
    </form>        
</body>
</html>