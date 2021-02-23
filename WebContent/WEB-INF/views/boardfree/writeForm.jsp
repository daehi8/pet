<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>

<html>
<head>
<title>writeForm</title>
</head>


<body>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
<c:if test="${sessionScope.doctorMail == null  && sessionScope.member == null}">
		<script>
			alert("로그인 하신 후에 사용해주세요");
			location.href="/pet/member/login.do";
		</script>		
 	</c:if>	
	
<b>글쓰기</b>
<br>
<form method="post" enctype="multipart/form-data" name="writeform" action="/pet/boardfree/writePro.do" onsubmit="return writeSave()">
	
		
<table class="table">
	<tr>
	 <td width="70" align="center">작성자</td>
	 <td width="330">
	 	<input type="text" size="10" maxlength="10" name="id" value="${sessionScope.member.pen_name}"></td>
	 </tr>
	 <tr>
	 	<td width="70" align="center" >제목</td>
	 	<td width="330">
	 		<input type="text" size="40" maxlength="50" name="subject" ></td>
	 </tr>
	 <tr>
	 	<td width="70" align="center">Email</td>
	 	<td width="330">
	 		<input type="text" size="40" maxlength="30" name="email" value="${sessionScope.doctorMail}${sessionScope.member.email}"></td>
	 </tr>
	 <tr>
	 	<td width="70" align="center" >이미지</td>
	 	<td width="330" >
	 	 <input type="file" size="8" maxlength="12" name="img">
	 	 </td>
	 </tr>
	 <tr>
	 	<td width="70" align="center">내용</td>
	 	<td width="330">
	 		<textarea name="contents" cols="100" rows="10	"></textarea></td>
	 </tr>
	 
<tr>
	<td colspan=2 align="center">
	 <input class="btn btn-dark" type="submit" value="글쓰기" >
	 <input class="btn btn-light" type="reset" value="다시작성" >
	 <input class="btn btn-dark"  type="button" value="목록" OnClick="window.location='/pet/boardfree/list.do'">
</td></tr></table>
</form>
</div>
</div>
</body>
</html>