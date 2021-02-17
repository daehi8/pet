<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav.jsp" %>
<head>
</head>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000x; display: inline-block;">
<h1 style="text-align: left">결과 페이지 </h1>

<script type="text/javascript">

alert("${total}점 입니다.")

</script>

<br>

${level}

<br>
<br>	
<button class="btn btn-dark">목록</button>
<button class="btn btn-dark" type="button" class="re_btn" onClick="location.href='check.do'">다시하기</button>

</div>
</div>

	