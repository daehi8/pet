<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors | 이메일 중복확인</title>
</head>
<script language="javascript">

 	 function setdoc_mail() {		
 	   opener.document.userinput.doc_mail.value = "${requestScope.doc_mail}";
		self.close();
	}

</script>
<body>

	<div style="margin-top: 35px; text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
		
	<c:if test="${check == 1 }" >
		<table class="table" style="text-align: center;">
  			<tr> 
    			<td height="39" >${doc_mail}이미 사용중인 메일입니다.</td>
  			</tr>
		</table>
		<form name="checkForm" method="post" action="/pet/doctor/confirmMail.do">
			<table class="table" style="text-align: center;">
 		 		<tr>
    				<td align="center"> 
       					다른 메일을 선택하세요.<p>
       					<input type="text" size="10" maxlength="12" name="doc_mail"> 
       					<input class="btn btn-dark" type="submit" value="메일중복확인">
				    </td>
				</tr>
			</table>
		</form>
	</c:if>
	<c:if test="${check != 1 }" >
		<table class="table">
		  <tr> 
		    <td align="center"> 
		      <p>입력하신 ${doc_mail} 는 사용하실 수 있는 메일입니다. </p>
		      <input class="btn btn-dark" type="button" value="닫기" onclick="setdoc_mail()">
		    </td>
		  </tr>
		</table>
	</c:if>
</div>
</div>
</body>
</html>