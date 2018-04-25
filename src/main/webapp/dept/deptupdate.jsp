<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--导入要使用的标签   fmt日期标签fmt:formatDate value="${time}" pattern="yyyy-MM-dd"-->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--函数  -->
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title></title>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="Css/bootstrap.css" />
<link rel="stylesheet" type="text/css"
	href="Css/bootstrap-responsive.css" />
<link rel="stylesheet" type="text/css" href="Css/style.css" />
<script type="text/javascript" src="Js/jquery.js"></script>
<script type="text/javascript" src="Js/jquery.sorted.js"></script>
<script type="text/javascript" src="Js/bootstrap.js"></script>
<script type="text/javascript" src="Js/ckform.js"></script>
<script type="text/javascript" src="Js/common.js"></script>
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>
</head>
<body>
	<form action="dept/save" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover m10">
			<tr>
				<input type="hidden" name="id" value="${dept.id }" />
				<td class="tableleft">菜单名称</td>
				<td><input type="text" name="name" value="${dept.name}" />
				</td>
			</tr>

			<tr>
				<td class="tableleft">权限名称</td>
				<td><input type="text" name="memo"
					value="${menu.securityname }" /></td>
			</tr>

			<tr>
				<td class="tableleft"></td>
				<td>
					<button type="submit">保存</button> &nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid">返回列表</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<script>
	$(function() {
		$('#backid').click(function() {
			window.location.href = "dept/query";
		});
		
    });
    
		 function validateUsername(username){
		$.getJSON("menu/validateUsername?username="+username+"&time="+new Date(), function(json){
		if(json.flag==1){
			$("#span_msg").html(json.msg);
			$("#span_msg").css("color","red");
			}else{
			$("#span_msg").html(json.msg);
			$("#span_msg").css("color","blue");
			}
	});
		 }
</script>