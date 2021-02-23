<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 카카오톡 아이디 연동해서 로그인 -->
<script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>  <!-- //스크립트 타입을 kakao타입으로 함 -->
<a id="kakao-login-btn"></a> <!-- //버튼의 id를 정함 -->
<a href="http://developers.kakao.com/logout"></a>  <!-- //로그아웃 링크를 설정 -->


<script>
	$(function(){
		$("#find_pw_btn").click(function(){
			location.href='/pet/member/find_pw_form.do';
		});
	})
</script>
<title>펫츠리뷰 | 로그인</title>
</head>
<body>
	<div style="margin-top: 35px;text-align: center">
	<div class="p-5" style="width: 500px; display: inline-block;">
	
    <h5>3초 로그인으로<br>펫츠리뷰의 리뷰를 확인하세요</h5><br>
    
	<form id="loginForm" action="/pet/member/login_member.do" method="post">
	
	<div class="form-group">
		<input class="form-control" id="email" name="email" type="text" placeholder="이메일 주소">
	</div>
	
	<div class="form-group">
		<input class="form-control" id="pw" name="pw" type="password" placeholder="비밀번호">
	</div>
	<button type="submit" class="btn btn-dark w-100 p-2">로그인</button>
	</form>
	<div style="font-size:0.875rem;">
	<div class="d-flex justify-content-between w-150 p-4">
	<p>펫츠리뷰가 처음이신가요?<br>  <a href = "/pet/member/register.do">3초 회원가입</a> </p>
				
	<p>비밀번호를 잊으셨나요?<br> <a href = "/pet/member/find_pw_form.do">비밀번호 찾기	</a> </p> <br /></div>	
			
			</div>
			</div>
			</div>
</body>
</html>
	