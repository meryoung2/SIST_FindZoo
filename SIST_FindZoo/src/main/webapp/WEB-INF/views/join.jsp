<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./yymmdd.js"></script>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="/join.do" method="post">
	
		<p>[필수] 회원 정보</p>
		
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" >
		<label for="id">아이디</label>
		<input type="text" id="member_id" name="member_id" required="required">
		<button id="check-id" disabled="disabled">중복 확인</button><br>
		
		
		<label for="pw">비밀번호</label>
		<input type="password" id="member_pwd" name="member_pwd" required="required"><br>
		<label for="check-pw">비밀번호 확인</label> 
		<input type="password" id="member_pwd_check" name="member_pwd_check" required="required"><br>
				
				
		<label for="name">이름</label>
		<input type="text" id="member_name" name="member_name" required="required"><br>
		
		
		<label for="nick">닉네임</label>
		<input type="text" id="member_nick" name="member_nick" required="required"><br>
		
		
		<label for="tel">연락처</label> 
		<input type="text" name="member_phone" maxlength="12" required="required">
		<span>*숫자만 입력</span><br>
		
		<label for="sms-alert">알림 서비스</label>
		<input type="radio" id="member_sms-y" name="member_sms" value="동의" checked="checked">동의
		<input type="radio" id="member_sms-n" name="member_sms" value="비동의">비동의<br>

		<input type="hidden" name="role" value="user">
		<input type="submit" value="가입">
		<input type="reset" value="취소">
	</form>
</body>
</html>