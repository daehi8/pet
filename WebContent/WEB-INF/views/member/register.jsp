<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script>
	$(function(){
		$("#joinForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		})
		
		$("#pw2").blur(function(){
			var htmls ="";
			if($("#pw").val() == $("#pw2").val()){
				
					htmls = '<font color="green">사용가능합니다</font>';
					$("#pw_ok").html(htmls);
					
					$("#pw_bad").html("");
				
			}else{
				htmls = '<font color="red">비밀번호가 다릅니다</font>';
				$("#pw_bad").html(htmls);
				$("#pw_ok").html("");
				$("#pw2").val("");
			}
		})
		
		
		$("#email").keyup(function(){
			$.ajax({
				url : "/pet/member/check_email.do",
				type : "POST",
				data : {
					email : $("#email").val()
				},
				success : function(result) {
					if (result == 1) {
						$("#email_check").html("중복된 이메일이 있습니다.");
						$("#joinBtn").attr("disabled", "disabled");
					} else {
						$("#email_check").html("");
						
					}
				},
			})
		});
		// 체크박스 전체 선택
		$(".checkbox_group").on("click", "#check_all", function () {
		    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
		    $("#joinBtn").removeAttr("disabled");
		});
		/* // 체크박스 전체 선택
		$(".checkbox_group").on("click", "#check_all", function () {
		    $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
		});
 */
		/* // 체크박스 개별 선택
		$(".checkbox_group").on("click", ".normal", function() {
		    var is_checked = true;

		    $(".checkbox_group .normal").each(function(){
		        is_checked = is_checked && $(this).is(":checked");
		    });

		    $("#check_all").prop("checked", is_checked);
		}); */
	})
</script>

<title>회원가입 폼</title>
</head>
<body>
<div style="margin-top: 40px; text-align: center">
<div class="p-5" style="width: 500px; display: inline-block;">
	<h5>3초 회원가입으로<br>164,894건의 리뷰를 확인하세요</h5></br>
				<form id="joinForm" action="/pet/member/join_member.do" method="post">
				<div class="form-group">						
				<input class="form-control" type="email" id="email" name="email" placeholder="이메일 주소">
				</div>
				<div class="form-group">
				<input class="form-control" id="pw" name="pw" type="password" placeholder="비밀번호">
				</div>
				<div class="form-group">
				<input class="form-control" id="pw2" type="password" placeholder="비밀번호 재확인">
				</div>
				<div class="checkbox_group">
	
						  <input type="checkbox" id="check_all" >
						  <label for="check_all">전체 동의</label>
						  
						  <input type="checkbox" id="check_1" class="normal" >
						  <label for="check_1">개인정보 처리방침 동의</label>
						  
						  <label for="check_2">서비스 이용약관 동의</label>
						  
						  <input type="checkbox" id="check_3" class="normal" >
						  <label for="check_3">마케팅 수신 동의</label>
					</div>

				<button type="submit" id="joinBtn" class="btn btn-dark text-white w-100">회원가입 완료</button>
				<p>이미 우리 회원이신가요?  <a href = "/pet/member/login.do">로그인</a> </p> <br />
				</form>
			</div>
				
		</div>
</body>
</html>
