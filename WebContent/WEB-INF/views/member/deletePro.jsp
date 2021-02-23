<%@ page contentType="text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>펫츠리뷰입니다.</title>

</head>

<body>
<c:if test="${sessionScope.member != null }"> 
	<c:if test="${check == 1}" >
	<form method="post" action="/pet/member/main.do" name="userinput" >
	<table width="270" border="0" cellspacing="0" cellpadding="5" align="center">
	  <tr> 
	    <td height="39" align="center">
		  <font size="+1" ><b>회원정보가 삭제되었습니다.</b></font>
		 </td>
	  </tr>
	  <tr>
	    <td align="center"> 
	      <p>흑흑.... 서운합니다. 안녕히 가세요.</p>
	      <meta http-equiv="Refresh" content="5;url=/pet/member/main.do" >
	    </td>
	  </tr>
	  <tr>
	    <td align="center"> 
	      <input type="submit" value="확인" />
	    </td>
	  </tr>
	</table>
	</form>
	</c:if>
</c:if>



	<c:if test="${check != 1 }">
	<script> 
	  alert("비밀번호가 맞지 않습니다.");
	     history.go(-1);
	</script>
	</c:if>
</body>
</html>
