<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫츠리뷰 | 관리자 | 병원정보입력</title>
</head>
<script language="JavaScript">
	function checkIt() {
		var userinput = eval("document.userinput");
			   
		if(!userinput.hospital_name.value) {
			alert("이름을 입력하세요");
			return false;
		}
	}
	function openConfirmName() {
		// 메일 입력했는지 검사
		if (userinput.hospital_name.value == "") {
			alert("이름을 입력하세요");
			return;
		}
		// url과 사용자 입력 id를 조합합니다.
	    url = "/pet/admin/confirmName.do?hospital_name=" + userinput.hospital_name.value ;
	    
	    // 새로운 윈도우를 엽니다.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=800, height=600");
	}
</script>
<body>

<div style="margin-top: 35px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
		<nav>
   	<ul class="nav nav-pills nav-fill">
  		<li class="nav-item" >
    <a class="nav-link btn btn-outline-dark" href="memberlist.do">일반회원</a>
  	</li>
  	<li class="nav-item" >
    	<a class="nav-link active btn btn-outline-dark" href="/pet/admin/doclist.do">의사회원</a>
  	</li> 	
  	<li class="nav-item">
    	<a class="nav-link btn btn-outline-dark" href="/pet/admin/adminmain.do">뒤로</a>
  	</li>  	
 	</ul>
	</nav>
	<br>
	<br>
	
	<c:if test="${doc_mail != null}">
		<table class="table" style="text-align:center;">
		    <tr>
		    <th style="width:20%;">의사 메일</th>
		    	<td> ${doc_mail} </td>
		    <tr> 
		    	<td> 인증파일</td> 
		      	<c:forEach var="picture" items="${pictureList}">
					<td>
						${picture.file_type} <br><br>
						<img src="/pet/save/${picture.save_pic}" />
					</td>
			</c:forEach>
		    </tr>
			
		</table>
		<br>
		<%-- 사진이미지를 보고 추가정보를 입력해주기. --%>
		<form id="hospitalPro" action="hospitalPro.do" name="userinput" onSubmit="return checkIt()">
			<table class="table" style="text-align:center;">
				<tr>
					<th style="width:20%;">병원 이름 </th>
					<td>
						<input  style="width:40%" type="text" name="hospital_name" value="${hospitalDB.name}"/>
						<input class="btn btn-outline-dark" type="button" value="검색" OnClick="openConfirmName(this.form)" />
					</td>
				</tr>
				<tr>
				<th> 의사 이름 </th>
               <td>
                  <input style="width:50%"type="text" name="doc_name" />
               </td>
				</tr>
				<tr>
					<th> 병원 번호 </th>
					<td> 
						<input style="width:50%" type="text" name="hospital_no" onChange="hospital_no(this)" value="${hospital.hospital_no}" />
					</td>
				</tr>
				<%-- <tr>
					<td> 병원 주소 </td>
					<td> <textarea name="road_adr" rows="3" cols="40" onChange="road_adr(this)"></textarea></td>
				</tr>  --%>
				<tr>
					<th> 영업시간 </th>
					<td> <textarea name="hospital_hours" rows="3" cols="50">${hospital.hospital_hours}</textarea></td>
				</tr>
				<tr>
					<th> 병원 전화번호 </th>
					<td> <textarea name="hospital_call" rows="3" cols="50">${hospital.hospital_call}</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"> 
						<input type="hidden" name="doc_mail" value="${doc_mail}" />
						<input class="btn btn-dark" type="submit" value="수정" />
						<input class="btn btn-light" type="reset" value="다시작성" />
					</td>
				</tr>
			</table>
		</form>
		
		
	</c:if>
	</div>
	</div>
</body>
</html>