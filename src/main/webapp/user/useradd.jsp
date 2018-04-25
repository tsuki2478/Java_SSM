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
	<form action="user/save" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover m10">
			<tr>
				<input type="hidden" name="userid"  value="${user.userid }"/>
				<td class="tableleft">用户名</td>
				<td><input type="text"  name="username" 
value="${user.username}"  ${!empty user.username ?'disabled':'' } 
				/>
				</td>
			</tr>

			<tr>
				<td class="tableleft">密码</td>
				<td><input type="password" name="password" value="${user.password }" /></td>
			</tr>

			<tr>
				<td class="tableleft">真实姓名</td>
				<td><input type="text" name="realname"
					value="${user.realname }" /></td>
			</tr>
			<tr>
				<td class="tableleft">所在组(部门)</td>
				<td><select name="did">
						<option value="0">请选择所在组</option>
						<c:forEach items="${deptlist }" var="d">
							<option value="${d.id }" ${user.did==d.id ? 'selected' :'' }>${d.name }</option>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td class="tableleft">状态</td>
				<td><input type="radio" name="status" value="1" checked /> 启用 <input
					type="radio" name="status" value="0" /> 禁用</td>
			</tr>
		<!--fn:contains 判断字符串是否包含另外一个字符串  -->	
    <tr>
        <td class="tableleft">角色${user.rids}</td>
        <td>
	<c:forEach items="${rolelist}"  var="r">
 <input type="checkbox" name="rids" value="${r.rid }" 		   ${fn:contains(user.rids,r.rid)?'checked':'' }>${r.rolename }<br/>
 
 </c:forEach>
		</td>
    </tr>
			
			



			<tr>
				<td class="tableleft">性别</td>
				<td><input type="radio" name="sex" value="0" checked /> 男 <input
					type="radio" name="sex" value="1" /> 女</td>
			</tr>


			<tr>
				<td class="tableleft">电话</td>
				<td><input type="text" name="phone" /></td>
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
			window.location.href = "user/query";
		});

	});
</script>