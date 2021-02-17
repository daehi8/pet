<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../nav.jsp" %>
 <head>
 </head>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy" var="year" />

	<div style="margin-top: 20px;text-align: center">
	<div class="p-4" style="width: 900x; display: inline-block;">

<h1 style="text-align: left">건강정보 블로그</h1><br>	
	모두닥 팀은 꾸준히 여러 진료과의 의학정보들을 쉽고 알차게 준비해보려 합니다.
	여러 치료항목의 가격, 치료과정, 치료재의 종류등 최대한 많은 영역을 다루게 될 것입니다.
<br><br>
<div style="text-align: left">
<ul class="list-group list-group-flush">
<c:forEach items="${list}" var="dto" varStatus="status">
 <li class="list-group-item"><a href="infoRead.do?subject_info=${dto.subject_info}"> 
<h3 style="text-align: left">${dto.subject_info} 검사/가격 비용은? (<c:out value="${year}"/>)</a><br></h3>
${dto.subject_info} 검사 후기 혹은 수의사를 찾고자 하신다면 다음의 링크를 클릭하세요~!
 모두닥 회원의 리뷰 점수를 바탕으로 하였습니다🙂<br>
 	
 <br>
</c:forEach>
   </ul>
<!-- 페이징 -->	


<nav>
	<ul class="pagination">	
 <c:if test="${pageMaker.prev }">
	<li><a href='<c:url value="info.do${pageMaker.makeSearch(pageMaker.startPage-1) }"/>'>이전</a></li>
	</c:if>

	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li <c:out value="${pageMaker.cri.page == pageNum ? 'class=active' : ''}"/>>
		<a href='<c:url value="info.do${pageMaker.makeSearch(pageNum) }"/>'>${pageNum }</a></li>
	</c:forEach>

	<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
	<li><a href='<c:url value="info.do${pageMaker.makeSearch(pageMaker.endPage+1) }"/>'>다음</a></li>
  </c:if> 
 </ul>
</nav>	