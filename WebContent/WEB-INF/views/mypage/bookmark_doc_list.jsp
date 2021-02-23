<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${member !=null }">
 	<table width="900" border="1" align="center">
		<tr>
			<td width="200" rowspan="2">
				<input type="button" value="프로필 수정" onclick="location.href='/pet/member/member_info.do'">
			</td>
			<td> 
				${member.pen_name}
			</td>
		</tr>
		<tr>
			<td> 
				${member.email}
			</td>
		</tr>
		
	</table>
		
</c:if>
</body>
</html>