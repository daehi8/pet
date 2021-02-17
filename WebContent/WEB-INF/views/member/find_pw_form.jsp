<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/pet/member/find_pw.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})
</script>
<title>비밀번호 찾기</title>
</head>
<body>
	<div style="margin-top: 40px;text-align: center">
	<div class="p-5" style="width: 500px; display: inline-block;">
				<h3 style="text-align: left">비밀번호 찾기</h3>
				<small>비밀번호를 재설정할 수 있도록 하는 메일이 전송됩니다!!!	@@@@@</small><br><br>	
					<input class="form-control" type="text" id="email" name="email" placeholder="이메일 주소">
					<button style="margin-top:5px;" type="button" id=findBtn class="btn btn-dark w-100 p-2">메일 전송하기</button>
			</div>
		</div>
	
</body>
</html>