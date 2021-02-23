<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 체크리스트 작성</title>
</head>
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


<form method="post">

<table class="table" style="text-align:center;">
<tr>
<th style="width:30%">체크 no.</th><td><input style="width:57%" type="text" name="check_no"><br/></td>
</tr>
<tr>
<th style="width:30%">질문 번호</th><td><input style="width:57%" type="text" name="quest_no"></td>
</tr>
<tr>
<th style="width:30%">질문</th><td><textarea cols="50" rows="2" name="quest_title"></textarea></td>
</tr>
<tr>
<th style="width:30%">답1</th><td><textarea cols="50" rows="2"  name="quest_ans1"></textarea></td>
</tr>
<tr>
<th style="width:30%">답2</th><td><textarea cols="50" rows="2"  name="quest_ans2"></textarea></td>
</tr>
<tr>
<th style="width:30%">답3</th><td><textarea cols="50" rows="2"  name="quest_ans3"></textarea></td>
</tr>
<tr>
<th style="width:30%">답4</th><td><textarea cols="50" rows="2"  name="quest_ans4"></textarea></td>
</tr>
<tr>
<th style="width:30%">답5</th><td><textarea cols="50" rows="2"  name="quest_ans5"></textarea></td>
</tr>
</table>
<button class="btn btn-dark w-50 p-2" type="submit"> 작성하기 </button>
</form>

</div>
</div>
</body>
</html>