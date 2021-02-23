<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hospitalForm</title>
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
	<h3> 관리자페이지 </h3>
	<c:if test="${doc_mail != null}">
		<h5> 의사 메일    |  ${doc_mail} </h5>
		<table border="1" cellpadding="0" cellspacing="0" align="left"> 
		    <tr height="30"> 
		    	<td align="center"  width="100" > 저장이름</td> 
		      	<td align="center"  width="200" > 이미지파일</td>
		    </tr>
			<c:forEach var="picture" items="${pictureList}">
				<tr>
					<td> ${picture.save_pic} </td>
					<td>
						${picture.file_type} <br><br>
						<img src="/pet/save/${picture.save_pic}" />
					</td>
				</tr>
			</c:forEach>
		</table>
		<%-- 사진이미지를 보고 추가정보를 입력해주기. --%>
		<form id="hospitalPro" action="hospitalPro.do" name="userinput" onSubmit="return checkIt()">
			<table>
				<th align="center" > 병원 정보 입력 </th>
				<tr>
					<td> 병원 이름 </td>
					<td>
						<input type="text" name="hospital_name" />
						<input type="button" value="검색" OnClick="openConfirmName(this.form)" />
					</td>
				</tr>
				<tr>
					<td> 병원 번호 </td>
					<td> <input type="text" name="hospital_no" onChange="hospital_no(this)" /></td>
				</tr>
				<%-- <tr>
					<td> 병원 주소 </td>
					<td> <textarea name="road_adr" rows="3" cols="40" onChange="road_adr(this)"></textarea></td>
				</tr>  --%>
				<tr>
					<td> 영업시간 </td>
					<td> <textarea name="hospital_hours" rows="10" cols="40"></textarea></td>
				</tr>
				<tr>
					<td> 병원 전화번호 </td>
					<td> <input type="text" name="hospital_call" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"> 
						<input type="hidden" name="doc_mail" value="${doc_mail}" />
						<input type="submit" value="수정" />
						<input type="reset" value="다시작성" />
						<input type="button" value="리스트" onClick="window.location='/pet/admin/doclist.do'"/>
					</td>
				</tr>
			</table>
		</form>
		
		
	</c:if>
</body>
</html>