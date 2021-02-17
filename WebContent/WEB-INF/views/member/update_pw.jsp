<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
기존 비밀번호 <input type="password" value="기존 비밀번호를 입력해주세요">
새로운 비밀번호  <input type="password" value="새로운 비밀번호를 입력해주세요">
새로운 비밀번호 재입력 <input type="password" value="새로운 비밀번호를 재입력해주세요">
<title>마이페이지</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4">
			<div class="w3-center w3-large w3-margin-top">
				<h3>My Page</h3>
			</div>
			<div>
				<form id="pwForm" action="/pet/member/update_pw.do" method="post">	
					<input type="hidden" name="id" value="${ member.email }">
					<p>
						<label>Password</label>
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>New Password</label> 
						<input class="w3-input" id="pw" name="pw" type="password" required>
					</p>
					<p>
						<label>Confirm</label>
						<input class="w3-input" type="password" id="pw2" type="password" required>
					</p>
					<p class="w3-center">
						<button type="submit" id="joinBtn" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-round">비밀번호 변경</button>
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>