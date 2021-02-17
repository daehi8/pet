<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page import = "pet.model.dto.MemberDTO" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>




<c:if test="${result == 0 }">
	<script>
		alert("이메일이 중복됩니다.");
		history.go(-1)
	</script>
</c:if>
<c:if test="${result == 1 }">
	<script>
		alert("반갑습니다. 이메일 인증 후 이용해주세요 :)");
		window.location="/pet/member/login.do"
	</script>
</c:if>