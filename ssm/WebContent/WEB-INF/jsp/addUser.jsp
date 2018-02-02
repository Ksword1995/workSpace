<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js" ></script>
   <script type="text/javascript"> 
   		$(function(){
   			
   			$("#button").click(function(){
//返回
   				window.location.href='${pageContext.request.contextPath }/user/showManage';
   			});
   			
   			$("#check").click(function(){
//ajax校验userId
   				$.post("${pageContext.request.contextPath}/user/valUserId",
						{"userId":$("#userId").val()},
						function(message){
							$("#userIdMessage").text(message);
						}
						);
   			});
   			
   			
   			$("#submit").click(function(){
   				
   				if($.trim($("#password").val())=="" || $.trim($("#repassword").val())==""){
   					$("#passwordMessage").text("密码不能为空");
     			  }else{
     				 if($("#repassword").val()!=$("#password").val()){
     	   				  $("#repasswordMessage").text("两次密码不一致");
     	   			  	}else {
     	   			  		$("#passwordMessage").text("");
     	   			  	 	$("#repasswordMessage").text("");
     	   			  	}
     			  }
   				
   					var reg =/^[0-9]+.?[0-9]*$/;
   					if( reg.test($("#sal").val())){
   						$("#salMessage").text("")
   					}else{
   					$("#salMessage").text("数字格式错误");
   					}
   					
   					var reg2 =/^(\d{4}|\d{2})-((0?([1-9]))|(1[1|2]))-((0?[1-9])|([12]([1-9]))|(3[0|1]))*$/;
   					if( reg2.test($("#birth").val())){
   						$("#birthMessage").text("")
   					}else{
   					$("#birthMessage").text("日期格式xxxx-xx-xx");
   					}
   				
   			});
   			
   			$("#form").submit(function(){
   				if($("#birthMessage").text()!="" || $("#salMessage").text()!="" 
   						||  $("#repasswordMessage").text()!="" || 
   						$("#passwordMessage").text()!="" || ($("#userIdMessage").text()).indexOf("用户ID重复 ")!=-1 ){
   					return false;
   				}
   	  			return true;
   			});
   			
   			
   		});	
   
   </script>
  </head>
  
  <body>
  	<h1>用户新增</h1>
  	<form action="${pageContext.request.contextPath }/user/add" id="form" method="post">
  			用户ID:<input type="text" name="userId" id="userId" />
  			<input type="button" id="check" value="检测" />
  			<span id="userIdMessage"></span>
  			<br/>
  			密码:<input type="password" name="password" id="password" />
  			<span id="passwordMessage"></span>
  			<br/>
  			确认密码:<input type="password" id="repassword"  />
  			<span id="repasswordMessage"></span>
  			<br/>
  			性别:<input type="radio" name="sex" value="0" />男
  				<input type="radio" name="sex" value="1" />女
  			<br/>
  			姓名:<input type="text" name="name" />
  			<br/>
  			出生日期:<input type="text" name="birth" id="birth" />
  			 <span id="birthMessage"></span> 
  			<br/>
  			教育程度:<select name="edu">
  					<option value="-1">--请选择--</option>	
  					<option value="1">大专</option>	
  					<option value="2">普通高校</option>	
  					<option value="3">本科</option>
  					<option value="4">硕士</option>
  					<option value="5">博士</option>	
  					
  		     	</select>
  		     <br/>	
  		           工资:<input type="text" name="sal" id="sal" />
  		        <span id="salMessage"></span>  
  			<br/>
  			  籍贯:<input type="text" name="local" />
  			<br/>
			<input type="submit"  id="submit" value="提交" />
			<input type="button" id="button" value="返回" />
  		</form>
  </body>
</html>
