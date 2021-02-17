<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>

<html>
<head>
<title>updateForm</title>
</head>

<body>
	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
<b>글수정</b>

<form method="post" enctype="multipart/form-data"  action="/pet/board/updatePro.do" onsubmit="return writeSave()">
	<input type="hidden" name="num" value="${dto.num}" />

<table class="table">
	 <tr>
	 	<td width="70" align="center" >제목</td>
	 	<td width="330">
	 		<input type="text" size="100" maxlength="50" name="subject" value="${dto.subject}" ></td>
	 </tr>
	 <tr>
	 	<td width="70" align="center">Email</td>
	 	<td width="330">
	 		<input type="text" size="100" maxlength="30" name="email" value="${dto.email}"></td>
	 </tr>
	 <tr>
	 	<td width="70" align="center" >이미지</td>
	 	<td width="330" >
	 	 	<input type="file" size="8" maxlength="12" name="img">
	 	 	<input type="hidden" name="boardimage" value="${dto.boardimage}" />
	 	 </td>
	 </tr>
	 <tr>
	 	<td width="70" align="center">내용</td>
	 	<td width="330">
	 		<textarea name="contents" cols="105" rows="20">${dto.contents}</textarea></td>
	 </tr>
	 
<tr>
	<td colspan=2 align="center">
	 <input class="btn btn-dark" type="submit" value="글쓰기" >
	 <input class="btn btn-light" type="reset" value="다시작성" >
	 <input class="btn btn-dark" type="button" value="목록보기" OnClick="window.location='/pet/board/list.do'">
</td></tr></table>
</form>
</div>
</div>
</body>
</html>