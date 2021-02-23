<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자  | 의사회원</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	location.href="/pet/admin/doclist.do?searchType="+searchType+"";
}
</script>
</head>
<body>


	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link btn btn-outline-dark" href="memberlist.do">일반회원</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link active btn btn-outline-dark" href="/pet/admin/doclist.do">의사회원</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
  	</li>  	
 	</ul>
	</nav>
<br>	
<div style="text-align: right">	
<select name="searchType" id="searchType" onchange="categorySearchType()">
	<option value="no">--</option>
	<option value="no">대기회원</option>
	<option value="ok">승인회원</option>
	<option value="del">미승인회원</option>
</select>
</div>
<h6 style="text-align: left">총 회원수 : ${pageDTO.count}</h6>
<table class="table" style="text-align: center">

	<tr>
		<td>번호</td>
		<td>메일</td>
		<td>인증상태</td>
		<td>승인상태</td>
		<td>정보입력</td>
	</tr>
	<c:set var ="number" value="${pageDTO.number}"/>
	<c:forEach var="list" items="${docList}">
		<tr>
			<td>${number}</td>
			<td><a href="/pet/admin/contentsdoc.do?doc_mail=${list.doc_mail}&doc_no=${list.doc_no}&pageNum=${pageDTO.pageNum}&searchType=${searchType}">${list.doc_mail}</a></td>
			<td>${list.doc_state}</td>
			<td>
				<c:choose>
					<c:when test="${list.doc_state == 0}">승인대기</c:when>
					<c:when test="${list.doc_state == 1}">승인완료</c:when>
					<c:when test="${list.doc_state == -1}">승인거부</c:when>
				</c:choose>
			</td>
			<td>
				<input class="btn btn-dark" type="button" value="병원정보입력" onClick="window.location='/pet/admin/hospitalForm.do?doc_mail=${list.doc_mail}'"/><br>
			</td>
		</tr>
		<c:set var="number" value="${number-1}"/>
	</c:forEach>
</table>
<br>
  <nav aria-label="Page navigation-sm">
     <ul class="pagination justify-content-center">   
	    <c:if test="${pageDTO.startPage > 10}">
	        <a href="/pet/admin/doclist.do?pageNum=${pageDTO.startPage - 10}&searchType=${searchType}">&laquo;</a>
	    </c:if>
	        
        <c:forEach var ="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
        	<c:if test="${pageDTO.currentPage == i}">
	         <li class="page-item"><a class="page-link" href="/pet/admin/doclist.do?pageNum=${i}&searchType=${searchType}" class="active">${i}</a>
			</c:if>
			<c:if test="${pageDTO.currentPage != i}">
	        <li class="page-item"><a class="page-link" href="/pet/admin/doclist.do?pageNum=${i}&searchType=${searchType}">${i}</a>
	        </c:if>
		</c:forEach>
	        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	      <li class="page-item"><a class="page-link" href="/pet/admin/doclist.do?pageNum=${pageDTO.startPage + 10}&searchType=${searchType}">&raquo;</a>
        
        </c:if>
        </ul>
	</nav>
</div>
</div>

</body>
</html>