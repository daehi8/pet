<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>사전추가</h1>

<form method="post">
<label>번호</label>
<input type="text" name="animal_no" /><br/>

<label>동물</label>
<input type="text" name="animal_name" /><br/>

<label>음식</label>
<input type="text" name="animal_feed"/><br/>

<label>이유</label>
<textarea cols="70" rows="2" name="animal_reason"></textarea></br>
<button type="submit">작성하기</button>
</form>