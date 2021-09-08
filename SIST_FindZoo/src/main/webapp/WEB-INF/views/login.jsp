<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<h2>로그인</h2>
	<hr>
	<form action="login.do" method="post">
		아이디 : <input type="text" name="member_id"><br>
		암호 : <input type="password" name="member_pwd"><br>
		<input type="submit" value="로그인">
		<a href="join.jsp">회원가입</a>
		<button id="find-id" >아이디 찾기</button>
		<button id="find-pw">비밀번호 찾기</button>
	</form>
</body>
</html>