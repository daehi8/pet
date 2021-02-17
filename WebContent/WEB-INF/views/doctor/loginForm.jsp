<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입 폼</title>
</head>
<body>
	<div style="margin-top: 40px;text-align: center">
	<div class="p-5" style="width: 500px; display: inline-block;">
	
    <h5>의사회원 로그인으로<br>306392명의 회원들을 만나보세요</h5>
    <br>
    <form id="joinForm" action="loginPro.do" method="post">
    
  	<div class="form-group">
    	<input type="email" class="form-control" id="email" name="doc_mail" placeholder="메일주소">
	</div>
  
  	<div class="form-group">
    	<input type="password" class="form-control" id="pw" name="doc_pw" placeholder="비밀번호">
	</div>
	<br>
 	<button type="submit" class="btn btn-dark text-white w-100 p-2">로그인</button>
  	</form>
	<p>아직 의사회원이 아니신가요?  <a href ="/pet/doctor/docMailForm.do">의사회원가입</a> </p> <br /></div>	
	</div>