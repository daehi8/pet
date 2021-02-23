<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 건강정보</title>
 </head>
 
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy" var="year" />

	<div style="margin-top: 20px;text-align: center">
	<div class="p-4" style="width: 900x; display: inline-block;">

	<h1 style="text-align: left">펫츠리뷰 건강정보</h1><br>
		<div style="text-align: left">
			<ul class="list-group list-group-flush">
				<c:forEach items="${list}" var="dto" varStatus="status">
 			<li class="list-group-item"><a href="infoRead.do?subject_info=${dto.subject_info}"> 
			<h3 style="text-align: left">${dto.subject_info} 검사/가격 비용은? (<c:out value="${year}"/>)</a><br></h3>
				${dto.subject_info} 검사 후기 혹은 수의사를 찾으신다면 링크를 클릭해주세요!
		 		펫츠리뷰 회원의 리뷰 점수를 바탕으로 하였습니다🙂<br><br>
		 	</li>
				</c:forEach>
   			</ul>
   			<br>
   			
	<!-- 페이징 -->	
	<nav aria-label="Page navigation-sm">
    	<ul class="pagination justify-content-center">     
 	<c:if test="${pageMaker.prev }">
		<li class="page-item"><a class="page-link" href='<c:url value="info.do${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li class="page-item"><a class="page-link" href='<c:url value="info.do${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
		<li class="page-item"><a class="page-link" href='<c:url value="info.do${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a></li>
  	</c:if> 
 		</ul>
	</nav>

	</div>
	</div>
	</div>