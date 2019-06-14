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
<h1 style="text-align:center">学生登录</h1>
<form action="SCstucheck.jsp">
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
                <td>学号</td>
                <td><input type="text" id="sno" maxlength='20' name = "sno"/>
                
                <script type="text/javascript">
					var text1 = document.getElementById("sno");
					text1.onkeyup = function(){
						this.value=this.value.replace(/\D/g,'');   //替换成int
						if(this.value.length>15 || this.value.legth == 0){
						 this.value = "";
						 alert("工号必须小于 等于10个数字，大于0个数字。");
						}
					}
				</script>
            </tr>
            <tr>
                <td>密码</td>
                <td><input type="password" id="spass" maxlength='20' name = "spass"/>
                
                <script type="text/javascript">
					var text2 = document.getElementById("spass");
				</script>
            </tr>
        </table>
         <p style="text-align:center"> <input type="submit" value="登录"></td></tr>
         <p style="text-align:center"><a href="SCop.jsp">返回</a></p>
        <br>
    </form>
</body>
</html>