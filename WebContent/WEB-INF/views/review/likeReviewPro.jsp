<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${check >= 1}">
		<script>
			alert("추천은 한번만 할 수 있습니다.");
		</script>
	</c:if>
	<script>
		window.location="/pet/review/contentsreview.do?hospital_no="+${hospital_no};
	</script>

</body>
</html>