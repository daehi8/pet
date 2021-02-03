<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
function categorySearchType(){
	var searchType = $("#searchType").val();
	location.href="adminreviewlist.do?searchType="+searchType+"";
}
</script>
</head>
<body>
<select name="searchType" id="searchType" onchange="categorySearchType()">
	<option value="">--</option>
	<option value="no">미승인</option>
	<option value="ok">승인</option>
	<option value="cancle">취소</option>
</select>
<table>
	<tr>
		<td>번호</td>
		<td>아이디</td>
		<td>승인여부</td>
	</tr>
	<c:forEach var="list" items="${authCheckList}">
		<tr>
			<td></td>
			<td><a href="/pet/review/admincontentsreview.do?review_no=${list.no}">${list.member_email}</a></td>
			<td>${list.auth_check}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>