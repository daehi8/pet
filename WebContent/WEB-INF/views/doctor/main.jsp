<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../nav2.jsp" %>
<%@ include file="../footer.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main</title>
</head>
<body>
	<c:if test="${sessionScope.doctorMail == null }">


        <div style="text-align: center;">
            <div style="width: 960px; display: inline-block">

                <h1 class="d-flex justify-content-center" style="margin-bottom:2rem; margin-top:6rem; font-size: 3rem; font-weight: bold;">
                    모두닥의 의사회원이 되어보세요
                </h1>

                <h3 style="color:#4c1192">가장 쉽고 빠르게, 환자들과 소통할 수 있습니다.</h3>
				<br>
				<br>
                <button type="button" class="btn btn-dark text-white w-50 p-2" onclick="window.location='/pet/doctor/docMailForm.do'">
                    지금 바로 무료 의사‍회원되기
                </button>

            </div>
        </div>
	</c:if>
	<c:if test="${sessionScope.doctorMail != null }">
	
   <div style="text-align: center;">
            <div style="width: 960px; display: inline-block">

                <h1 class="d-flex justify-content-center" style="margin-bottom:2rem; margin-top:6rem; font-size: 3rem; font-weight: bold;">
                ${doctor.doc_name}님 안녕하세요?
                </h1>
                
                </div>
                </div>
	</c:if>