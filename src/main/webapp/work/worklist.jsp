<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<form class="form-inline definewidth m20" action="work/myWork"
		method="post">
		<input type="text" name="workorderid" value="${work.workorderid}"
			class="abc input-default" placeholder="工单编号 ">&nbsp;&nbsp;
			<input type="text" name="customername" value="${work.customername}" 
			class="abc input-default" placeholder="客户姓名 ">&nbsp;&nbsp;
			<input type="text" name="centificatenumber" value="${work.centificatenumber}" 
			class="abc input-default" placeholder="证件号码">&nbsp;&nbsp;
		<input type="text" name="customer.telephone" value="${work.customer.telephone}" 
			class="abc input-default" placeholder="电话号码">&nbsp;&nbsp;
		    <select name="handlegroup">
						<option value="0">--请选择处理组--</option>
						<c:forEach items="${deptlist }" var="d">
							<option value="${d.id }" ${work.handlegroup==d.id?'selected':'' }>${d.name }</option>
						</c:forEach>
				</select>
		
		<button type="submit" class="btn btn-primary">查询</button>

	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>编码</th>
				<th>客户姓名</th>
				<th>证件号码</th>
				<th>问题类型</th>
				<th>处理组</th>
				<th>处理人</th>
				<th>紧急程度</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>剩余时效</th>
				<th>催办次数</th>
				<th>首次处理时间</th>
			</tr>
		</thead>
		<c:forEach items="${pageModel.list }" var="u">
			<tr>
			 
								<td>
			   <a href="work/handlePage/${u.workorderid }">${u.workorderid }</a>	
				</td>
				<td>
				<a href="work/handlePage/${u.workorderid }">${u.customername }</a>
				</td>
				 
				<td>${u.centificatenumber }</td>
				<td>${u.problemtypeName }</td>
				<td>${u.handlegroupName }</td>
				<td>${u.handlepersonName }</td>
				<td>${u.urgencylevelName }</td>
				<td>
				<%-- ${u.status } --%>
				 ${u.status==0?'未处理':(u.status==1?'处理中':(u.status==2?'归档':(u.status==3?'退单':'挂起'))) }
				 	<!-- 
				 <c:choose>
				   <c:when test="u.status==0">
				          未处理
				   </c:when>
				   <c:when test="u.status==1">
				          处理中
				   </c:when>
				   <c:when test="u.status==2">
				         归档
				   </c:when>
				    <c:when test="u.status==3">
				        退单
				   </c:when>
				   <c:otherwise>
				       挂起
				   </c:otherwise>
				 </c:choose>
				  -->
				
				</td>
				
				
				
				<td><fmt:formatDate value="${u.creatdate }"
						pattern="yyyy-MM-dd" /></td>
				<td>2天3小时</td>
				<td>1</td>
				<td><fmt:formatDate value="${u.creatdate }"
						pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:forEach>
	</table>
	<form action="work/myWork" id="pager" method="post">
		<input type="hidden" name="pageNum" id="pageNum"
			value="${pageModel.pageNum }"> <input type="hidden"
			name="pageSize" id="pageSize" value="${pageModel.pageSize }">
		<input type="hidden" name="workorderid" value="${work.workorderid }" /> 
		<input type="hidden" name="customername" value="${work.customername}">&nbsp;&nbsp;
		<input type="hidden" name="centificatenumber" value="${work.centificatenumber}" >&nbsp;&nbsp;
		<input type="hidden" name="customer.telephone" value="${work.customer.telephone}" >&nbsp;&nbsp;
		<input type="hidden" name="handlegroup" value="${work.handlegroup}" >&nbsp;&nbsp;
	
	</form>
	<div class="inline pull-right page">
		<%@include file="../pageBar.jsp"%>
	</div>
</body>
</html>
<script>
	$(function() {

		$('#addnew').click(function() {

			window.location.href = "user/init";
		});

	});

	function del(id) {

		if (confirm("确定要删除吗？")) {

			var url = "user/delete/" + id;

			window.location.href = url;

		}

	}
</script>