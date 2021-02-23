<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 for doctors | 회원탈퇴</title>
</head>
<body>	
		<div style="margin-top: 35px; text-align: center">
		<div class="p-4" style="width: 1000px; display: inline-block;">
		
	  	<h2 style="text-align:left; margin-bottom: 40px;"><strong>나의 회원정보</strong></h2>
	
	<nav>
	   	<ul class="nav nav-pills nav-fill">
	  		<li class="nav-item" >
	    <a class="nav-link btn btn-outline-dark" href="modify.do">프로필</a>
	  	</li>
	  	<li class="nav-item" >
	    	<a class="nav-link btn btn-outline-dark" href="hospitalInfo.do">병원정보</a>
	  	</li> 	
	  	<li class="nav-item">
	    	<a class="nav-link btn btn-outline-dark" href="pwUpdate.do">비밀번호 변경</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link active btn btn-outline-dark" href="deleteForm.do">회원탈퇴</a>
  		</li>  	
 		</ul>
	</nav>
	<br>	
	<form action="/pet/doctor/deletePro.do" method="post" onSubmit="return checkIt()">
		<table class="table" style="text-align:center;">
			  
			<tr height="30">
				<td colspan="2" align="middle">
				<font size="+1" ><b>비밀번호를 입력시 회원 탈퇴가 진행됩니다.</b></font></td></tr>
			<tr height="30">
				<td width="110" align=center>비밀번호</td>
				<td width="150" align=center>
					<input type=password name="doc_pw"  size="15" maxlength="12">
		</table>
				<input class="btn btn-dark"  type=submit value="탈퇴"> 
					<input class="btn btn-light" type="button" value="취소" onclick="window.location='/pet/doctor/modify.do'"/>
				
	</form>
	</div>
	</div>
</body>
</html>