<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
 <script type="text/javascript">
 $(function(){
		
		$("#button").click(function(){
			window.location.href='${pageContext.request.contextPath }/user/showManage';
		});
		
		$("#submit").click(function(){
			$("#f").attr("action","${pageContext.request.contextPath }/user/roleManage")
			$("#f").submit();
		});
		
		
		
 
 });
 </script>
</head>

<body>
	<h1>用户角色维护</h1>
	<form action="${pageContext.request.contextPath }/user/roleManage"
		method="post">
		<input type="hidden" name="userId" value="${user.userId}"  />
		用户基本信息：${user.userId}&nbsp;${user.name}&nbsp;
				<c:if test="${user.sex==0}">
					男
					</c:if>
					<c:if test="${user.sex==1}">
					女
					</c:if>
					&nbsp;
					<c:if test="${user.edu==1}">
					大专
					</c:if>
					<c:if test="${user.edu==2}">
					普通高校
					</c:if>
					<c:if test="${user.edu==3}">
					本科>
					</c:if>
					<c:if test="${user.edu==4}">
					硕士
					</c:if>
					<c:if test="${user.edu==5}">
					博士
					</c:if>
					&nbsp;
					${user.birth}
					&nbsp;
					${user.local}
		</br>
		用户角色：<input type="radio" name="roleName" value="1" <c:if test="${user.roleName==1}"> checked='checked'</c:if> />管理员
				&nbsp;&nbsp;<input type="radio" name="roleName" value="2" <c:if test="${user.roleName==2}"> checked='checked'</c:if> />一般用户
				&nbsp;&nbsp;<input type="radio" name="roleName" value="3" <c:if test="${user.roleName==3}"> checked='checked'</c:if> />Vip用户
			</br>	
		 <input type="submit" id="submit" value="保存">
		  <input type="button" id="button" value="返回">
	</form>
</body>
</html>
