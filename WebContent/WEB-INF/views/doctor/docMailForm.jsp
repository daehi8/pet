<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../nav2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>docMailForm</title>
</head>
<script language="JavaScript">
/* 	function email(doc_mail) {
		
	}
 */	function checkIt() {
	    var userinput = eval("document.userinput");
	    var mailCheck =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	    
	   if(!mailCheck.test(userinput.doc_mail.value)) {
	    	alert("이메일 형식에 맞지 않습니다");
		    return false;
	    }
	    
	    if(!userinput.doc_mail.value) {
	        alert("메일을 입력하세요");
	        return false;
	    }
	 	// 비번확인
	    if(userinput.doc_pw.value.length < 6 ) {
	    	alert("비밀번호는 6자 이상으로 설정해주세요");
	    	return false;
	    }
	    if(!userinput.doc_pw.value ) {
	        alert("비밀번호를 입력하세요");
	        return false;
	    }
	    if(userinput.doc_pw.value != userinput.doc_pw2.value){
	        alert("비밀번호가 일치하지 않습니다");
	        return false;
	    }
	    if(!userinput.doc_pw2.value) {
	    	alert("비밀번호확인을 해주세요");
	    	return false;
	    }
	}
	// 메일 중복 여부를 판단
	function openConfirmMail(userinput) {
	    // 메일 입력했는지 검사
	    if (userinput.doc_mail.value == "") {
	        alert("메일을 입력하세요");
	        return;
	    }
	    // url과 사용자 입력 id를 조합합니다.
	    url = "/pet/doctor/confirmMail.do?doc_mail=" + userinput.doc_mail.value ;
	    
	    // 새로운 윈도우를 엽니다.
	    open(url, "confirm", 
	    "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=300, height=200");
	}

</script>

<body>
<div style="margin-top: 40px; text-align: center">
<div class="p-5" style="width: 500px; display: inline-block;">
	<div><h2>의사 회원가입</h2>
           <small>대한민국에 계시는 의사 선생님이라면 누구나 가입 가능합니다.</small></div>
           <br>
	<form action="docMailPro.do" method="post" name="userinput" onSubmit="return checkIt()" >
	<div class="form-group">
	<input class="form-control" type="text" name="doc_mail" onChange="email(this)" placeholder="이메일 주소" />
	<small id="emailHelp" class="form-text text-muted" style="text-align: left">입력하신 이메일 주소로 <strong>이메일 인증</strong>이 진행됩니다.</small>
	<input class="btn btn-light w-100" style="margin-top:5px;" type="button" name="confirmMail" value="이메일 중복확인" OnClick="openConfirmMail(this.form)">
	
	</div>

		<div class="form-group">
    	<input type="password" class="form-control" id="pw" name="doc_pw" placeholder="비밀번호" />
		</div>
		     <div class="form-group">
    	<input type="password" class="form-control" id="doc_pw2" placeholder="비밀번호 재확인" />
  	</div>
		<input class="btn btn-dark text-white w-100" type="submit" value="인증 메일 전송하기" />
	</form>
	</div>
	</div>
</body>
</html>