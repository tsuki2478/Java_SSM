<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<title></title>
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
	<form  enctype="multipart/form-data"
	action="work/save" method="post" class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
			<input type="hidden" name="userid" />
			<tr>
				<td colspan="6">客戶信息</td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">客户姓名</td>
				<td><input type="text" name="customer.customername"
					placeholder="必填" /></td>
					
				<td width="10%" class="tableleft">性別</td>
				<td><select name="customer.sex">
						<option value="0">未知</option>
						<option value="1">男</option>
						<option value="2">女</option>
				</select></td>
				<td width="10%" class="tableleft">证件类型</td>
				<td><select name="customer.certificatetype">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==1 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select>
			</tr>
			<tr>
				<td width="10%" class="tableleft">证件号码</td>
				<td><input type="text" name="customer.centificatenumber" /></td>

				<td width="10%" class="tableleft">手机号</td>
				<td><input type="text" name="customer.telephone" /></td>

				<td width="10%" class="tableleft">微信白名单openId</td>
				<td><input type="text" name="customer.wechatwhite" /></td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">QQ白名单openId</td>
				<td><input type="text" name="customer.qqwhile" /></td>

				<td width="10%" class="tableleft">开户渠道</td>
				<td><select name="customer.openchannel">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==2 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>

				<td width="10%" class="tableleft">客群分类</td>
				<td><input type="text" name="customer.customertype" /></td>
			</tr>
			<tr>
				<td colspan="6">客户进线信息</td>
			</tr>
			
			<tr>
				<td width="10%" class="tableleft">进线渠道</td>
				<td><select name="customer.comeinchannel">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==3 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>

				<td width="10%" class="tableleft">来电号码</td>
				<td><input type="text" name="customer.callphone" /></td>


			</tr>
			<tr>
				<td colspan="6">工单信息</td>

			</tr>
			<tr>
				<td width="10%" class="tableleft">处理时效</td>
				<td><select name="aging">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==4 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>

				<td width="10%" class="tableleft">紧急程度</td>
				<td><select name="urgencylevel">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==5 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>

				<td width="10%" class="tableleft">问题类型</td>
				<td><select name="problemtype">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==6 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">流转对象</td>
				<td><select name="handlegroup"
					onchange="changeGroup(this.value)">
						<option value="0">--请选择--</option>
						<c:forEach items="${deptlist }" var="d">
							<option value="${d.id }">${d.name }</option>
						</c:forEach>
				</select></td>

				<td width="10%" class="tableleft">处理人</td>

				<td><select name="handleperson" id="handleperson">
						<option value="0">--请选择处理人--</option>
				</select></td>

				<td width="10%" class="tableleft"></td>
				<td></td>
			</tr>
			<tr>
				<td width="10%" class="tableleft">问题描述</td>
				<td colspan="5"><input type="text" name="username" /></td>


			</tr>
			<tr>
				<td width="10%" class="tableleft">上传文件</td>
				<td colspan="5"><input type="file" name="upload" /></td>

			</tr>
			<tr>

				<td colspan="6" style="text-align: center;">
					<button type="submit" class="btn btn-primary" type="button">保存</button>
					&nbsp;&nbsp;
					<button type="button" class="btn btn-success" name="backid"
						id="backid">返回列表</button>
				</td>
			</tr>
		</table>
	</form>


</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });
		
		
    });
    
    function changeGroup(did){
    $.getJSON("<%=path%>/work/queryUserByDid/"+did,function(data){
    	$("#handleperson").empty();
    	$.each(data,function(i,item){
    		$("#handleperson").append("<option value='"+data[i].userid+"'>"+data[i].username+"</option>");
    	});
    });
    }
</script>