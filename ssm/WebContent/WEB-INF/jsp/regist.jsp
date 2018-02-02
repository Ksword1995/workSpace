<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
</head>

<body>
	<h1>注册</h1>
	<form action="${pageContext.request.contextPath }/user/regist"
		method="post">
		用户名：<input type="text" id="username" name="username" /><br /> 密码：<input
			type="password" id="password" name="password" /><br /> <input
			type="submit" value="注册">
	</form>
	${e.message }
	<hr />
	<a href="${pageContext.request.contextPath }/showLogin">登录</a>
</body>
</html>
