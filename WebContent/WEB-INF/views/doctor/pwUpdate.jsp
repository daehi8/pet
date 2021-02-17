<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pwUpdate</title>
</head>
<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
		
		if(!userinput.doc_pw.value ) {
	        alert("기존 비밀번호를 입력하세요");
	        return false;
	    }
		if(userinput.new_pw.value.length < 6 ) {
	    	alert("비밀번호는 6자 이상으로 설정해주세요");
	    	return false;
	    }
		if(!userinput.new_pw2.value) {
	    	alert("변경 할 비밀번호를 입력해주세요");
	    	return false;
	    }
		if(userinput.new_pw.value != userinput.new_pw2.value){
	        alert("변경 할 비밀번호가 일치하지 않습니다");
	        return false;
	    }
	}
</script>
<body>	
	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<h2 style="text-align:left">나의 회원정보</h2>
	<br>
	
	<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link btn btn-outline-dark" href="modify.do">프로필</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="hospitalInfo.do">병원정보</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link active btn btn-outline-dark" href="pwUpdate.do">비밀번호 변경</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="deleteForm.do">회원탈퇴</a>
  		</li>  	
 		</ul>
	</nav>
	<br>
	<br>
	<c:if test="${doctor == null}">
		<c:redirect url="main.do"></c:redirect>
	</c:if>
	<c:if test="${doctor !=null }">
		<form action="pwPro.do" method="post" name="userinput" onSubmit="return checkIt()" >
			<table class="table">
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type = "password" name="doc_pw" size="45" maxlength="12" placeholder="기존 비밀번호를 입력해주세요" />
						<input type = "hidden" name="doc_mail" value ="${doctor.doc_mail }" />
						
					</td>
				</tr>
				<tr>
					<td>새로운 비밀번호</td>
					<td>
						<input type = "password" name= "new_pw" size="45" maxlength="12" placeholder="새로운 비밀번호를 6자 이상 입력해주세요" />
					</td>
				</tr>
				<tr>
					<td>새로운 비밀번호 재입력</td>
					<td>
						<input type = "password" name = "new_pw2" size="45" maxlength="12" placeholder="새로운 비밀번호를 6자 이상 재입력해주세요" />
					</td>
				</tr>
			</table>
			<input class="btn btn-dark p-2 w-50" type="submit" value="변경하기" />
		</form>
	</c:if>
	</div>
	</div>
</body>
</html>