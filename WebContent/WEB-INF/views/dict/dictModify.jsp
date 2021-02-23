<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 사전수정</title>
</head>
<script type="text/javascript">
$(".cancel_btn").on("click", function(){
	event.preventDefault();
	location.href = "dictRead.do?dict_no=${modify.dict_no}"
		   + "&page=${scri.page}"
		   + "&perPageNum=${scri.perPageNum}"
		   + "&searchType=${scri.searchType}"
		   + "&keyword=${scri.keyword}";
})
</script>
<body>
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
	    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
	  	</li>
	 	</ul>
		</nav>
<br>
<br>

		<form role="form" method="post" autocomplete="off">
			<input type="hidden" id="dict_no" value="${modify.dict_no}">
				
			<table class="table" style="text-align:center;">
				<tr>
					<th style="width:50%">동물번호</th><td><input style="width:100%;" type="text" id="animal_no" name="animal_no"  value="${modify.animal_no}"/></td>
				</tr>
				<tr>
					<th>동물</th><td><input  style="width:100%;" type="text" id="animal_name" name="animal_name"  value="${modify.animal_name}"/></td>
				</tr>
				<tr>
					<th>음식</th><td><input style="width:100%;" type="text" id="animal_feed" name="animal_feed"  value="${modify.animal_feed}"/></td>
				</tr>
				<tr>
					<th>이유</th><td><textarea rows="5" cols="70" id="animal_reason" name="animal_reason" >${modify.animal_reason}</textarea><br/></td>
				</tr>
			</table>
					
			<button class="btn btn-dark p-2 w-100" type="submit" class="update_btn">저장하기</button>

		
		</form>


</div>
</div>

</body>
</html>