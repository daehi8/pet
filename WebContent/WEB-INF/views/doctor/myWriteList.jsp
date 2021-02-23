<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors | 내 글 보기</title>
<link href="/pet/resource/style/style_board.css" rel="stylesheet" type="text/css">

</head>
<body>
	<c:if test="${sessionScope.doctorMail == null }">
		<script>
			alert("로그인 해주세요.");
			window.location="/pet/doctor/main.do";
		</script>
	</c:if>
	<c:if test="${sessionScope.doctorMail != null }">
		<div style="margin-top: 40px;text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<div style="text-align:left"><b>내 글 보기(전체 글:${count})</b></div><br>
		
		<c:if test="${count == 0}">
			<table class="table table-hover" style="text-align: center">
			<thead>
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회</th></tr>
			</thead>
			
				<tr>
		    		<td colspan="5" align="center">
		      			작성한 글이 없습니다.
		    		</td>
		 		</tr>
		 	</table>
		</c:if>		
		<c:if test="${count > 0}">
			<table class="table table-hover">
			<thead>
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회</th></tr>
			</thead>
			   <c:forEach var="article" items="${articleList}">
			   <tr>
			    <td>
				  <c:out value="${number}"/>
				  <c:set var="number" value="${number - 1}"/>
				</td>
			    <td>
			      <a href="/pet/boardfree/content.do?num=${article.num}&pageNum=${currentPage}">
			          ${article.subject}</a> 
				</td>
			    <td> 
			       <a href="mailto:${article.email}">${article.email}</a>
				</td>
			    <td>${article.reg_date}
				</td>
			    <td>${article.cnt}</td>
			  </tr>
			  </c:forEach>
			</table>
		</c:if>
		</div>
		</div>
		<c:if test="${count > 0}">
		   <c:set var="pageCount" value="${count / pageSize + ( count % pageSize == 0 ? 0 : 1)}"/>
		   <c:set var="pageBlock" value="${10}"/>
		   <fmt:parseNumber var="result" value="${currentPage / 10}" integerOnly="true" />
		   <c:set var="startPage" value="${result * 10 + 1}" />
		   <c:set var="endPage" value="${startPage + pageBlock-1}"/>
		   <c:if test="${endPage > pageCount}">
		        <c:set var="endPage" value="${pageCount}"/>
		   </c:if> 
		   
		   <nav aria-label="Page navigation-sm">
		     	<ul class="pagination justify-content-center">       
				   <c:if test="${startPage > 10}">
				      <li class="page-item"><a class="page-link" href="/pet/doctor/myWriteList.do?pageNum=${startPage - 10 }">이전</a></li>
				   </c:if>
				
				   <c:forEach var="i" begin="${startPage}" end="${endPage}">
				      <li class="page-item"><a class="page-link" href="/pet/doctor/myWriteList.do?pageNum=${i}">${i}</a></li>
				   </c:forEach>
				
				   <c:if test="${endPage < pageCount}">
				       <li class="page-item"><a class="page-link" href="/pet/doctor/myWriteList.do?pageNum=${startPage + 10}">다음</a></li>     
				   </c:if>
				</ul>
			</nav>
		</c:if>
	</c:if>

</body>
</html>