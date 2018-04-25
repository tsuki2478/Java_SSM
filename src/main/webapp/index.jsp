<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
	  <base href="<%=basePath%>">
    <title>后台管理系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="header">

    <div class="dl-title">
        <!--<img src="/chinapost/Public/assets/img/top.png">-->
    </div>

    <div class="dl-log">欢迎您，
    <span class="dl-log-user">root
    </span><a href="../login.jsp" title="退出系統" class="dl-log-quit">[退出]</a>
    <!-- <<a href="../login.jsp" >[退出]</a> -->
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">系统管理</div></li>		<li class="nav-item dl-selected"><div class="nav-item-inner nav-order">业务管理</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<script type="text/javascript" src="assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="assets/js/bui-min.js"></script>
<script type="text/javascript" src="assets/js/common/main-min.js"></script>
<script type="text/javascript" src="assets/js/config-min.js"></script>
<script>
		BUI.use('common/main', function() {
			var config = [ {
				id : '1',
				menu : [ {
					text : '系统管理',
					items : [ {
						id : '12',
						text : '处理组管理',
						href : 'dept/query'
					}, {
						id : '3',
						text : '角色管理',
						href : 'role/query'
					}, {
						id : '4',
						text : '用户管理',
						href : 'user/query'
					}, {
						id : '6',
						text : '菜单管理',
						href : 'menu/query'
					}, {
						id : '7',
						text : '数据字典管理',
						href : 'data/query'
					
					} ]
				} ]
			}, {
				id : '8',
				homePage : '11',
				menu : [ {
					text : '业务管理',
					items : [ {
						id : '10',
						text : '创建工单',
						href : 'work/init'
					},{
						id : '11',
						text : '我的工单',
						href : 'work/myWork'
					} ,{
						id : '12',
						text : '本组工单',
						href : 'work/myGroup'
					} ,{
						id : '13',
						text : '本组退单',
						href : 'work/myGroupBack'
					} ,{
						id : '14',
						text : '查询所有工单',
						href : 'work/queryAll'
					}  ]
				} ]
			} ];
			new PageUtil.MainPage({
				modulesConfig : config
			});
		});
	</script>
<div style="text-align:center;">
<p>来源：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
	
	</div>
</body>
</html>