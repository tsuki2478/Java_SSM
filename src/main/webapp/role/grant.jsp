<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
<form action="role/grantSave" method="post" class="definewidth m20" >
<table class="table table-bordered table-hover definewidth m10">
    <tr><input type="hidden" name="rid" value="${rid }"/>
        <td width="10%" class="tableleft">权限</td>
        <td>
        <ul>
                 <c:forEach items="${menulist }" var="big">
                   <c:if test="${big.pid==0 }">
                   <li>
						<label class='checkbox inline'>
							<input type='checkbox' cla="ck_big" name='mids' ${fn:contains(mids,big.mid)?'checked':'' }  value='${big.mid }' />
							${big.menuname }
						</label>
                     <ul>
                       <c:forEach items="${menulist }" var="small1">
                         <c:if test="${small1.pid==big.mid }">
                       <li>
								<label class='checkbox inline'>
								<input type='checkbox' name='mids'  ${fn:contains(mids,small1.mid)?'checked':'' } value='${small1.mid }' />
								${small1.menuname }
								</label>
                           <ul>
                            <c:forEach items="${menulist }" var="small2">
                               <c:if test="${small2.pid==small1.mid }">
                             <li><label class='checkbox inline'>
                             <input type='checkbox' name='mids' value='${small2.mid }'  ${fn:contains(mids,small2.mid)?'checked':'' }/>${small2.menuname }</label>
                             </li>
                             </c:if>
                             </c:forEach>
                            </ul>
                         </li>
                         </c:if>
                         </c:forEach>
                      </ul>
                    </li>
                   </c:if>
                    </c:forEach>
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
		$('#backid').click(function(){
				window.location.href="role/query";
		 });
		
		 $(':checkbox[cla="ck_big"]').click(function () {
	            $(':checkbox', $(this).closest('li')).prop('checked', this.checked);
	        });

    });
   
    function validateUsername(username){
		$.getJSON("user/validateUsername?username="+username+"&time="+new Date(), function(json){
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