<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<html>
<head>
<link href="/pet/resource/style/style_board.css" rel="stylesheet" type="text/css">
<title>펫츠리뷰 | 관리자  | 정보게시판</title>
</head>


	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
			<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link active btn-outline-dark" href="/pet/admin/adminboard.do">정보게시판</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminboardfree.do">자유게시판</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/admindict.do">뒤로</a>
  	</li>  	
  	  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">목록</a>
  	</li> 
 	</ul>
	</nav>
	
	<div style="margin-top: 20px; text-align:left"><b>글목록(전체 글:${count})</b></div><br>
	
		<table class="table table-hover" style="text-align:center">
			<thead>
				<tr><th>번호</th><th>제목</th><th>작성자</th><th>삭제</th></tr>
			</thead>
			
				<c:forEach items="${list}" var="dto">
					<tr>
						<td><c:out value="${dto.num}" /></td>
						<td><a href="/pet/board/content.do?num=${dto.num}">${dto.subject }</a>
						</td>
						<td><c:out value="${dto.id}"/></td>
						<td><a href="/pet/board/deletePro.do?num=${dto.num}">삭제</a></td>
						</c:forEach>	
		</table>
		<div style="text-align: right">
		<input class="btn btn-dark" type="button" value="글쓰기" onclick="window.location='writeForm.do'"><br /></div>  
		
		
	<form action="/pet/boardfree/searchList.do" >
		<select name="col">
			<option value="id" >작성자</option>
			<option value="subject" >제목</option>
			<option value="contents" >내용</option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색" />
	</form>
<br />	
 <c:if test="${search == null}">
   
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
      <li class="page-item"><a class="page-link" href="/pet/admin/adminboard.do?pageNum=${startPage - 10 }">이전</a></li>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
      <li class="page-item"><a class="page-link" href="/pet/admin/adminboard.do?pageNum=${i}">${i}</a></li>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
       <li class="page-item"><a class="page-link" href="/pet/admin/adminboard.do?pageNum=${startPage + 10}">다음</a></li>     
   </c:if>
   </ul>
	</nav> 
   
   
</c:if>
</c:if>
 <c:if test="${search != null}">
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
         <li class="page-item"><a class="page-link" href="/pet/admin/adminsearchboard.do?pageNum=${startPage - 10 }&search=${search}&col=${col}">이전</a></li>
   </c:if>

   <c:forEach var="i" begin="${startPage}" end="${endPage}">
        <li class="page-item"><a class="page-link" href="/pet/admin/adminsearchboard.do?pageNum=${i}&search=${search}&col=${col}">${i}</a></li>
   </c:forEach>

   <c:if test="${endPage < pageCount}">
         <li class="page-item"><a class="page-link" href="/pet/admin/adminsearchboard.do?pageNum=${startPage + 10}&search=${search}&col=${col}">다음</a></li>   
   </c:if>
   </ul>
	</nav> 
   </c:if>
</div>		
</div>

</body>
</html>