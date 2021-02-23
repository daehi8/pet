<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰  | 관리자 | 체크리스트 수정</title>
</head>
<script type="text/javascript">
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/pet/admin/admincheck.do";
			})
		
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

<form name="form" method="post">
<input type="hidden" id="no" value="${modify.no}"/>

<table class="table" style="text-align:center;">
<tr>
<th style="width:30%">체크 no.</th><td><input style="width:80%;" type="text" name="check_no" value="${modify.check_no}"><br/></td>
</tr>
<tr>
<th style="width:30%">질문 번호</th><td><input style="width:80%;" type="text" name="quest_no" value="${modify.quest_no}"></td>
</tr>
<tr>
<th style="width:30%">질문</th><td><textarea  rows="3" cols="70" id="quest_title" name="quest_title">${modify.quest_title}</textarea></td>
</tr>
<tr>
<th style="width:30%">답1</th><td><textarea  rows="3" cols="70" id="quest_ans1" name="quest_ans1">${modify.quest_ans1}</textarea></td>
</tr>
<tr>
<th style="width:30%">답2</th><td><textarea  rows="3" cols="70" id="quest_ans2" name="quest_ans2">${modify.quest_ans2}</textarea></td>
</tr>
<tr>
<th style="width:30%">답3</th><td><textarea  rows="3" cols="70" id="quest_ans3" name="quest_ans3">${modify.quest_ans3}</textarea></td>
</tr>
<tr>
<th style="width:30%">답4</th><td><textarea  rows="3" cols="70" id="quest_ans4" name="quest_ans4">${modify.quest_ans4}</textarea></td>
</tr>
<tr>
<th style="width:30%">답5</th><td><textarea  rows="3" cols="70" id="quest_ans5" name="quest_ans5">${modify.quest_ans5}</textarea></td>
</tr>
</table>
<button type="submit" class="update_btn btn btn-dark">저장</button>
<button type="submit" class="cancel_btn btn btn-ligth">취소</button>
</form>
</div>
</div>
</body>	
</html>
