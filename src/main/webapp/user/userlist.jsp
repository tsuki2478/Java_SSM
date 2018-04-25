<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath(); // /ElectronicShop
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<form class="form-inline definewidth m20" action="user/query" method="get">    
      用户名称：
    <input type="text" name="keywords" id="keywords"class="abc input-default" placeholder="用户名或真实姓名查询" value="${vo.keywords }">&nbsp;&nbsp;  
    <button type="submit" class="btn btn-primary">查询
  
    </button>&nbsp;&nbsp; 
   <!-- shrio存在。有的話 有隱藏。。 -->
  
    <button type="button" class="btn btn-success" id="addnew">新增用户</button>

   
    <!-- <a href="user/useradd.jsp">新增用户</a></button> -->
    	
</form>
<table class="table table-bordered table-hover definewidth m10">
    <thead>
    <tr>
        <th>用户id</th>
        <th>用户名称</th>
        <th>真实姓名</th>
        <th>最后登录时间</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach items="${pageModel.list}" var="user">
	     <tr>
            <td>${user.userid}</td>
            <td>${user.username}</td>
            <td>${user.realname}</td>
            <td>${user.did}</td>
            <td>
          
   <a href="user/updatePage/${user.userid}">修改</a> 

  
     <a href="javascript:del(${user.userid })">删除</a>
             
             </td>
        </tr>	
        </c:forEach>
</table>
<form action="user/query" id="pager" method="post">
   <input type="hidden" name="pageNum" id="pageNum" value="${pageModel.pageNum}">
   <input type="hidden" name="pageSize" id="pageSize" value="${pageModel.pageSize}">
   <input type="hidden" name="keywords" id="keywords"  value="${vo.keywords}">
</form>
<div class="inline pull-right page">
   <%@include file="../pageBar.jsp"%>
</div>

</body>
</html>
<script>
    $(function () {
        

		$('#addnew').click(function(){

				window.location.href="user/init";
		 });


    });

	function del(id){

		if(confirm("确定要删除吗？"))
		{
		
			var url = "user/delete/"+id;
			
			window.location.href=url;		
		
		}
	
	}
</script>