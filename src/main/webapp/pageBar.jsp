<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <div>
        共有${pageModel.total }条记录，共${pageModel.pages }页，每页
      <select name="pageSize" onchange="changePageSize(this.value)" style="width: 50px;">
          <option value="10" ${pageModel.pageSize==10?"selected":"" }>10</option>
          <option value="20"  ${pageModel.pageSize==20?"selected":"" }>20</option>
          <option value="50"  ${pageModel.pageSize==50?"selected":"" }>50</option>
          <option value="100"   ${pageModel.pageSize==100?"selected":"" }>100</option>
      </select>  
        条记录，当前${pageModel.pageNum }/${pageModel.pages }页，
    <a href="javascript:homePage()">首页</a>|
    <a href="javascript:frontPage()">上一页</a>|
    <a href="javascript:nextPage()">下一页</a>|
    <a href="javascript:lastPage()">尾页</a>|
    转到<select name="	" onchange="goPage(this.value)" style="width: 50px;">
       <c:forEach begin="1" end="${pageModel.pages }" var="i">
          <option value=${i }  ${pageModel.pageNum==i?"selected":"" }>${i }</option>
       </c:forEach>
    </select>
   </div>
   
   
    <script type="text/javascript">
       function homePage(){
    	   document.getElementById("pageNum").value=1;
    	   document.getElementById("pager").submit();//表单提交
    	   
       }
       function frontPage(){
    	   document.getElementById("pageNum").value=${pageModel.pageNum<=1? 1 : pageModel.pageNum-1 };
    	   document.getElementById("pager").submit();//表单提交
       }
       function nextPage(){
    	   document.getElementById("pageNum").value=${pageModel.pageNum>=pageModel.pages?pageModel.pages:pageModel.pageNum+1 };
    	   document.getElementById("pager").submit();//表单提交
       }
       function lastPage(){
    	   document.getElementById("pageNum").value=${pageModel.pages };
    	   document.getElementById("pager").submit();//表单提交
       }
       function goPage(cur_page){
    	   document.getElementById("pageNum").value=cur_page;
    	   document.getElementById("pager").submit();//表单提交
       }
       function changePageSize(cur_pageSize){
    	   document.getElementById("pageSize").value=cur_pageSize;
    	   document.getElementById("pager").submit();//表单提交
       }
    </script>