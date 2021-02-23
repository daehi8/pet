<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 사전관리</title>	
	<script>
	$(function(){
	$('#searchBtn').click(function() {
	self.location = "/pet/admin/admindict.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" 
							+ $("select option:selected").val() + "&keyword=" 
							+ encodeURIComponent($('#keywordInput').val());});});   
	</script>
</head>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link active btn btn-outline-dark" href="/pet/admin/admindict.do">사전관리</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/admincheck.do">체크리스트</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminboard.do	">게시판관리</a>
	  	</li>  	
	   	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="memberlist.do">뒤로</a>
	  	</li>
	 	</ul>
		</nav>

<div>
</div>

   <br>
	<!-- 검색 -->
	<select name="searchType" id = "id-lang" onchange="categoryChange()">
	<option value="all" <c:out value="${scri.searchType eq 'all' ? 'selected' : ''}"/>>전체</option>
	<option value="d" <c:out value="${scri.searchType eq 'd' ? 'selected' : ''}"/>>강아지</option>
	<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>고양이</option>
	<option value="b" <c:out value="${scri.searchType eq 'b' ? 'selected' : ''}"/>>새</option>
	<option value="r" <c:out value="${scri.searchType eq 'r' ? 'selected' : ''}"/>>파충류</option>
	<option value="e" <c:out value="${scri.searchType eq 'e' ? 'selected' : ''}"/>>특수동물</option>
	</select>
	<input style="width:30%;" type="text" name="keyword" id="keywordInput" value="${scri.keyword}" placeholder="음식 이름을 입력해보세요">
	<button class="btn btn-outline-dark" type="button" id="searchBtn">Search</button>
	<br>
	<br>
<script>
function categoryChange(){
    var langSelect = document.getElementById("id-lang");
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
    var selectText = langSelect.options[langSelect.selectedIndex].text;   
    self.location = "/pet/admin/admindict.do?searchType=" + selectValue;
}


</script>


	<table class="table" style="text-align: center; table-layout:fixed">
	<thead>
    	<tr>
      	<th style="width:10%; text-align: center">동물</th>
      	<th style="width:10%; text-align: center">음식</th>
      	<th style="width:70%;text-align: left">이유</th>
      	<th style="text-align: center">삭제</th>
    	</tr>
  	</thead>
  	<tbody>
  	  <c:choose>
         <c:when test="${fn:length(list) > 0 }">
      	<c:forEach items="${list}" var="dto">
    	<tr>
      	<th scope="row">
      	<a href="/pet/dict/dictModify.do?dict_no=${dto.dict_no}&
								page=${scri.page}&
								perPageNum=${scri.perPageNum}&
								searchType=${scri.searchType}&
								keyword=${scri.keyword}">${dto.animal_name}</a>	
      									
		</th>
      	<td height="auto">${dto.animal_feed}</td>
      	<td style="text-align: left" height="auto">${dto.animal_reason}</td>
      	<td><a href="/pet/dict/dictDelete.do?dict_no=${dto.dict_no}&
								page=${scri.page}&
								perPageNum=${scri.perPageNum}&
								searchType=${scri.searchType}&
								keyword=${scri.keyword}">삭제</a></td>
      	 </c:forEach>
      	</c:when>
          <c:otherwise>
      		<tr>
            <td>조회된 결과가 없습니다.</td>
              </tr>
                      </c:otherwise>
                      </c:choose>
  	</tbody>
	</table>
 	
 	<div style="text-align:right;">		
		<input class="btn btn-dark" type="button" value="사전 추가" onclick="window.location='/pet/dict/dictAdd.do'" />
	</div>
	<!-- 페이징 -->
 <nav aria-label="Page navigation-sm">
     <ul class="pagination justify-content-center">  
	<c:if test="${pageMaker.prev }">
<li class="page-item"><a class="page-link" href='<c:url value="/admin/admindict.do${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li <c:out value="${pageMaker.cri.page == pageNum ? 'class=active' : ''}"/>>
<li class="page-item"><a class="page-link" href='<c:url value="/admin/admindict.do${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
<li class="page-item"><a class="page-link" href='<c:url value="/admin/admindict.do${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a></li>
	</c:if>
 	</ul>
	</nav>

</div>
</div>