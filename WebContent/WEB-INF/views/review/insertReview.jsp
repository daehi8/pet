<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" enctype="multipart/form-data"  action="/pet/review/insertreviewpro.do">
		<!-- 테스트용 코드 -->
		<input type="hidden" name="member_email" value="test">
		
		<input type="file" name="auth"><br />
		
		재방문 추천<br />
		
		<input type="radio" name="revisit" value="Y">YES
		<input type="radio" name="revisit" value="N">NO<br />

		<input multiple="multiple" type="file" name="hospital" maxlength="3"><br />
		<input multiple="multiple" type="file" name="cure" maxlength="3"><br />
		
		나의 페이지에 공개<br />

		<input type="checkbox" name="public_check" value="Y">나의페이지에공개<br />
		
		<input type="submit" value="확인">
	</form>
</body>
</html>