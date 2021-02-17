<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>체크리스트를 만들어보세요</h1>

<form method="post">
<label>체크 no.</label><input type="text" name="check_no"><br/>
<label>질문 번호</label><input type="text" name="quest_no"><br/>

<label>질문</label>
<textarea cols="70" rows="2" name="quest_title"></textarea><br/>
<label>답1</label>
<textarea cols="70" rows="2"  name="quest_ans1"></textarea><br/>
<label>답2</label>
<textarea cols="70" rows="2"  name="quest_ans2"></textarea><br/>
<label>답3</label>
<textarea cols="70" rows="2"  name="quest_ans3"></textarea><br/>
<label>답4</label>
<textarea cols="70" rows="2"  name="quest_ans4"></textarea><br/>
<label>답5</label>
<textarea cols="70" rows="2"  name="quest_ans5"></textarea>
<button type="submit"> 작성하기 </button>

</form>