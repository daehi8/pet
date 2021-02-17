<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script>
/* 	$(function(){
		$("#wdForm").click(function(){
			location.href='/pet/member/find_pw_form.do';
		});
	}) */
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>회원 탈퇴</h3>
			</div>
			<div>
				<form id="delete" action="/pet/member/deletePro.do" method="post">
				<input type = "hidden" id="email" name = "email" value="${sessionScope.member.email}">
						<label>비밀번호를 입력하면 탈퇴가 진행됩니다. </label>
						<input class="w3-input" id="pw" name="pw" type="password" required>
					<p class="w3-center">
						<button type="submit" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">탈퇴하기</button>
						<button type="button" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round" onclick="history.go(-1)">Cancel</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>