<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	location.href="/pet/admin/memberlist.do?searchType="+searchType+"";
}
</script>
</head>
<body>
<select name="searchType" id="searchType" onchange="categorySearchType()">
	<option value="no">--</option>
	<option value="no">미인증회원</option>
	<option value="ok">인증회원</option>
	<option value="del">탈퇴회원</option>
</select>
<table>
	<tr>
		<td>총 회원수 : ${pageDTO.count}</td>
	</tr>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>상태</td>
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
		</tr>
		<c:set var="number" value="${number-1}"/>
	</c:forEach>
</table>

<div class="center">
	<div class="pagination">
	    <c:if test="${pageDTO.startPage > 10}">
	        <a href="/pet/admin/memberlist.do?pageNum=${pageDTO.startPage - 10}&searchType=${searchType}">&laquo;</a>
	    </c:if>
	        
        <c:forEach var ="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}">
        	<c:if test="${pageDTO.currentPage == i}">
	        	<a href="/pet/admin/memberlist.do?pageNum=${i}&searchType=${searchType}" class="active">${i}</a>
			</c:if>
			<c:if test="${pageDTO.currentPage != i}">
	        	<a href="/pet/admin/memberlist.do?pageNum=${i}&searchType=${searchType}">${i}</a>
	        </c:if>
		</c:forEach>
	        
        <c:if test="${pageDTO.endPage < pageDTO.pageCount}">
	        <a href="/pet/admin/memberlist.do?pageNum=${pageDTO.startPage + 10}&searchType=${searchType}">&raquo;</a>
        </c:if>
	</div>
</div>
</body>
</html>