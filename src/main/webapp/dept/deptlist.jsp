<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet" type="text/css" href="Css/bootstrap-responsive.css" />
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

        @media (max-width: 980px) {
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
<form class="form-inline definewidth m20" action="dept/query" method="post">    
    关键字：
    <input type="text" name="keywords" id="keywords"class="abc input-default"
     placeholder="ID或名稱查询" value="${vo.keywords }">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询</button>&nbsp;&nbsp; 
    <button type="button" class="btn btn-success" id="addnew">新增菜单</button>
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>ID</th>
        <th>部門名称</th>
        <th>信息</th>
        <th>操作</th>
    </tr>
    </thead>
       <c:forEach items="${pageModel.list }" var="u">
	     <tr>
            <td>${u.id }</td>
            <td>${u.name }</td>
            <td>${u.memo }</td>
            <td>
                <a href="dept/updatePage/${u.id }">编辑</a> |
                <a href="javascript:del(${u.id })">删除</a>  
                               
            </td>
        </tr>	
        </c:forEach>
</table>
<form action="dept/query" id="pager" method="post">
   <input type="hidden" name="pageNum" id="pageNum" value="${pageModel.pageNum }">
   <input type="hidden" name="pageSize" id="pageSize" value="${pageModel.pageSize }">
   <input type="hidden" name="keywords" id="keywords"  value="${vo.keywords }">
</form>
<div class="inline pull-right page">
   <%@include file="../pageBar.jsp" %>
</div>
</body>
</html>
<script>
    $(function () {
        

		$('#addnew').click(function(){

				window.location.href="dept/init";
		 });


    });

   
	function del(id)
	{
		
		
		if(confirm("确定要删除吗？"))
		{
		
			var url = "dept/delete/"+id;
			
			window.location.href=url;		
		}
	}
</script>