<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">



</head>
<body>
<title>companyModify.html</title>

	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/bootstrap/css/bootstrap.min.css"
		type="text/css"></link>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/plugins/FlatUI/dist/css/flat-ui.css"
		type="text/css"></link>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/plugins/FlatUI/dist/img/favicon.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
	<script src="${pageContext.request.contextPath }/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/FlatUI/dist/js/flat-ui.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/fwb/bootstrap-wysiwyg.js"></script>
	<script src="${pageContext.request.contextPath }/plugins/fwb/external/jquery.hotkeys.js" type="text/javascript"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/productAdd.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/plugins/FlatUI/dist/js/application.js"></script>
		<script type="text/javascript">
	$(function(){
		$("#companyName").blur(function valName(){
			$.post("${pageContext.request.contextPath}/company/valNameAndId",
						{"name":$("#companyName").val(),"id":$("#companyId").val()},
						function(message){
							$("#nameMessage").text(message);
						}
						);
		});
		
		$("#sub").click(function addContext(){
			var a =$("#content").html();
			$("#details").val(a);
			
		});
		
		$("#rate").blur(function valRate(){
			var reg =/^[0-9]+.?[0-9]*$/;
			if( reg.test($("#rate").val())){
				$("#rateMessage").text("")
			}else
			$("#rateMessage").text("格式错误");
			
		});
		
		
		
		
		$("#form").submit(function(){
			if($("#nameMessage").text()!=""  || $("#rateMessage").text()!=""){
				return false;
			}
  			return true;
		});
		
	});
		</script>
</head>

<body style="padding: 5px 10px">

	<div class="panel panel-primary">
	  <div class="panel-heading">
	    <h3 class="panel-title">企业修改</h3>
	  </div>
	  <div class="panel-body">
	  		
	  		<form class="form-horizontal" role="form" id="form" method="post" action="${pageContext.request.contextPath }/company/modify">
	  		
	  		<div class="form-group">
              <label for="companyId" class="col-lg-2 control-label">企业编号</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="companyId" name="companyId" value="${company.companyId}" readonly="readonly">
              </div>
            </div>
	  		
            <div class="form-group">
              <label for="companyName" class="col-lg-2 control-label">企业名称</label>
              <div class="col-lg-10">
                <input type="text" class="form-control" id="companyName" name="companyName" placeholder="企业名称" value="${company.companyName}">
                 <span id="nameMessage"></span>
              </div>
            </div>
            
            <div class="form-group">
            	<label for="productRate" class="col-lg-2 control-label">融资佣金</label>
            	<div class="col-lg-10">
			        <div class="input-group col-lg-3" style="float: left;">
			            <input type="text" class="form-control" id="rate"  name="rate" value="${company.financingInReturn}" placeholder="佣金数" >
			            <span class="input-group-addon">%</span>
			        </div>
			            <span id="rateMessage"></span>
			    </div>
          	</div>
            <input type="hidden" id="details" name="details"/>
            <div class="form-group">
              <label for="content" class="col-lg-2 control-label">内容</label>
              <div class="col-lg-10">
              	
<!-- 			asdjalkj dlkajsdkl asjdlkaj sdkl asd -->
			<div class="btn-toolbar" data-role="editor-toolbar"	data-target="#content">
				<div class="btn-group">
					<a class="btn" data-edit="indent" title="Indent (Tab)">
						Tab缩进
					</a>
				</div>
				<div class="btn-group">
					<a class="btn" data-edit="justifyleft"
						title="Align Left (Ctrl/Cmd+L)">
						左对齐
					</a> 
					<a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)">
						居中
					</a> 
					<a class="btn" data-edit="justifyright"
						title="Align Right (Ctrl/Cmd+R)">
						右对齐
					</a> 
					<a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)">
						自动调整
					</a>
				</div>
		
		 		<div class="btn-group">
					<a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)">
						撤销
					</a> 
					<a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)">
						恢复
					</a>
				</div>
				
			</div>
<!--               	asdalksdjklasj -->
              	
            <div id="content" style="overflow:scroll; max-height:300px;border: 1px solid;height: 200px;">${company.companyDetail}</div>
         </div>
     </div>
            
            
            
            <div class="form-group">
              <div class="col-lg-offset-2 col-lg-10">
                <button id="sub" type="submit" class="btn btn-lg btn-info" style="padding: 15px 60px;border-radius: 0px;">修改</button>
              </div>
            </div>
          </form>
	  		
	  		
	  		
	  </div>
	</div>
</body>
</html>