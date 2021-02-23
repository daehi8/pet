<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 사전추가</title>	
</head>

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
<form method="post">
	<table class="table" style="text-align:center;">
				<tr>
					<th style="width:50%">동물번호</th><td><input style="width:100%"  type="text" name="animal_no" /></td>
				</tr>
				<tr>
					<th>동물</th><td><input style="width:100%" type="text" name="animal_name" /></td>
				</tr>
				<tr>
					<th>음식</th><td><input style="width:100%"  type="text" name="animal_feed"/></td>
				</tr>
				<tr>
					<th>이유</th><td><textarea cols="70" rows="5" name="animal_reason"></textarea></td>
				</tr>
			</table>
			
<button class="btn btn-dark p-2 w-100" type="submit">작성하기</button>
</form>

</div>
</div>

</body>
</html>
