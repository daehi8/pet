<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
 <!-- 제이쿼리 -->
 <script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<h1>체크리스트 읽기</h1>

<script type="text/javascript">
$(document).ready(function(){
var formObj = $("form[name='readForm']");
// 수정 
$(".update_btn").on("click", function(){
formObj.attr("action", "checkModify.do");
formObj.attr("method", "get");
formObj.submit();                
})
// 삭제
$(".delete_btn").on("click", function(){
formObj.attr("action", "delete.do");
formObj.attr("method", "post");
formObj.submit();
})
// 취소
$(".list_btn").on("click", function(){
location.href = "check.do";
})
})
</script>
<section id="container">
<form name="readForm" role="form" method="post">
<form name="form" method="post">
<input type="hidden" id="no" name="no" value="${read.no}"/><br/>
</form>
<label for="check_no">체크 no.</label>
<input type="text" name="check_no" value="${read.check_no}" readonly="readonly"/><br/>

<label for="quest_no">질문 번호</label>
<input type="text" name="quest_no" value="${read.quest_no}" readonly="readonly"><br/>

<label for="quest_title">질문</label>
<textarea id="quest_title" name="quest_title" readonly="readonly">${read.quest_title}</textarea><br/>
<label for="quest_ans1">답1</label>
<textarea id="quest_ans1" name="quest_ans1" readonly="readonly">${read.quest_ans1}</textarea><br/>
<label for="quest_ans2">답2</label>
<textarea id="quest_ans2" name="quest_ans2" readonly="readonly">${read.quest_ans2}</textarea><br/>
<label for="quest_ans3">답3</label>
<textarea id="quest_ans3" name="quest_ans3" readonly="readonly">${read.quest_ans3}</textarea><br/>
<label for="quest_ans4">답4</label>
<textarea id="quest_ans4" name="quest_ans4" readonly="readonly">${read.quest_ans4}</textarea><br/>
<label for="quest_ans5">답5</label>
<textarea id="quest_ans5" name="quest_ans5" readonly="readonly">${read.quest_ans5}</textarea>

<button type="submit" class="update_btn">수정</button>
<button type="submit" class="delete_btn">삭제</button>
<button type="submit" class="list_btn">목록</button>    


</section>