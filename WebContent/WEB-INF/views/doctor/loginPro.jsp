<%@ page contentType="text/html;charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="pet.model.bean.DoctorBean" %>


<c:if test="${check == 1 && doctor.doc_state == 1  }">
	<c:redirect url="main.do" />
</c:if>
<c:if test="${check == 1 && doctor.doc_state == -1 }">
	<script>
		alert("이미 탈퇴 된 회원입니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check == 1 && doctor.doc_state == 0 }">
	<script>
		alert("승인대기중인 메일입니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check == 0 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>


