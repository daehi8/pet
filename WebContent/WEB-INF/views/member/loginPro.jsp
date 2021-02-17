<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "pet.model.dto.MemberDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${sessionScope.member == null }">
	<script>
		alert("다시 입력해주세요.");
		history.go(-1)
	</script>
</c:if>
<c:if test="${sessionScope.member != null }">
	<c:redirect url="/member/main.do"></c:redirect>
</c:if>


