<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>

	<div style="margin-top: 40px;text-align: center">
	<div class="p-4" style="width: 1000px; display: inline-block;">
	
	<table class="table">
		<thead>
			<tr>
			<td scope="col">${dto.num}</td>	
			<td scope="col" style="width:50%"><strong>${dto.subject}<br></strong>
			${dto.id}</td>
			<td scope="col" style="width:50%" class="text-right">조회: ${dto.cnt}<br>
			</td>
			</tr>
		<tbody>
    <tr>
      <td colspan="3">${dto.contents }</td>
    </tr>
    </tbody>
    </table>
    
	<c:if test="${dto.boardimage != null }" >
	<img src="/pet/resource/noticeBoardFile/${dto.boardimage}"> <br />
	</c:if>
	

	<input class="btn btn-dark" style="float: left;" type="button" value="목록" onclick="window.location='/pet/boardfree/list.do'" />
	<c:if test="${sessionScope.member.email == dto.email ||sessionScope.doctorMail == dto.email || sessionScope.member.approval_status == 2}">
	<input class="btn btn-outline-dark" style="float: right; margin-right:10px" type="button" value="삭제" onclick="window.location='/pet/boardfree/deleteForm.do?num=${dto.num}'" />		
	<input class="btn btn-dark" style="float: right; margin-right:2px" type="button" value="수정" onclick="window.location='/pet/boardfree/updateForm.do?num=${dto.num}'" />
	</c:if>
	
	<br>
	<br>
	<!--댓글--> 	
	<table class="table">
	<c:forEach items= "${reply}" var="list">
		<thead>
			<tr>
			<c:if test="${sessionScope.doctorMail == null  && sessionScope.member == null}">
				<script>
					alert("로그인 하신 후에 사용해주세요");
					location.href="/pet/member/login.do";
				</script>		
 			</c:if>
 			<th scope="col" style="width:50%">${list.rno}. ${list.writer}</th>
			<td scope="col" style="width:50%" class="text-right">
			<c:if test="${sessionScope.member.pen_name == list.writer || sessionScope.doctorMail == list.writer || sessionScope.member.approval_status == 2}">
				<input class="btn btn-outline-dark" type="button" value="삭제" onclick="window.location='deleteReplyPro.do?rno=${list.rno}&num=${dto.num}'"><br>
			</c:if>
			</td>
			</tr>
		<tbody>
    	<td colspan="2">${list.content}</td>	
    </tbody>
    </c:forEach>    
    </table>
	<form action="writeReplyPro.do" method="post">
		<input type="text" id="rcontent" name="content" 
		style="text-align:center; width:900px; height:50px;">
		<input type="hidden"  name="writer" value="${sessionScope.member.pen_name}${sessionScope.doctorMail}">
		<input type="hidden" name="num" value="${dto.num}">
		<br>
		<br>
		<input class="btn btn-dark p-2 w-50" type="submit" value="댓글 쓰기">
	</form>
	
		
		
	</div>
	</div>