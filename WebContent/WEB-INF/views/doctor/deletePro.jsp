<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors</title>
</head>
<body>

	<c:if test ="${check == 1 }">
		<script> 
			alert("탈퇴되었습니다.");
			window.location="/pet/doctor/loginForm.do";
		</script>
	</c:if>
	<c:if test ="${check != 1 }">
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
	</c:if>

</body>
</html>