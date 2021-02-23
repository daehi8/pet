<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 일반회원</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	location.href="/pet/admin/memberlist.do?searchType="+searchType+"";
}
</script>
</head>
<body>


	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link active btn btn-outline-dark" href="memberlist.do">일반회원</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/doclist.do">의사회원</a>
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
	<option value="no">미인증회원</option>
	<option value="ok">인증회원</option>
	<option value="del">탈퇴회원</option>
</select>
</div>
<h6 style="text-align: left">총 회원수 : ${pageDTO.count}</h6>
<table class="table" style="text-align: center">
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>상태</td>
		<td> * </td>
	</tr>
	<c:set var ="number" value="${pageDTO.number}"/>
	<c:forEach var="list" items="${memberList}">
		<tr>
			<td>${number}</td>
			<td>${list.email}</td>
			<td>
				<c:choose>
					<c:when test="${list.approval_status == 0}">인증대기</c:when>
					<c:when test="${list.approval_status == 1}">인증완료</c:when>
					<c:when test="${list.approval_status == -1}">탈퇴</c:when>
				</c:choose>
			</td>
			<c:if test="${list.approval_status != -1}">
				<td><a href="/pet/admin/delmember.do?no=${list.no}">탈퇴</a></td>
			</c:if>
		</tr>
		<c:set var="number" value="${number-1}"/>
	</c:forEach>
</table>
<br>
 <nav aria-label="Page navigation-sm">
     <ul class="pagination justify-content-center">  
	    <c:if test="${pageDTO.startPage > 10}">
	        <a href="/pet/admin/memberlist.do?pageNum=${pageDTO.startPage - 10}&searchType=${searchType}">&laquo;</a>
	    </c:if>
	        
        <c:forEach var ="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
        	<c:if test="${pageDTO.currentPage == i}">
	        	 <li class="page-item"><a class="page-link" href="/pet/admin/memberlist.do?pageNum=${i}&searchType=${searchType}" class="active">${i}</a>
			</c:if>
			<c:if test="${pageDTO.currentPage != i}">
	        	 <li class="page-item"><a class="page-link" href="/pet/admin/memberlist.do?pageNum=${i}&searchType=${searchType}">${i}</a>
	        </c:if>
		</c:forEach>
	        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	         <li class="page-item"><a class="page-link" href="/pet/admin/memberlist.do?pageNum=${pageDTO.startPage + 10}&searchType=${searchType}">&raquo;</a>
        </c:if>
	</ul>
	</nav>
</div>
</div>

</body>
</html>