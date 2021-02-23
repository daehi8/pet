<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>confirmName</title>
</head>
<script language="javascript">

	/* function setroad_adr(addr) {		
		opener.document.userinput.road_adr.value = addr;
		self.close();
	} */
	function setNum(num) {		
		opener.document.userinput.hospital_no.value = num;
		self.close();
	}

</script>

<body>

	<c:if test="${nameCount == 0}">
		검색 된 상호명이 없습니다.
	</c:if>
	<c:if test="${nameCount > 0 }">
		<table class="table" style="text-align:center;">
			<tr>
				<td style="width:15%"> 병원번호 </td>
				<td style="width:20%"> 병원 이름 </td>
				<td style="width:50%"> 주소 </td>
				<td> 선택 </td>
			</tr>
			<c:forEach var="hospital" items="${nameList}" >
				<tr>
					<td width="80"> ${hospital.no} </td>
					<td width="100"> ${hospital.name}</td>
					<td width="300"> ${hospital.road_adr} </td>
					<%-- <td align="center"> <input type="button" value="선택 " onclick="setroad_adr('${hospital.road_adr}')" /></td>  --%>
					<td align="center"> <input type="button" value="선택 " onclick="setNum('${hospital.no}')" /></td> 
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>