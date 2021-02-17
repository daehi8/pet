<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
 <head>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script> 
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
<h1>사전수정</h1>

<section id="container">
<form role="form" method="post" autocomplete="off">
<input type="hidden" id="dict_no" value="${modify.dict_no}">

<label for="animal_no">동물번호</label>
<input type="text" id="animal_no" name="animal_no"  value="${modify.animal_no}"/><br/>

<label for="animal_name">동물</label>
<input type="text" id="animal_name" name="animal_name"  value="${modify.animal_name}"/><br/>

<label for="animal_feed">음식</label>
<input type="text" id="animal_feed" name="animal_feed"  value="${modify.animal_feed}"/><br/>

<label for="animal_reason">이유</label>
<textarea id="animal_reason" name="animal_reason" >${modify.animal_reason}</textarea><br/>

<button type="submit" class="update_btn">저장</button>
<button type="submit" class="cancel_btn">취소</button>

</form>
    