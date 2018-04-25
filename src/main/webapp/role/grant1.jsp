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
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="../Css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="../Css/style.css" />
    <script type="text/javascript" src="../Js/jquery.js"></script>
    <script type="text/javascript" src="../Js/jquery.sorted.js"></script>
    <script type="text/javascript" src="../Js/bootstrap.js"></script>
    <script type="text/javascript" src="../Js/ckform.js"></script>
    <script type="text/javascript" src="../Js/common.js"></script>

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
<form action="index.html" method="post" class="definewidth m20">
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
            <td width="10%" class="tableleft">角色名称</td>
            <td><input type="text" name="title"/></td>
        </tr>
        <tr>
            <td class="tableleft">状态</td>
            <td>
                <input type="radio" name="status" value="1" checked/> 启用  <input type="radio" name="status" value="0"/> 禁用
            </td>
        </tr>
        <tr>
            <td class="tableleft">权限</td>
            <td>
                <ul>
                   <li><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />公用节点</label>
                     <ul>
                       <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='21' />省市区级联数据</label>
                       <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='22' />省市区数据获取</label>
                           <ul>
                             <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='21' />省市区级联数据</label>
                             <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='22' />省市区数据获取</label>
                            </ul>
                         </li>
                      </ul>
                    </li>
                    <li><label class='checkbox inline'><input type='checkbox' name='group[]' value='' />明信片批次管理</label>
                     <ul>
                      <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='25' />明信片批次管理</label>
                      <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='26' />明信片批次添加</label>
                      <li><label class='checkbox inline'><input type='checkbox' name='node[]' value='27' />明信片批次编辑</label>
                     </ul>
                    </li>
                  </ul> 
            </td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
                <button type="submit" class="btn btn-primary" type="button">保存</button> &nbsp;&nbsp;<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    $(function () {
        $(':checkbox[name="group[]"]').click(function () {
            $(':checkbox', $(this).closest('li')).prop('checked', this.checked);
        });

		$('#backid').click(function(){
				window.location.href="index.html";
		 });
    });
</script>