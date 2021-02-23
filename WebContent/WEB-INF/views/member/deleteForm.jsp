<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 	$(function(){
		$("#wdForm").click(function(){
			location.href='/pet/member/find_pw_form.do';
		});
	}) */
</script>
<title>펫츠리뷰 | 회원탈퇴</title>
</head>
<body>
   
	<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
     
	
	<c:if test="${sessionScope.member == null }"> 
			<script>
				alert("로그인이 필요한 화면입니다.");
			</script>
		<c:redirect url="/member/login.do"></c:redirect>
	</c:if>
		
			<c:if test="${sessionScope.member != null }"> 
				<form id="delete" action="/pet/member/deletePro.do" method="post">
				<input type = "hidden" id="email" name = "email" value="${sessionScope.member.email}">
				<br>
				<h2 style="margin-bottom: 15px"><span class="badge badge-danger"> 경고 </span></h2>
				<h4 style="margin-bottom: 5px">탈퇴한 회원은 재가입이 불가능합니다.<br></h4>
				<h4 style="margin-bottom: 15px">회원 탈퇴 하시겠습니까?
				</h4>
				<hr>
						<label>비밀번호를 입력시 탈퇴가 진행됩니다. </label><br>	
						  <div style="text-align: center">
						
						<input style="width:100%;"class="form-control" id="pw" name="pw" type="password"><br><br></div>
						<button class="btn btn-dark" type="submit">탈퇴하기</button>
						<button class="btn btn-ligth" type="button" onclick="history.go(-1)">취소</button>
						
				</form>
				</c:if>
			</div>
		</div>
</body>
</html>