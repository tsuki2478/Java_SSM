<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<form enctype="multipart/form-data" action="work/save" method="post"
		class="definewidth m20">
		<table class="table table-bordered table-hover definewidth m10">
			<input type="hidden" name="userid" />
			<tr>
				<td colspan="6">客户信息</td>

			</tr>
			<tr>
				<td width="10%" class="tableleft">客户姓名</td>
				<td>${work.customername}</td>

				<td width="10%" class="tableleft">性别</td>
				<td>${customer.sex }</td>

				<td width="10%" class="tableleft">证件类型</td>
				<td><select name="customer.certificatetype">
						<c:forEach items="${datalist }" var="d">
							<c:if test="${d.pid==1 }">
								<option value="${d.id }">${d.name }</option>
							</c:if>
						</c:forEach>
				</select></td>
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
				<td>${work.aging }</td>

				<td width="10%" class="tableleft">紧急程度</td>
				<td>${work.urgencylevel }</td>

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
				<td></td>

				<td width="10%" class="tableleft">处理人</td>

				<td></td>

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

	<div class="panel panel-default definewidth m20">
		<div class="panel-heading">
			<h3>工单处理</h3>
		</div>
		<div class="panel-body">
			<c:choose>
				<c:when test="${work.status!=2}">

					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#addhandle" data-toggle="tab">
								新增处理 </a></li>
						<li><a href="#adddesc" data-toggle="tab"> 添加描述 </a></li>
						<li><a href="#add" data-toggle="tab"> 催办 </a></li>
					</ul>

					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="addhandle">
							<c:if
								test="${sessionScope.LOGIN_USER.userid==work.handleperson }">

								<form action="work/handle" method="post">
									<input type="hidden" name="workorderid"
										value="${work.workorderid }">
									<table class="table table-bordered table-hover ">
										<tr>
											<td><input type="radio" name="status" value="1">转办
												<select name="handlegroup"
												onchange="changeGroup(this.value)">
													<option value="0">--请选择--</option>
													<c:forEach items="${deptlist}" var="d">
														<option value="${d.id }">${d.name }</option>
													</c:forEach>
											</select> <select name="handleperson" id="handleperson">
													<option value="0">--请选择处理人--</option>
											</select></td>
										</tr>
										<tr>
											<td><input type="radio" name="status" value="3">退单
												<select name="handleperson">
													<c:forEach items="${historyList }" var="h">
														<option value="${h.handleperson }">${h.handlepersonname }</option>
													</c:forEach>
											</select></td>


										</tr>
										<tr>
											<td><input type="radio" name="status" value="4">挂起
											</td>
										</tr>
										<tr>
											<td><input type="radio" name="status" value="2">归档</td>
										</tr>
										<tr>
											<td><textarea name="descs" placeholder="问题描述"></textarea></td>
										</tr>
										<tr>
											<td>
												<button type="submit" class="btn btn-primary" type="button">保存</button>
												&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</form>
							</c:if>
						</div>

						<div class="tab-pane fade" id="adddesc">
							<c:if
								test="${sessionScope.LOGIN_USER.userid!=work.handleperson }">
								<form action="">
									<table class="table table-bordered table-hover ">
										<tr>
											<td><textarea placeholder="问题描述" name="descs"></textarea></td>
										</tr>
										<tr>
											<td>
												<button type="submit" class="btn btn-primary" type="button">保存</button>
												&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</form>
							</c:if>
						</div>
						<div class="tab-pane fade" id="add">
							<c:if
								test="${sessionScope.LOGIN_USER.userid!=work.handleperson }">
								<form action="">
									<table class="table table-bordered table-hover definewidth m10">
										<tr>
											<td><textarea placeholder="问题描述" name="descs"></textarea></td>
										</tr>
										<tr>
											<td>
												<button type="submit" class="btn btn-primary" type="button">保存</button>
												&nbsp;&nbsp;
											</td>
										</tr>
									</table>
								</form>
							</c:if>
						</div>
					</div>
				</c:when>
				<c:otherwise>
		处理完成
		</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="panel panel-default definewidth m20">
		<div class="panel-heading">
			<h3>历史处理记录</h3>
		</div>
		<div class="panel-body">
			<c:forEach items="${historys }" var="h">
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object"
						src="assets/img/face.jpg" style="width: 100px; height: 100px;"
						alt="媒体对象">
					</a>
					<div class="media-body">
						<span> 处理组：${h.handlegroupname } 处理人：${h.handlepersonname }
						</span><br /> <span>操作:${h.actionstr }</span> <span> 操作时间： <fmt:formatDate
								value="${h.createdate }" pattern="yyyy-MM-dd HH:mm:ss" />
						</span><Br /> <span> 处理意见：${empty h.descs ?'无':h.descs } </span>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });
		
		
    });
    
    function changeGroup(did){
    	$.getJSON("<%=path%>/work/queryUserByDid/" + did, function(data) {
			$("#handleperson").empty();
			$.each(data, function(i, item) {
				$("#handleperson").append(
						"<option value='"+data[i].userid+"'>"
								+ data[i].username + "</option>");
			});
		});

	}
</script>