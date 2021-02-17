<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <head>
  <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
 </head>
 <script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "dictModify.do");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "dictDelete.do");
				formObj.attr("method", "get");
				formObj.submit();
			})
			
		
		  // 목록

            $(".list_btn").on("click", function(){

            

            location.href = "/pet/admin/admindict.do?page=${scri.page}"

            +"&perPageNum=${scri.perPageNum}"

            +"&searchType=${scri.searchType}&keyword=${scri.keyword}";

        })
		})

	</script>	
<h1>내용읽기</h1>

<section id="container">
<form name="readForm" role="form" method="post">
<input type="hidden" id="dict_no" name="dict_no" value="${read.dict_no}"/><br/>
	<input type="hidden" id="page" name="page" value="${scri.page}" readonly="readonly"/><br/>
	<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"/><br/>
	<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"/><br/>
	<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"/><br/>

</form>
<table>
<label for="animal_no">동물번호</label>
<input type="text" id="animal_no" name="animal_no" value="${read.animal_no}" readonly="readonly"/><br/>

<label for="animal_name">동물</label>
<input type="text" id="animal_name" name="animal_name"  value="${read.animal_name}" readonly="readonly"/><br/>

<label for="animal_feed">음식</label>
<input type="text" id="animal_feed" name="animal_feed"  value="${read.animal_feed}" readonly="readonly"/><br/>

<label for="animal_reason">이유</label>
<textarea id="animal_reason" name="animal_reason" readonly="readonly" >${read.animal_reason}</textarea><br/>
</table>
<button type="submit" class="update_btn">수정</button>
<button type="submit" class="delete_btn">삭제</button>
<button type="submit" class="list_btn">목록</button>	
					
</section>