<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
* {
  box-sizing: border-box;
}
/* Style the search field */
form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

/* Style the submit button */
form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('/pet/resources/img/starrate.png');
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: orange;
}
</style>

</head>
<body>
<script>
document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    const rateForms = document.querySelectorAll('.rating'); /* 별점 선택 템플릿을 모두 선택 */
	rateForms.forEach(function(item){//클릭 이벤트 리스너 각각 등록
		item.addEventListener('click',function(e){
			let elem = e.target;
			if(elem.classList.contains('rate_radio')){
				rating.setRate(elem.parentElement, parseInt(elem.value)); // setRate() 에 ".rating" 요소를 첫 번째 파라메터로 넘김
			}
		})
	});
});


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(rateobj, newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
	let checks = null;
	//요소가 파라메터로 넘어오면 별점 클릭, 없으면 저장 후 전체 초기화
	if(rateobj){
		rateobj.querySelector('.ratefill').style.width = parseInt(newrate * 60) + 'px'; // 현재 별점 갯수 채색
		checks = rateobj.querySelectorAll('.rate_radio'); // 넘어온 요소 하위의 라디오버튼만 선택
	}else{
		//전체 별점 채색 초기화
		const rateFills = document.querySelectorAll('.ratefill');
		rateFills.forEach(function(item){
			item.style.width = parseInt(newrate * 60) + 'px';
		});
		//전체 라디오 버튼 초기화
		checks = document.querySelectorAll('.rate_radio');
	}
	//별점 체크 라디오 버튼 처리
	if(checks){
		checks.forEach(function(item, idx){
			if(idx < newrate){
				item.checked = true;
			}else{
				item.checked = false;
			}
		});		
	}
}

let rating = new Rating();//별점 인스턴스 생성

// 선택한 별점 값 컨트롤러로 전송

	function ratingSubmit() {
		var ratingName = ['kind', 'waiting', 'clean', 'detail', 'price', 'after'];
		var ratingChk = ['kindChk', 'waitingChk', 'cleanChk', 'detailChk', 'priceChk', 'afterChk'];
		
		for(var i = 0; i < ratingName.length; i++){
		    var obj = $('[name='+ratingChk[i]+']');
		    var chkArray = new Array(); // 배열 선언
		
		    $('input:checkbox[name='+ratingChk[i]+']:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
		        chkArray.push(this.value);
		    });
		    
		    var maxValue = Math.max.apply(null, chkArray);
		    document.getElementById(ratingName[i]).value = maxValue;
		}
		
		var theForm = document.forms['reviewForm'];
		var input   = document.createElement('input');
	
		input.type   = 'hidden';
		input.name  = 'cart_num';
		input.value  = $();
		
		theForm.appendChild(input);
	}

</script>

	<form name="reviewForm" method = "post" enctype="multipart/form-data"  action="/pet/review/insertreviewpro.do" onsubmit="ratingSubmit()";>
		<!-- 테스트용 코드 -->
		<input type="hidden" name="member_email" value="test">
						
		<div>
			병원 이름 :
			<input type="text" name="hospital_name"> <br />
			의사 이름 :
			<input type="text" name="doc_name"> <br />
			
			인증사진
			<input type="file" name="auth">
		</div>
		
		<div class="review_rating">
		<h3>평점</h3>
			<div>친절함</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="kindChk" id="rating11" value="1" class="rate_radio" title="1점">
                <label for="rating11"></label>
                <input type="checkbox" name="kindChk" id="rating12" value="2" class="rate_radio" title="2점">
                <label for="rating12"></label>
                <input type="checkbox" name="kindChk" id="rating13" value="3" class="rate_radio" title="3점" >
                <label for="rating13"></label>
                <input type="checkbox" name="kindChk" id="rating14" value="4" class="rate_radio" title="4점">
                <label for="rating14"></label>
                <input type="checkbox" name="kindChk" id="rating15" value="5" class="rate_radio" title="5점">
                <label for="rating15"></label>
                <input type="hidden" name="kind" id="kind" value="0"> 
            </div>
        </div>
	
		<div class="review_rating">
			<div>대기시간</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="waitingChk" id="rating21" value="1" class="rate_radio" title="1점">
                <label for="rating21"></label>
                <input type="checkbox" name="waitingChk" id="rating22" value="2" class="rate_radio" title="2점">
                <label for="rating22"></label>
                <input type="checkbox" name="waitingChk" id="rating23" value="3" class="rate_radio" title="3점" >
                <label for="rating23"></label>
                <input type="checkbox" name="waitingChk" id="rating24" value="4" class="rate_radio" title="4점">
                <label for="rating24"></label>
                <input type="checkbox" name="waitingChk" id="rating25" value="5" class="rate_radio" title="5점">
                <label for="rating25"></label>
                <input type="hidden" name="waiting" id="waiting" value="0">
            </div>
        </div>
        
		<div class="review_rating">
			<div>청결함</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="cleanChk" id="rating31" value="1" class="rate_radio" title="1점">
                <label for="rating31"></label>
                <input type="checkbox" name="cleanChk" id="rating32" value="2" class="rate_radio" title="2점">
                <label for="rating32"></label>
                <input type="checkbox" name="cleanChk" id="rating33" value="3" class="rate_radio" title="3점" >
                <label for="rating33"></label>
                <input type="checkbox" name="cleanChk" id="rating34" value="4" class="rate_radio" title="4점">
                <label for="rating34"></label>
                <input type="checkbox" name="cleanChk" id="rating35" value="5" class="rate_radio" title="5점">
                <label for="rating35"></label>
                <input type="hidden" name="clean" id="clean" value="0">
            </div>
        </div>
        
        <div class="review_rating">
			<div>진료설명</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="detailChk" id="rating41" value="1" class="rate_radio" title="1점">
                <label for="rating41"></label>
                <input type="checkbox" name="detailChk" id="rating42" value="2" class="rate_radio" title="2점">
                <label for="rating42"></label>
                <input type="checkbox" name="detailChk" id="rating43" value="3" class="rate_radio" title="3점" >
                <label for="rating43"></label>
                <input type="checkbox" name="detailChk" id="rating44" value="4" class="rate_radio" title="4점">
                <label for="rating44"></label>
                <input type="checkbox" name="detailChk" id="rating45" value="5" class="rate_radio" title="5점">
                <label for="rating45"></label>
                <input type="hidden" name="detail" id="detail" value="0">
            </div>
        </div>
        
        <div class="review_rating">
			<div>가격</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="priceChk" id="rating51" value="1" class="rate_radio" title="1점">
                <label for="rating51"></label>
                <input type="checkbox" name="priceChk" id="rating52" value="2" class="rate_radio" title="2점">
                <label for="rating52"></label>
                <input type="checkbox" name="priceChk" id="rating53" value="3" class="rate_radio" title="3점" >
                <label for="rating53"></label>
                <input type="checkbox" name="priceChk" id="rating54" value="4" class="rate_radio" title="4점">
                <label for="rating54"></label>
                <input type="checkbox" name="priceChk" id="rating55" value="5" class="rate_radio" title="5점">
                <label for="rating55"></label>
                <input type="hidden" name="price" id="price" value="0">
            </div>
        </div>
        
        <div class="review_rating">
			<div>치료후 결과</div>
            <div class="rating">
            	<div class="ratefill" style="width: 300px;"></div>
                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
                <input type="checkbox" name="afterChk" id="rating61" value="1" class="rate_radio" title="1점">
                <label for="rating61"></label>
                <input type="checkbox" name="afterChk" id="rating62" value="2" class="rate_radio" title="2점">
                <label for="rating62"></label>
                <input type="checkbox" name="afterChk" id="rating63" value="3" class="rate_radio" title="3점" >
                <label for="rating63"></label>
                <input type="checkbox" name="afterChk" id="rating64" value="4" class="rate_radio" title="4점">
                <label for="rating64"></label>
                <input type="checkbox" name="afterChk" id="rating65" value="5" class="rate_radio" title="5점">
                <label for="rating65"></label>
                <input type="hidden" name="after" id="after" value="0">
            </div>
        </div>
        		
		<div>
			의사리뷰
			<textarea name="docter_review"></textarea><br>
			
			병원리뷰
			<textarea name="hospital_review"></textarea><br>
			
			한줄평 
			<input type="text" name="summary" maxlength="30"><br>
		</div>
		
		<div>
		    <h4>진료 가격</h4>
			<table id="list_table">
				<colgroup>
					<col style="width: 200px">
					<col style="width: 300px">
					<col style="width: 200px">	
				</colgroup>
				
				<thead>
					<tr>
						<th>진료 과목</th>
						<th>가격</th>
					</tr>
				</thead>
				
				<tbody>
				</tbody>
			</table>		
		</div>
		
		<div id="priceReview">
			<input type="text" id="add_subject" placeholder ="진료 과목">
			<input type="text" id="add_price" placeholder="가격" >
			<button type="button" id="append_row">추가</button>
   		</div>
   		
   		<div>
			<h4>재방문 추천</h4>	
			<input type="radio" name="revisit" value="Y">YES
			<input type="radio" name="revisit" value="N">NO
		</div>
		
		<div>
			<h4>병원사진</h4>
			<input multiple="multiple" type="file" name="hospital" maxlength="3">
			
			<h4>치료사진</h4>
			<input multiple="multiple" type="file" name="cure" maxlength="3">
		</div>
		
		<div>
			<h4>나의 페이지에 공개</h4>
			<input type="checkbox" name="public_check" value="Y">나의페이지에공개
		</div>
		<input type="submit" value="확인"/>
	</form>
</body>
<script type="text/javascript">

// 추가
$("#append_row").on("click", function() {
	var subject = $("#add_subject").val();
	var price = $("#add_price").val()
	$("#list_table").append(
		$("<tr>").append(		
			$("<td>").append(subject),
			$("<td>").append(price),
			$("<td>").append(
				$("<button>").prop("type","button").addClass("delete-link").append("삭제")     
			),
			$("<td>").append("<input type='hidden' name='subject_info' value='"+subject+"'/>"),
			$("<td>").append("<input type='hidden' name='price_info' value='"+price+"'/>")
		)	
	);	
});

// 삭제
$("#list_table").on("click", ".delete-link", function () {
	$(this).parent().parent().remove();
});





</script>
</html>