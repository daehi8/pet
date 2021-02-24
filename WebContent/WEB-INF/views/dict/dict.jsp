<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 먹이사전</title>
	<script>
	$(function(){
	$('#searchBtn').click(function() {
	self.location = "dict.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" 
							+ $("select option:selected").val() + "&keyword=" 
							+ encodeURIComponent($('#keywordInput').val());});});  

	function categoryChange(){
	    var langSelect = document.getElementById("id-lang");
	   	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	    var selectText = langSelect.options[langSelect.selectedIndex].text;
	    self.location = "/pet/dict/dict.do?searchType=" + selectValue;
	}
	</script>
</head>



	<div style="margin-top: 5px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">


	<!-- Radio -->
   <div onchange="Change()">
   <label><input type="radio"  name="serviceType" value="d">
      <img src="https://i.ibb.co/qkfYwt2/1.jpg"  width=150px, height=150px></label>
    <label><input type="radio"  name="serviceType" value="c" > 
       <img src="https://i.ibb.co/bFSkmqr/1.jpg" width=150px, height=150px></label>
    <label><input type="radio"  name="serviceType" value="b"> 
       <img src="https://i.ibb.co/ZBfgTr1/4.png" width=150px, height=150px></label>
    <label><input type="radio"  name="serviceType" value="r"> 
       <img src="https://i.ibb.co/7Yp8bqd/2.jpg" width=150px, height=150px></label>
    <label><input type="radio"  name="serviceType" value="e"> 
       <img src="https://i.ibb.co/7CSGnFg/002.png" width=150px, height=150px></label>
    </div>

	
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
	
	<script>
	function categoryChange(){
	    var langSelect = document.getElementById("id-lang");
	   	var selectValue = langSelect.options[langSelect.selectedIndex].value;
	    var selectText = langSelect.options[langSelect.selectedIndex].text;
	    self.location = "/pet/dict/dict.do?searchType=" + selectValue;
	}
	
	$("input[name='serviceType']:radio").change(function () {
		var serviceTypeValue = this.value;
	    self.location = "/pet/dict/dict.do?searchType=" + serviceTypeValue;
	});
	
	</script>
	<br>
	<br>
	<!-- 테이블 -->
	<div>
	<form role="form" method="get">
	<table class="table" style="width: 1000px;">
  	<thead>
    	<tr>
      	<th style="width:10%; text-align:center;">동물</th>
      	<th style="width:20%; text-align:center;">음식</th>
      	<th style="width:70%;">이유</th>
    	</tr>
  	</thead>
  	<tbody>
  	  <c:choose>
         <c:when test="${fn:length(list) > 0 }">
      	<c:forEach items="${list}" var="dto">
    	<tr>
      	<th style="text-align:center;">${dto.animal_name}</th>
      	<td width=20%; style="text-align:center;">${dto.animal_feed}</td>
      	<td width=50%; style="word-break:break-all">	${dto.animal_reason}</td>
      	 </c:forEach>
      	</c:when>
          <c:otherwise>
      		<tr>
      		<td></td><td></td>
            <td style="text-align: left">조회된 결과가 없습니다.</td>
              </tr>
          </c:otherwise>
      </c:choose>
  	</tbody>
	</table>
 	</form>
	</div>
	
	<!-- 페이징 -->
 	<nav aria-label="Page navigation-sm">
    	<ul class="pagination justify-content-center">    
			<c:if test="${pageMaker.prev }">
				<li class="page-item"><a class="page-link" href='<c:url value="dict.do${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a></li>
			</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li class="page-item"><a class="page-link" href='<c:url value="dict.do${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		<li class="page-item"><a class="page-link" href='<c:url value="dict.do${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a></li>
	</c:if>
  		</ul>
	</nav>
	</div>
	</div>