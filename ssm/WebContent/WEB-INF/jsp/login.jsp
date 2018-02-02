<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
   <script type="text/javascript">
   $(function(){
 		$("#userId").blur(function(){
 			if($.trim($("#userId").val())==""){
				$("#nameMessage").text("用户名不能为空")
				return;
			}else
			$("#nameMessage").text("");
 		});
 		$("#password").blur(function(){
 			if($.trim($("#password").val())==""){
				$("#passwordMessage").text("密码不能为空")
				return;
			}else
			$("#passwordMessage").text("");
 		});
 		$("#sub1").click(function(){
 			if($.trim($("#userId").val())==""){
				$("#nameMessage").text("密码不能为空")
				return;
			}else
			$("#passwordMessage").text("");
 		});
 		$("#sub1").click(function(){
 			if($.trim($("#password").val())==""){
				$("#passwordMessage").text("用户名不能为空")
				return;
			}else
			$("#passwordMessage").text("");
 		});
 		$("#form").submit(function(){
			if($("#nameMessage").text()!="" || $("#passwordMessage").text()!="" ){
				return false;
			}
  			return true;
		});
 	});
   </script>
  </head>
  
  <body>
  <h1>账户登录</h1>
  		<form action="${pageContext.request.contextPath }/user/login" method="post" id="form">
  			用户名：<input type="text" id="userId" name="userId" /><span id="nameMessage"></span><br/>
  			密码：&nbsp&nbsp&nbsp<input type="password" id="password" name="password" /><span id="passwordMessage"></span><br/>
  				<input id="sub1" type="submit" value="登录" > 
  				&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a href=# >还没有帐号，立即注册</a>
  		</form>
  		${message }
  		<hr/>
  		
  </body>
</html>
