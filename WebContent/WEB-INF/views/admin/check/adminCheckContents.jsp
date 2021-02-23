<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 체크리스트 목록</title>
</head>
<script language="javascript">
</script>
<body>

	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link btn btn-outline-dark" href="/pet/admin/admindict.do">사전관리</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link active btn btn-outline-dark" href="/pet/admin/admincheck.do">체크리스트</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminboard.do	">게시판관리</a>
	  	</li>  	
	   	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark"  href="/pet/admin/admincheck.do">뒤로</a>
	  	</li>
	 	</ul>
		</nav>
<br>
<br>

<table>
<c:forEach items="${list}" var="dto" varStatus="st">
      <a href="/pet/check/checkRead.do?no=${dto.no}"><h6 style="text-align: left"> ${st.count}. ${dto.quest_title}</h6></a>
</c:forEach>
</table>

</div>
</div>

</body>
</html>