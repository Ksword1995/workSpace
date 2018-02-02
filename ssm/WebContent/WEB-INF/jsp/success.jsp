<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script type="text/javascript">
	$(function() {

		$("#remove").click(function() {
			if ($(":checkbox[name=ids]:checked").size()==0) {
				alert("请至少选择一条记录进行删除操作！");
				return;
			}
			if (confirm("确定要删除数据吗")){
				var id_array=new Array();  
				$(":checkbox[name=ids]:checked").each(function(){ 
					    id_array.push($(this).val());//向数组中添加元素  
					});  
						var idstr=id_array.join(',');//将数组元素连接起来以构建一个字符串  
					$.post("${pageContext.request.contextPath}/user/valRemove",
							{"ids":idstr},
							function(message){
								if(message!=""){
									alert(message);
									return;
								}
								$("#f").attr("action","${pageContext.request.contextPath }/user/remove")
								$("#f").submit();
							}
							);
				
			} else {
				return;
			}
		});

		$("#modify").click(function() {
			if ($(":checkbox[name=ids]:checked").size()!=1) {
				alert("请选择一条记录进行修改操作！");
				return;
			}
				var id_array=new Array();  
				$(":checkbox[name=ids]:checked").each(function(){ 
					    id_array.push($(this).val());
					});  
						var idstr=id_array.join(',');
					$.post("${pageContext.request.contextPath}/user/valRemove",
							{"ids":idstr},
							function(message){
								if(message!=""){
									alert(message);
									return;
								}
								$("#f").attr("action","${pageContext.request.contextPath }/user/showModify")
								$("#f").submit();
							}
							);
				
		});
		
		$("#roleManage").click(function() {
			if ($(":checkbox[name=ids]:checked").size()!=1) {
				alert("请选择一条记录进行修改操作！");
				return;
			}
				var id_array=new Array();  
				$(":checkbox[name=ids]:checked").each(function(){ 
					    id_array.push($(this).val());
					});  
						var idstr=id_array.join(',');
					$.post("${pageContext.request.contextPath}/user/valRemove",
							{"ids":idstr},
							function(message){
								if(message!=""){
									alert(message);
									return;
								}
								$("#f").attr("action","${pageContext.request.contextPath }/user/showRoleManage")
								$("#f").submit();
							}
							);
				
		});
		
		
		
		
		
	});
</script>
</head>

<body>
	<h1>用户管理</h1>
	<h3>欢迎管理员：${nowAdmin.name}</h3>
	<hr />
	<table border="1px" width="400px" cellspacing="0px">
		<tr>
			<th></th>
			<th>ID</th>
			<th>性别</th>
			<th>教育程度</th>
			<th>出生日期</th>
			<th>工资</th>
			<th>籍贯</th>
			<th>角色</th>
			<th>创建者</th>
		</tr>
		<form  id="f" method="post">
			<c:forEach items="${users}" var="user">
				<tr>
					<td><input type="checkbox" value="${user.userId}" name="ids" /></td>
					<td>${user.userId}</td>
					<c:if test="${user.sex==0}">
					<td>男</td>
					</c:if>
					<c:if test="${user.sex==1}">
					<td>女</td>
					</c:if>
					<c:if test="${user.edu==1}">
					<td>大专</td>
					</c:if>
					<c:if test="${user.edu==2}">
					<td>普通高校</td>
					</c:if>
					<c:if test="${user.edu==3}">
					<td>本科</td>
					</c:if>
					<c:if test="${user.edu==4}">
					<td>硕士</td>
					</c:if>
					<c:if test="${user.edu==5}">
					<td>博士</td>
					</c:if>
					<td>${user.birth}</td>
					<td>${user.sal}</td>
					<td>${user.local}</td>
					<c:if test="${user.roleName==1}">
					<td>管理员</td>
					</c:if>
					<c:if test="${user.roleName==2}">
					<td>一般用户</td>
					</c:if>
					<c:if test="${user.roleName==3}">
					<td>Vip用户</td>
					</c:if>
					<td>${user.createRole}</td>
				</tr>
			</c:forEach>
		</form>
	</table>
	<a href="${pageContext.request.contextPath}/showAdd">新增</a>&nbsp;&nbsp;&nbsp;
	<a href="javascript:;" id="modify">修改</a>&nbsp;&nbsp;&nbsp;
	<a href="javascript:;" id="remove">删除</a>&nbsp;&nbsp;&nbsp;
	<a href="javascript:;" id="roleManage">角色维护</a>&nbsp;&nbsp;&nbsp;
	<a href="${pageContext.request.contextPath}/user/logout">退出</a>
	<span id="removeMessage"></span>
</body>
</html>
